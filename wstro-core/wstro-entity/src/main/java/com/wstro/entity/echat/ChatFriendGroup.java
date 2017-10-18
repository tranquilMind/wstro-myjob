package com.wstro.entity.echat;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 聊天好友群类
 * 
 * @author wangwh18
 *
 */
@TableName("echat_friend_group")
public class ChatFriendGroup implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 好友群ID
	 */
	@TableId(type = IdType.AUTO)
	private Long groupId;
	
	/**
	 * 好友群名称
	 */
	@TableField
	private String groupName;
	
	/**
	 * 删除状态
	 */
	@TableField
	private Integer deleteFlag;

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}
