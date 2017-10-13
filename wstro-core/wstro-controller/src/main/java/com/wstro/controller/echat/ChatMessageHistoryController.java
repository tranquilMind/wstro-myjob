package com.wstro.controller.echat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.plugins.Page;
import com.wstro.controller.base.AbstractController;
import com.wstro.entity.echat.ChatMessageHistory;
import com.wstro.service.echat.ChatMessageHistoryService;
import com.wstro.util.PageUtils;
import com.wstro.util.R;
import com.wstro.util.ShiroUtils;

/**
 * 聊天历史记录控制器
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@RestController
@RequestMapping("/chat/chatMessageHistory")
public class ChatMessageHistoryController extends AbstractController {

	@Resource
	private ChatMessageHistoryService chatMessageHistoryService;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String index(HttpServletRequest request, HttpServletResponse response) {
		if (ShiroUtils.isLogin()) {
			return "redirect:/admin/index.html";
		} else {
			return "chat/history.vm";
		}
	}

	@RequestMapping(params = { "getHistoryMessage" })
	@ResponseBody
	public R getHistoryMessage(Integer offset, Integer limit, String sort, String order) {
		offset = (offset / limit) + 1;
		Boolean flag = null; // 排序逻辑
		if (StringUtils.isNoneBlank(order)) {
			if (order.equalsIgnoreCase("asc")) {
				flag = true;
			} else {
				flag = false;
			}
		}
		Page<ChatMessageHistory> adminList = chatMessageHistoryService.queryListByPage(offset, limit, sort, flag);
		PageUtils pageUtil = new PageUtils(adminList.getRecords(), adminList.getTotal(), adminList.getSize(),adminList.getCurrent());
		return R.ok().put("page", pageUtil);
	}
}
