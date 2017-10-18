package com.wstro.controller.echat;

import java.util.HashMap;
import java.util.List;
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
		List<ChatBaseUser> imTSUsers = tsBaseUserService.queryList(new HashMap<String, Object>());
		for (int i = 0; i < imTSUsers.size(); i++) {
			if (((ChatBaseUser) imTSUsers.get(i)).getId().equals(getAdminId().toString())) {
				imTSUsers.remove(i);
			}
		}
		JSONObject jsonObjectData = new JSONObject();
		JSONObject mineData = new JSONObject();
		mineData.put("username", u.getUsername());
		mineData.put("id", getAdminId());
		mineData.put("status", "online");
		mineData.put("sign", "JEECG很棒!");
		mineData.put("avatar", u.getAvatarUrl());
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
