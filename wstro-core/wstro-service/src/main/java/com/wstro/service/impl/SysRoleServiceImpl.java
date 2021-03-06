package com.wstro.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wstro.dao.SysRoleDao;
import com.wstro.entity.SysRoleEntity;
import com.wstro.service.SysRoleMenuService;
import com.wstro.service.SysRoleService;
import com.wstro.service.SysUserRoleService;

/**
 * 角色
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleDao, SysRoleEntity> implements SysRoleService {

	@Resource
	private SysRoleMenuService sysRoleMenuService;
	@Resource
	private SysUserRoleService sysUserRoleService;

	@Override
	public List<SysRoleEntity> queryList(Map<String, Object> map) {
		return baseMapper.queryList(map);
	}

	@Override
	@Transactional
	public void save(SysRoleEntity role) {
		baseMapper.insert(role);
	}

	@Override
	@Transactional
	public void update(SysRoleEntity role) {
		baseMapper.updateNoMapper(role);
	}

	@Override
	@Transactional
	public void updateRolePrems(SysRoleEntity role) {
		// 更新角色与菜单关系
		sysRoleMenuService.saveOrUpdate(role.getRoleId(), role.getMenuIdList());
	}
	
	@Override
	@Transactional
	public void deleteBatch(Long[] roleIds) {
		baseMapper.deleteBatch(roleIds);
	}

	@Override
	public Page<SysRoleEntity> queryListByPage(Integer offset, Integer limit, String roleCode, String sort,
			Boolean order) {
		Wrapper<SysRoleEntity> wrapper = new EntityWrapper<SysRoleEntity>();
		if (StringUtils.isNoneBlank(sort) && null != order) {
			wrapper.orderBy(sort, order);
		}
		if (StringUtils.isNoneBlank(roleCode)) {
			wrapper.like("role_code", roleCode);
		}
		Page<SysRoleEntity> page = new Page<>(offset, limit);
		return this.selectPage(page, wrapper);
	}

}
