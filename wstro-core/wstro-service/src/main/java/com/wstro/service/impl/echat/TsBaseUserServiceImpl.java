package com.wstro.service.impl.echat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wstro.dao.echat.TsBaseUserDao;
import com.wstro.entity.echat.P3ImTSBaseUser;
import com.wstro.service.echat.TsBaseUserService;

/**
 * 聊天基础用户类
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@Service
public class TsBaseUserServiceImpl extends ServiceImpl<TsBaseUserDao, P3ImTSBaseUser> implements TsBaseUserService {

	@Resource
	private TsBaseUserDao dao;

	@Override
	public List<P3ImTSBaseUser> queryList(Map<String, Object> map) {
		return baseMapper.queryList(map);
	}

}
