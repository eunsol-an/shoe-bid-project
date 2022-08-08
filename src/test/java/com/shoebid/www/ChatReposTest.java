package com.shoebid.www;
import javax.inject.Inject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.shoebid.www.domain.ChatVO;
import com.shoebid.www.repository.ChatDAO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration (classes = {com.shoebid.www.config.RootConfig.class})
public class ChatReposTest {
	private static Logger log = LoggerFactory.getLogger(ReportReposTest.class);
	
	@Inject
	private ChatDAO cdao;
	
	@Test
	public void insertChatDummy() throws Exception {
		int isUp = cdao.insert(new ChatVO("1번방", 1, 3, 4, 1));
	}
	@Test
	public void insertChatDummy1() throws Exception {
		int isUp = cdao.insert(new ChatVO("ㅎㅇ(상대 메세지)", 1, 4, 3, 1));
	}
	@Test
	public void insertChatDummy2() throws Exception {
		int isUp = cdao.insert(new ChatVO("2번방", 1, 9, 10, 2));
	}
	@Test
	public void insertChatDummy3() throws Exception {
		int isUp = cdao.insert(new ChatVO("3번방", 1, 11, 12, 3));
	}
	@Test
	public void insertChatDummy4() throws Exception {
		int isUp = cdao.insert(new ChatVO("4번방", 1, 13, 14, 4));
	}
	
}