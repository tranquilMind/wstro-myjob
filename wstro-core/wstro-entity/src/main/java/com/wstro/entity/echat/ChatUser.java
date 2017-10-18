package com.wstro.entity.echat;

import java.io.Serializable;

/**
 *  聊天用户类
 * @author wangwh18
 *
 */
public class ChatUser extends ChatBaseUser implements Serializable {
	private static final long serialVersionUID = 1L;
	private String username;
	private String avatar;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

}