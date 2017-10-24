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
@TableName("layim_friend_group")
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

	/**
	 * 创建时间
	 */
	@TableField
	private Long createTime;
	
	/**
	 * 创建人id
	 */
	@TableField
	private Long createUserId;
	
	/**
	 * 修改时间
	 */
	@TableField
	private Long updateTime;
	
	/**
	 * 修改人id
	 */
	@TableField
	private Long updateUserId;
	
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

	public Long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public Long getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	public Long getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Long updateTime) {
		this.updateTime = updateTime;
	}

	public Long getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}

}
