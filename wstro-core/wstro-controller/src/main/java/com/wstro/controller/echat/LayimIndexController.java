package com.wstro.controller.echat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.wstro.controller.base.AbstractController;
import com.wstro.util.ShiroUtils;

/**
 * 聊天控制器
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@RestController
@RequestMapping("/layim/index")
public class LayimIndexController extends AbstractController {
	
	 @RequestMapping(method={RequestMethod.GET,RequestMethod.POST})
	  public String index(HttpServletRequest request, HttpServletResponse response) {
		     if (ShiroUtils.isLogin()) {
				return "redirect:/admin/index.html";
			} else {
				return "layim/main/index";
			}
	  }
}
