package com.shoebid.www.handler;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shoebid.www.domain.BidVO;
import com.shoebid.www.domain.ProductVO;
import com.shoebid.www.repository.BidDAO;
import com.shoebid.www.repository.MemberDAO;
import com.shoebid.www.repository.ProductDAO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@AllArgsConstructor
public class CloggingAuctionHandler {

	@Inject
	private ProductDAO pdao;
	@Inject
	private BidDAO bdao;
	@Inject
	private MemberDAO mdao;
	
	@Transactional
	//@Scheduled(cron = "0/10 * * * * *")
	public void cloggingAuction() throws Exception{
		
		List<ProductVO> list = pdao.selectAllList();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (ProductVO pvo : list) {
			try {
				Date now = new Date();
				Date endTime = df.parse(pvo.getEndTime());
				int result = now.compareTo(endTime);
				if (result > 0) {
					if (pvo.getHighestPrice() > 0) {
						pvo.setStatus(1);
					} else {
						pvo.setStatus(2); 
					}
					if(pvo.getHighestPrice()>0) {
					BidVO bvo = bdao.selectMaxBid(pvo);
					int isOk =bdao.updateBidStatusSuccess(bvo.getBno());
						isOk= mdao.updateGrade(pvo.getWriter(), 3);
						isOk= mdao.updateGrade(bvo.getBuyer(), 3);
					}
					int isOk = bdao.updateBidStatusFail(pvo.getPno());
					pdao.updateStatus(pvo);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
	 
}
