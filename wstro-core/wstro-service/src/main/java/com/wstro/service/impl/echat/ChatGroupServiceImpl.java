package com.wstro.service.impl.echat;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wstro.dao.echat.ChatGroupDao;
import com.wstro.dao.echat.TsBaseUserDao;
import com.wstro.entity.echat.ChatBaseUser;
import com.wstro.entity.echat.ChatGroup;
import com.wstro.service.echat.ChatGroupService;
/**
 * 聊天好友群类
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@Service
public class ChatGroupServiceImpl extends ServiceImpl<ChatGroupDao, ChatGroup> implements ChatGroupService {

	@Resource
	private ChatGroupDao dao;

	@Override
	public List<ChatGroup> queryList(Map<String, Object> map) {
		return baseMapper.queryList(map);
	}
}
