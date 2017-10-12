package com.wstro.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wstro.dao.SysUserLoginLogDao;
import com.wstro.entity.SysUserLoginLogEntity;
import com.wstro.service.SysUserLoginLogService;

/**
 * 用户登录日志
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@Service
public class SysUserLoginLogServiceImpl extends ServiceImpl<SysUserLoginLogDao, SysUserLoginLogEntity>
		implements SysUserLoginLogService {

	@Override
	public Page<SysUserLoginLogEntity> getSelf(Integer offset, Integer limit,String userCode, String sort,
			Boolean order) {
		Wrapper<SysUserLoginLogEntity> wrapper = new EntityWrapper<SysUserLoginLogEntity>();
		if (StringUtils.isNoneBlank(sort) && null != order) {
			wrapper.orderBy(sort, order);
		}
		if (StringUtils.isNoneBlank(userCode)) {
			wrapper.like("user_code", userCode);
		}
		Page<SysUserLoginLogEntity> page = new Page<>(offset, limit);
		return this.selectPage(page, wrapper);
	}

}
