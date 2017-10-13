package com.wstro.service.impl.echat;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wstro.dao.echat.ChatMessageHistoryDao;
import com.wstro.entity.SysUserEntity;
import com.wstro.entity.echat.ChatMessageHistory;
import com.wstro.service.echat.ChatMessageHistoryService;

/**
 * 聊天历史记录
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@Service
public class ChatMessageHistoryServiceImpl extends ServiceImpl<ChatMessageHistoryDao, ChatMessageHistory> implements ChatMessageHistoryService {

	@Resource
	private ChatMessageHistoryDao dao;

	@Override
	public Page<ChatMessageHistory> queryListByPage(Integer offset, Integer limit, String sort, Boolean order) {
		Wrapper<ChatMessageHistory> wrapper = new EntityWrapper<ChatMessageHistory>();
		if (StringUtils.isNoneBlank(sort) && null != order) {
			wrapper.orderBy(sort, order);
		}
		Page<ChatMessageHistory> page = new Page<>(offset, limit);
		return this.selectPage(page, wrapper);
	}

}
