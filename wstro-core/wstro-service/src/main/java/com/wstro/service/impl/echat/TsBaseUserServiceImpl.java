package com.wstro.service.impl.echat;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wstro.dao.echat.TsBaseUserDao;
import com.wstro.entity.echat.ChatBaseUser;
import com.wstro.service.echat.TsBaseUserService;

/**
 * 聊天用户类
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@Service
public class TsBaseUserServiceImpl extends ServiceImpl<TsBaseUserDao, ChatBaseUser> implements TsBaseUserService {

	@Resource
	private TsBaseUserDao dao;

	@Override
	public List<ChatBaseUser> queryList(Map<String, Object> map) {
		return baseMapper.queryList(map);
	}

	@Override
	public List<ChatBaseUser> queryFriendListByGroupId(Map<String, Object> map) {
		return baseMapper.queryFriendListByGroupId(map);
	}

	@Override
	public List<ChatBaseUser> queryUserListByGroupId(Map<String, Object> map) {
		return baseMapper.queryUserListByGroupId(map);
	}

}
