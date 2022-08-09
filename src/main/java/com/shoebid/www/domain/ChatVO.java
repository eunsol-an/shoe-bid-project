package com.shoebid.www.domain;
import org.apache.ibatis.type.Alias;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Alias("cvo")
@ToString
public class ChatVO {
	private long cno;
	private String content;
	private int readChk;
	private long sendNick;	
	private long recvNick;	
	private long room;
	private String sendAt;
	private String sendNickName;
	private String recvNickName;
	private long mno;
	private long maxroom;
	//post
	public ChatVO(String content, int readChk, long sendNick, long recvNick, long room) {
		this.content = content;
		this.readChk = readChk;
		this.sendNick = sendNick;
		this.recvNick = recvNick;
		this.room = room;
	}
	//list (AllArgsConstructor)
	
	
}