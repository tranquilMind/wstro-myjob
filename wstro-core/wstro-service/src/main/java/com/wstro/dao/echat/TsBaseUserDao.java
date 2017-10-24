package com.wstro.dao.echat;

import com.wstro.util.BaseDao;

import java.util.List;
import java.util.Map;

import com.wstro.entity.echat.ChatBaseUser;

/**
 * 聊天基础用户类
 *
 * @author wangwenhao
 *
 */
public interface TsBaseUserDao extends BaseDao<ChatBaseUser> {
	/**
	 * 根据好友组查询好友列表
	 * 
	 * @param map
	 *            Map
	 * @return List<P3ImTSBaseUser>
	 */
	List<ChatBaseUser> queryFriendListByGroupId(Map<String, Object> map);
	
	/**
	 * 根据群组id 查询组员列表
	 * 
	 * @param map
	 *            Map
	 * @return List<P3ImTSBaseUser>
	 */
	List<ChatBaseUser> queryUserListByGroupId(Map<String, Object> map);
}
