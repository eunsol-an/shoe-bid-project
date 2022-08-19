package com.shoebid.www.handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.shoebid.www.domain.ImageFileVO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@Component
public class ImageFileHandler {
	private final String UP_DIR = "C:\\_java\\lec\\_spring\\file_uploaded";
	
	public List<ImageFileVO> getImageFileList(MultipartFile[] files, boolean isProd) {
		LocalDate date = LocalDate.now();
		String today = date.toString();
		today = today.replace("-", File.separator);
		
		File folder = new File(UP_DIR, today);
		
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
		for (MultipartFile file : files) {
			ImageFileVO ivo = new ImageFileVO();
			ivo.setSaveDir(today);
			ivo.setImageSize(file.getSize());
			
			String originalImageName = file.getOriginalFilename();
			String onlyImageName = originalImageName.substring(
					originalImageName.lastIndexOf("\\")+1);
			ivo.setImageName(onlyImageName);
			
			UUID uuid = UUID.randomUUID();
			ivo.setUuid(uuid.toString());
			
			String fullImageName = uuid.toString() + "_" + onlyImageName;
			File storeFile = new File(folder, fullImageName);
			
			try {
				file.transferTo(storeFile);
				if (isImageFile(storeFile)) {
					File thumbNail = new File(folder, uuid.toString() + "_th" + onlyImageName);
					if (isProd) {
						Thumbnails.of(storeFile).size(551, 551).toFile(thumbNail);
					} else {
						Thumbnails.of(storeFile).size(70, 70).toFile(thumbNail);
					}
				}
			} catch (Exception e) {
				log.debug(">>> File 객체 물리디스크에 저장 실패");
				e.printStackTrace();
			}
			fileList.add(ivo);
		}
		return fileList;
	}

	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType = new Tika().detect(storeFile);
		return mimeType.startsWith("image") ? true : false;
	}
}
