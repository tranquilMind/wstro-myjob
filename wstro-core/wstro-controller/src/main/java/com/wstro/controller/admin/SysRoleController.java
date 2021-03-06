package com.wstro.controller.admin;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import com.wstro.util.DateUtils;
import com.wstro.util.JoeyUtil;
import com.wstro.util.PageUtils;
import com.wstro.util.R;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.plugins.Page;
import com.wstro.controller.base.AbstractController;
import com.wstro.entity.SysRoleEntity;
import com.wstro.service.SysRoleMenuService;
import com.wstro.service.SysRoleService;

/**
 * 角色管理
 *
 * @author wangwenhao
 * @date 2017-09-28
 *
 */
@RestController
@RequestMapping("/admin/sys/role")
public class SysRoleController extends AbstractController {

	@Resource
	private SysRoleService sysRoleService;
	@Resource
	private SysRoleMenuService sysRoleMenuService;

	/**
	 * 角色列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:role:list")
	public R list(Integer offset, Integer limit, String sort, String order,
				  @RequestParam(name = "search", required = false) String roleName) {
		offset = (offset / limit) + 1;
		Boolean flag = null; // 排序逻辑
		if (StringUtils.isNoneBlank(order)) {
			if (order.equalsIgnoreCase("asc")) {
				flag = true;
			} else {
				flag = false;
			}
		}
		Page<SysRoleEntity> roleList = sysRoleService.queryListByPage(offset, limit, roleName, sort, flag);
		PageUtils pageUtil = new PageUtils(roleList.getRecords(), roleList.getTotal(), roleList.getSize(),
				roleList.getCurrent());
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 角色列表
	 */
	@RequestMapping("/select")
	@RequiresPermissions("sys:role:select")
	public R select() {
		// 查询列表数据
		List<SysRoleEntity> list = sysRoleService.queryList(new HashMap<String, Object>());

		return R.ok().put("list", list);
	}

	/**
	 * 角色信息
	 */
	@RequestMapping("/info/{roleId}")
	@RequiresPermissions("sys:role:info")
	public R info(@PathVariable("roleId") Long roleId) {
		SysRoleEntity role = sysRoleService.selectById(roleId);

		// 查询角色对应的菜单
		List<Long> menuIdList = sysRoleMenuService.queryMenuIdList(roleId);
		role.setMenuIdList(menuIdList);

		return R.ok().put("role", role);
	}

	/**
	 * 保存角色
	 * 
	 * @throws ParseException
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:role:save")
	public R save(String roleCode,String roleName, String remark) throws ParseException {
		if (StringUtils.isBlank(roleCode)) {
			return R.error("角色编码不能为空");
		}
		SysRoleEntity roleEntity = new SysRoleEntity();
		roleEntity.setRoleName(roleName);
		roleEntity.setRoleCode(roleCode);
		roleEntity.setRemark(remark);
		roleEntity.setCreateTime(JoeyUtil.stampDate(new Date(), DateUtils.DATE_TIME_PATTERN));
		sysRoleService.save(roleEntity);
		return R.ok();
	}

	/**
	 * 修改角色
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:role:update")
	public R update(Long roleId,String roleCode, String roleName, String remark) {
		if (StringUtils.isBlank(roleCode)) {
			return R.error("角色编码不能为空");
		}
		SysRoleEntity roleEntity = new SysRoleEntity();
		roleEntity.setRoleId(roleId);
		roleEntity.setRoleCode(roleCode);
		roleEntity.setRoleName(roleName);
		roleEntity.setRemark(remark);
		sysRoleService.update(roleEntity);
		return R.ok();
	}

	/**
	 * 角色授权
	 * 
	 * @throws ParseException
	 */
	@RequestMapping("/prems")
	@RequiresPermissions("sys:menu:perms")
	public R save(Long roleId, @RequestParam("menuIds") String ids) throws ParseException {
		if (roleId == null ) {
			return R.error("角色id不能为空");
		}
		SysRoleEntity roleEntity = new SysRoleEntity();
		roleEntity.setRoleId(roleId);
		JSONArray jsonArray = JSONArray.parseArray(ids);
		Long[] menuId = toArrays(jsonArray);
		List<Long> menuIds = new ArrayList<Long>();
		Collections.addAll(menuIds, menuId);
		if (menuIds.size() < 0) {
			return R.error("请为角色授权");
		}
		roleEntity.setMenuIdList(menuIds);
		sysRoleService.updateRolePrems(roleEntity);
		return R.ok();
	}
	
	/**
	 * 删除角色
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:role:delete")
	public R delete(@RequestParam("roleIds") String ids) {
		JSONArray jsonArray = JSONArray.parseArray(ids);
		Long[] roleIds = toArrays(jsonArray);
		sysRoleService.deleteBatch(roleIds);
		return R.ok();
	}

}
