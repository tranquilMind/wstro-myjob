package com.wstro.entity.echat;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 聊天历史消息
 * 
 * @author wangwh18
 *
 */
@TableName("layim_message_his")
public class ChatMessageHistory implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 历史消息ID
	 */
	@TableField
	private String id;
	/**
	 * 消息类型
	 */
	@TableField
	private String msgType;
	/**
	 * 消息数据
	 */
	@TableField
	private String msg;
	/**
	 * 消息发送者
	 */
	@TableField
	private String fromUser;
	/**
	 * 发送者的真实姓名
	 */
	@TableField
	private String fromName;
	/**
	 * 消息接收者
	 */
	@TableField
	private String toUser;
	/**
	 * 接收者的真实姓名
	 */
	@TableField
	private String toName;
	
	@TableField
	private String accountid;
	
	@TableField
	private Long createDate;
	
	@TableField
	private String createBy;

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsgType() {
		return this.msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getFromUser() {
		return this.fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getFromName() {
		return this.fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	public String getToUser() {
		return this.toUser;
	}

	public void setToUser(String toUser) {
		this.toUser = toUser;
	}

	public String getToName() {
		return this.toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getAccountid() {
		return this.accountid;
	}

	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}

	public Long getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Long createDate) {
		this.createDate = createDate;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
}
