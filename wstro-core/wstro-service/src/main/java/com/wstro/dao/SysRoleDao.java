package com.wstro.dao;

import com.wstro.entity.SysRoleEntity;
import com.wstro.util.BaseDao;

/**
 * 角色管理
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
public interface SysRoleDao extends BaseDao<SysRoleEntity> {

	/**
	 * 更新角色
	 * 
	 * @param role
	 *            SysRoleEntity
	 */
	void updateNoMapper(SysRoleEntity role);

}
