package com.wstro.service.echat;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.wstro.entity.SysUserEntity;
import com.wstro.entity.echat.ChatMessageHistory;

/**
 * 聊天历史记录
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
public interface ChatMessageHistoryService extends IService<ChatMessageHistory> {
	/**
	 * 查询聊天历史记录列表
	 * 
	 * @param offset
	 *            开始
	 * @param limit
	 *            条数
	 * @param sort
	 *            排序字段
	 * @param order
	 *            是否为升序
	 * @return Page<SysUserEntity>
	 */
	Page<ChatMessageHistory> queryListByPage(Integer offset, Integer limit, String sort,Boolean order);
}
