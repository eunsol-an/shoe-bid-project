package com.shoebid.www.service;
import java.util.List;
import com.shoebid.www.domain.ChatVO;
public interface ChatService {
	int post(ChatVO cvo);
	List<ChatVO> getList();
	List<ChatVO> spread(long room);
	ChatVO getDetail(long cno);
	int modify(ChatVO cvo);
	int remove(long cno);
	int getLastRoom();
}