package com.wstro.entity.echat;

import java.io.Serializable;
import java.util.Date;

/**
 *  聊天用户类
 * @author wangwh18
 *
 */
public class P3ImTSUser extends P3ImTSBaseUser implements Serializable {
	private static final long serialVersionUID = 1L;
	private String email;
	private String mobilephone;
	private String officephone;
	private String signaturefile;
	private String id;
	private String updateName;
	private Date updateDate;
	private String updateBy;
	private String createName;
	private Date createDate;
	private String createBy;

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilephone() {
		return this.mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getOfficephone() {
		return this.officephone;
	}

	public void setOfficephone(String officephone) {
		this.officephone = officephone;
	}

	public String getSignaturefile() {
		return this.signaturefile;
	}

	public void setSignaturefile(String signaturefile) {
		this.signaturefile = signaturefile;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUpdateName() {
		return this.updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getCreateName() {
		return this.createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
}