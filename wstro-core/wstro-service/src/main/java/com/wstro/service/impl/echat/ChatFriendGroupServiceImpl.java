package com.wstro.service.impl.echat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wstro.dao.echat.ChatFriendGroupDao;
import com.wstro.dao.echat.TsBaseUserDao;
import com.wstro.entity.echat.ChatBaseUser;
import com.wstro.entity.echat.ChatFriendGroup;
import com.wstro.service.echat.ChatFriendGroupService;
/**
 * 聊天好友群类
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@Service
public class ChatFriendGroupServiceImpl extends ServiceImpl<ChatFriendGroupDao, ChatFriendGroup> implements ChatFriendGroupService {

	@Resource
	private ChatFriendGroupDao dao;
	
	@Override
	public List<ChatFriendGroup> queryList(Map<String, Object> map) {
		return baseMapper.queryList(map);
	}

}
