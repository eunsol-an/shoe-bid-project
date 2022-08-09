package com.shoebid.www.repository;
import java.util.List;
import com.shoebid.www.domain.ChatVO;
public interface ChatDAO {
	int insert(ChatVO cvo);
	List<ChatVO> selectRoomList();
	List<ChatVO> selectList(long room);
	ChatVO selectOne(long cno);
	int update(ChatVO cvo);
	int delete(long cno);
	int selectLastRoom();
}