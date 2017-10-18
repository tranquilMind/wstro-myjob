package com.wstro.entity.echat;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 聊天群组类
 * 
 * @author wangwh18
 *
 */
@TableName("echat_group")
public class ChatGroup implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 *  聊天群组ID
	 */
	@TableId(type = IdType.AUTO)
	private Long groupId;
	
	/**
	 *  聊天群组名称
	 */
	@TableField
	private String groupName;
	
	/**
	 *  聊天群组头像
	 */
	@TableField
	private String avatar;
	
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

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
	
}
