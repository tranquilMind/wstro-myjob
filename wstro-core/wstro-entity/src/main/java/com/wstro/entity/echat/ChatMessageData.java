package com.wstro.entity.echat;

/**
 * 聊天消息数据包
 * @author wangwh18
 *
 */
public class ChatMessageData {
	private String msg;
	  private String from;
	  private String to;
	  private String fromName;
	  private String toName;
	  
	  public String getMsg()
	  {
	    return this.msg;
	  }
	  
	  public void setMsg(String msg)
	  {
	    this.msg = msg;
	  }
	  
	  public String getFrom()
	  {
	    return this.from;
	  }
	  
	  public void setFrom(String from)
	  {
	    this.from = from;
	  }
	  
	  public String getTo()
	  {
	    return this.to;
	  }
	  
	  public void setTo(String to)
	  {
	    this.to = to;
	  }
	  
	  public String getFromName()
	  {
	    return this.fromName;
	  }
	  
	  public void setFromName(String fromName)
	  {
	    this.fromName = fromName;
	  }
	  
	  public String getToName()
	  {
	    return this.toName;
	  }
	  
	  public void setToName(String toName)
	  {
	    this.toName = toName;
	  }
}
