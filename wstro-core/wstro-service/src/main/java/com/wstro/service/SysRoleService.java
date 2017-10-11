package com.wstro.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wstro.entity.SysRoleEntity;

/**
 * 角色
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
public interface SysRoleService extends IService<SysRoleEntity> {

	/**
	 * 查询角色列表
	 * 
	 * @param map
	 *            Map
	 * @return List<SysRoleEntity>
	 */
	List<SysRoleEntity> queryList(Map<String, Object> map);

	/**
	 * 根据角色ID删除角色
	 * 
	 * @param roleIds
	 *            角色ID
	 */
	void deleteBatch(Long[] roleIds);

	/**
	 * 保存角色
	 * 
	 * @param role
	 *            SysRoleEntity
	 */
	void save(SysRoleEntity role);

	/**
	 * 更新角色
	 * 
	 * @param role
	 *            SysRoleEntity
	 */
	void update(SysRoleEntity role);

	/**
	 * 更新角色的权限
	 * 
	 * @param role
	 *            SysRoleEntity
	 */
	void updateRolePrems(SysRoleEntity role);
	
	/**
	 * 查询角色列表
	 * 
	 * @param offset
	 *            开始
	 * @param limit
	 *            条数
	 * @param roleCode
	 *            角色编码
	 * @param sort
	 *            排序字段
	 * @param order
	 *            是否为升序
	 * @return Page<SysRoleEntity>
	 */
	Page<SysRoleEntity> queryListByPage(Integer offset, Integer limit, String roleCode, String sort, Boolean order);
}
