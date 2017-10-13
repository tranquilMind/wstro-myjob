package com.wstro.service.echat;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.wstro.entity.SysMenuEntity;
import com.wstro.entity.echat.P3ImTSBaseUser;

/**
 * 聊天基础用户类
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
public interface TsBaseUserService extends IService<P3ImTSBaseUser> {
	/**
	 * 查询用户类列表
	 * 
	 * @param map
	 *            Map
	 * @return List<P3ImTSBaseUser>
	 */
	List<P3ImTSBaseUser> queryList(Map<String, Object> map);
}
