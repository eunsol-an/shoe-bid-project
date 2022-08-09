package com.shoebid.www.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.shoebid.www.domain.ChatVO;
import com.shoebid.www.repository.ChatDAO;
@Service
public class ChatServiceImpl implements ChatService {
	@Inject
	private ChatDAO cdao;
	
	@Override
	public int post(ChatVO cvo) {
		return cdao.insert(cvo);
	}
	@Override
	public List<ChatVO> spread(long room) {
		return cdao.selectList(room);
	}
	
	@Override
	public List<ChatVO> getList() {
		return cdao.selectRoomList();
	}
	@Override
	public int modify(ChatVO cvo) {
		return cdao.update(cvo);
	}
	@Override
	public int remove(long cno) {
		return cdao.delete(cno);
	}
	@Override
	public ChatVO getDetail(long cno) {
		return cdao.selectOne(cno);
	}
	@Override
	public int getLastRoom() {
		return cdao.selectLastRoom();
	}
}
