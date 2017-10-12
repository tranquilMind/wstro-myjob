package com.wstro.controller.admin;

import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import com.wstro.util.PageUtils;
import com.wstro.util.R;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.plugins.Page;
import com.wstro.controller.base.AbstractController;
import com.wstro.entity.SysUserLoginLogEntity;
import com.wstro.service.SysUserLoginLogService;

/**
 * 系统用户登录日志
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@RestController
@RequestMapping("/admin/sys/log")
public class SysUserLoginLogController extends AbstractController {

	@Resource
	private SysUserLoginLogService sysUserLoginLogService;

	@RequestMapping("/list")
	@RequiresPermissions("sys:log:list")
	@ResponseBody
	public R list(Integer offset, Integer limit, String sort, String order,
				  @RequestParam(name = "search", required = false) String search, HttpServletRequest request) {
		String useCode = null;
		Map<String, String> searchList = parseObject(search, "q_userCode");
		if (null != searchList) {
			useCode = searchList.get("q_userCode");
		}
		offset = (offset / limit) + 1;
		Boolean flag = null; // 排序逻辑
		if (StringUtils.isNoneBlank(order)) {
			if (order.equalsIgnoreCase("asc")) {
				flag = true;
			} else {
				flag = false;
			}
		}
		Page<SysUserLoginLogEntity> self = sysUserLoginLogService.getSelf(offset, limit, useCode, sort,
				flag);
		PageUtils pageUtil = new PageUtils(self.getRecords(), self.getTotal(), self.getSize(), self.getCurrent());
		return R.ok().put("page", pageUtil);

	}
}
