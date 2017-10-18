package com.wstro.entity.echat;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 聊天基础用户类
 * 
 * @author wangwh18
 *
 */
@TableName("echat_user")
public class ChatBaseUser implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 聊天用户ID
	 */
	@TableId(type = IdType.AUTO)
	private String id;
	/**
	 * 签名
	 */
	@TableField
	private String sign;
	/**
	 * 在线状态(0：hide 隐身，1：online 在线)
	 */
	@TableField
	private Integer status;
	
	/**
	 * 用户ID
	 */
	@TableField
	private Long userId;
	
	/**
	 *  好友id
	 */
	@TableField
	private Long userFriendId;
	
	/**
	 * 好友组id
	 */
	@TableId
	private Long userFriendGroupId;
	
	/**
	 * 用户群组id
	 */
	@TableField
	private Long userGroupId;
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

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserFriendId() {
		return userFriendId;
	}

	public void setUserFriendId(Long userFriendId) {
		this.userFriendId = userFriendId;
	}

	public Long getUserFriendGroupId() {
		return userFriendGroupId;
	}

	public void setUserFriendGroupId(Long userFriendGroupId) {
		this.userFriendGroupId = userFriendGroupId;
	}

	public Long getUserGroupId() {
		return userGroupId;
	}

	public void setUserGroupId(Long userGroupId) {
		this.userGroupId = userGroupId;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
   
}
