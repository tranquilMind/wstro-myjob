package com.wstro.entity.echat;

/**
 * 聊天消息
 * @author wangwh18
 *
 */
public class ChatMessage {
	private String type;
	  private ChatMessageData data;
	  
	  public String getType()
	  {
	    return this.type;
	  }
	  
	  public void setType(String type)
	  {
	    this.type = type;
	  }
	  
	  public ChatMessageData getData()
	  {
	    return this.data;
	  }
	  
	  public void setData(ChatMessageData data)
	  {
	    this.data = data;
	  }
}
