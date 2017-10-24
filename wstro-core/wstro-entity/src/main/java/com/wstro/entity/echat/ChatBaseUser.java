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
@TableName("layim_user")
public class ChatBaseUser implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 聊天用户ID
	 */
	@TableId(type = IdType.AUTO)
	private Long userId;
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

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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
