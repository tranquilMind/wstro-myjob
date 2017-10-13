package com.wstro.entity.echat;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 聊天基础用户类
 * 
 * @author wangwh18
 *
 */
@TableName("t_s_base_user")
public class P3ImTSBaseUser implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 聊天用户ID
	 */
	@TableField
	private String id;
	/**
	 * 同步流程
	 */
	@TableField
	private Integer activitisync;
	/**
	 * 浏览器
	 */
	@TableField
	private String browser;
	/**
	 * 密码
	 */
	@TableField
	private String password;
	/**
	 * 真实名字
	 */
	@TableField
	private String realname;
	/**
	 * 签名
	 */
	@TableField
	private Object signature;
	/**
	 * 有效状态
	 */
	@TableField
	private Integer status;
	/**
	 * 用户KEY
	 */
	@TableField
	private String userkey;
	/**
	 * 用户账号
	 */
	@TableField
	private String username;
	/**
	 * 删除状态
	 */
	@TableField
	private Integer deleteFlag;

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getActivitisync() {
		return this.activitisync;
	}

	public void setActivitisync(Integer activitisync) {
		this.activitisync = activitisync;
	}

	public String getBrowser() {
		return this.browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Object getSignature() {
		return this.signature;
	}

	public void setSignature(Object signature) {
		this.signature = signature;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserkey() {
		return this.userkey;
	}

	public void setUserkey(String userkey) {
		this.userkey = userkey;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getDeleteFlag() {
		return this.deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
}
