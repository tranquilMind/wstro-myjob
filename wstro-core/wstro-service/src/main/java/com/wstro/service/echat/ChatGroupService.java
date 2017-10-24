package com.wstro.service.echat;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.wstro.entity.echat.ChatBaseUser;
import com.wstro.entity.echat.ChatGroup;

/**
 * 聊天群组类
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
public interface ChatGroupService extends IService<ChatGroup> {
	/**
	 * 根据userid查询聊天群组类列表
	 * 
	 * @param map
	 *            Map
	 * @return List<ChatGroup>
	 */
	List<ChatGroup> queryList(Map<String, Object> map);
}
