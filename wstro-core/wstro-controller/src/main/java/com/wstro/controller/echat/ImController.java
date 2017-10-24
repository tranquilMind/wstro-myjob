package com.wstro.controller.echat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.alibaba.fastjson.JSONObject;
import com.wstro.controller.base.AbstractController;
import com.wstro.entity.SysUserEntity;
import com.wstro.entity.echat.ChatBaseUser;
import com.wstro.service.echat.TsBaseUserService;
import com.wstro.util.R;
import com.wstro.util.ShiroUtils;

/**
 * 聊天控制器
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@RestController
@RequestMapping("/admin/chat/imController")
public class ImController extends AbstractController {
	
	@Resource
	private TsBaseUserService tsBaseUserService;
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String index(HttpServletRequest request, HttpServletResponse response){
		if (ShiroUtils.isLogin()) {
			return "redirect:/admin/index.html";
		} else {
			return "chat/index.vm";
		}
	}

	@ResponseBody
	@RequestMapping(params = { "getUsers" }, method = { RequestMethod.GET, RequestMethod.POST })
	public R getUsers(HttpServletResponse response, HttpServletRequest request) throws Exception {
		SysUserEntity u = getAdmin();		
		//获取当前登录用户对应的echat用户
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userId", getAdminId());
		List<ChatBaseUser> imTSUsers = tsBaseUserService.queryList(param);
		//定义json装载登录用户信息		
		JSONObject mineData = new JSONObject();
		mineData.put("username", u.getUsername());
		mineData.put("id", getAdminId());
		mineData.put("status", imTSUsers.get(0));
		mineData.put("sign", "JEECG很棒!");
		mineData.put("avatar", "../"+u.getAvatarUrl());
		JSONObject jsonObjectData = new JSONObject();
		jsonObjectData.put("mine", mineData);
		jsonObjectData.put("friend", imTSUsers);
		jsonObjectData.put("group", "");
		return R.ok().put("data", jsonObjectData);
	}

	@ResponseBody
	@RequestMapping(params = { "getUserid" }, method = {RequestMethod.GET,RequestMethod.POST })
	public R getUserid() {
		logger.info("当前登录人id为" + getAdminId());
		return R.ok().put("id", getAdminId().toString());
	}

}
