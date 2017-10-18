package com.wstro.service.echat;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.wstro.entity.echat.ChatFriendGroup;
import com.wstro.entity.echat.ChatGroup;

/**
 * 聊天好友群类
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
public interface ChatFriendGroupService extends IService<ChatFriendGroup> {

	/**
	 * 查询聊天好友群类列表
	 * 
	 * @param map
	 *            Map
	 * @return List<ChatFriendGroup>
	 */
	List<ChatFriendGroup> queryList(Map<String, Object> map);
}
