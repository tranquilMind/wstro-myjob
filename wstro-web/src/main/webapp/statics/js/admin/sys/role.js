$(function() {
	// BootStrap验证
	$('#form').bootstrapValidator({
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			'roleName' : {
				validators : {
					notEmpty : {
						message : '角色名称不能为空'
					}
				}
			},
			'roleCode' : {
				validators : {
					notEmpty : {
						message : '角色编码不能为空'
					}
				}
			},
			'remark' : {
				validators : {
					notEmpty : {
						message : '备注不能为空'
					}
				}
			}
		}
	});
});

var handle = $("#handle");
var data_update = $(handle).attr("data-update");
var data_delete = $(handle).attr("data-delete");
var data_perms = $(handle).attr("data-perms");
// BootStrapTable自定义操作
function actionFormatter(value, row, index) {
	var result = new Array();
	if (null != data_update) {
		result[0] = '<a class="edit text-warning" href="javascript:void(0)" title="编辑">'
				+ '<i class="glyphicon glyphicon-edit"></i>编辑' + '</a> ';
	}
	if (null != data_delete) {
		result[1] = '<a class="remove text-danger" href="javascript:void(0)" title="删除">'
				+ '<i class="glyphicon glyphicon-remove"></i>删除' + '</a> ';
	}
	if (null != data_perms) {
		result[2] = '<a class="accredit text-prems" href="javascript:void(0)" title="授权">'
				+ '<i class="glyphicon glyphicon-cog"></i>授权' + '</a>';
	}
	return result.join('');
}

// Table操作
window.actionEvents = {
	// 编辑
	'click .edit' : function(e, value, row, index) {
		role_update(index, row);
	},
	// 删除
	'click .remove' : function(e, value, row, index) {
		role_delete(index, row.roleId);
	},
	// 授权
	'click .accredit' : function(e, value, row, index) {
		role_accredit(index, row.roleId);
	}
};

/*
 * 删除角色
 */
function role_delete(index, value) {
	var roleIds = new Array();
	roleIds[0] = value;
	layer.confirm('确认要删除该角色吗？', {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : 'role/delete?roleIds=' + JSON.stringify(roleIds),
			success : function(result) {
				if (result.code === 0) {
					$('#table').bootstrapTable('hideRow', {
						index : index
					});
					layer.msg('该角色删除成功!', {
						icon : 1,
						time : 1000
					});
				} else {
					layer.alert(result.msg, {
						icon : 2
					});
				}
			}
		})
	});
}

/*
 * 修改角色
 */
function role_update(index, value) {
	layer_show("修改角色", $("#showHandle"), 500, 400);
	$("input[name='roleCode']").val(value.roleCode);
	$("input[name='roleName']").val(value.roleName);
	$("input[name='remark']").val(value.remark);
	getMenuTree(value.roleId);
}

/*
 * 角色授权
 */
function role_accredit(index, value) {
	layer_show("角色授权", $("#accreditMenu"), 800, 620);
	getMenuTree(value);
}

/**
 * 批量删除角色
 */
function del(tableName) {
	var s = $(tableName).bootstrapTable('getSelections');
	if (s.length < 1) {
		layer.alert('请至少选择一条数据', {
			icon : 2
		});
		return false;
	}
	var roleIds = new Array();
	for (var i = 0; i < s.length; i++) {
		roleIds[i] = s[i].roleId;
	}
	layer.confirm('确认要删除选中的角色吗？', {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : 'role/delete?roleIds=' + JSON.stringify(roleIds),
			success : function(result) {
				if (result.code === 0) {
					layer.msg('删除成功!', {
						icon : 1,
						time : 1000
					}, function() {
						location.reload();
					});
				} else {
					layer.alert(result.msg, {
						icon : 2
					});
				}
			}
		})
	});
}

/**
 * 保存或更新
 */
function saveOrUpdate(e) {// 获取选择的菜单
	loadingButton($(e));
	if (!validateForm($("#form"))) {
		return false;
	}
	var roleId = $("input[name='roleId']").val();
	roleId = roleId == "" ? null : roleId;
	var roleCode = $("input[name='roleCode']").val();
	var roleName = $("input[name='roleName']").val();
	var remark = $("input[name='remark']").val();
	var url = roleId == null ? "role/save" : "role/update";
	$.ajax({
		type : "POST",
		url : url,
		headers : {
			'Content-Type' : 'application/x-www-form-urlencoded'
		},
		data : {
			roleId : roleId,
			roleCode : roleCode,
			roleName : roleName,
			remark : remark
		},
		success : function(r) {
			if (r.code === 0) {
				layer.msg('操作成功!', {
					icon : 1,
					time : 1000
				}, function() {
					location.reload();
				});
			} else {
				layer.alert(r.msg, {
					icon : 2
				});
			}
		}
	});
}

/**
 * 授权操作
 */
function addPrems(e) {
	loadingButton($(e));
	var roleId = $("#roleId").val();
	roleId = roleId == "" ? null : roleId;
	var nodes = ztree.getCheckedNodes(true);
	var menuIdList = new Array();
	for (var i = 0; i < nodes.length; i++) {
		menuIdList.push(nodes[i].menuId);
	}
	if (menuIdList.length < 1) {
		layer.alert('请为角色授权', {
			icon : 2
		});
		return false;
	}
	var url = "role/prems";
	$.ajax({
		type : "POST",
		url : url,
		headers : {
			'Content-Type' : 'application/x-www-form-urlencoded'
		},
		data : {
			roleId : roleId,
			menuIds : JSON.stringify(menuIdList)
		},
		success : function(r) {
			if (r.code === 0) {
				layer.msg('操作成功!', {
					icon : 1,
					time : 1000
				}, function() {
					location.reload();
				});
			} else {
				layer.alert(r.msg, {
					icon : 2
				});
			}
		}
	});
}

// 新建角色
function add(s) {
	$("input[name='roleId']").val("");
	$("input[name='roleCode']").val("");
	$("input[name='roleName']").val("");
	$("input[name='remark']").val("");
	layer_show("新建角色", $(s), 500, 400);
}

var setting = {
	data : {
		simpleData : {
			enable : true,
			idKey : "menuId",
			pIdKey : "parentId",
			rootPId : -1
		},
		key : {
			url : "nourl"
		}
	},
	check : {
		enable : true,
		nocheckInherit : true
	}
};
var ztree;
var role;

// 加载菜单树
function getMenuTree(roleId) {
	$.get("menu/perms", function(r) {
		if (r.code === 0) {
			ztree = $.fn.zTree.init($("#menuTree"), setting, r.menuList);
			// 展开所有节点
			ztree.expandAll(true);
			if (roleId != null) {
				getRole(roleId);
			}
		} else {
			layer.alert(r.msg, {
				icon : 2
			});
		}
	});
}

function getRole(roleId) {
	$.get("role/info/" + roleId, function(r) {
		if (r.code === 0) {
			role = r.role;
			// 勾选角色所拥有的菜单
			var menuIds = role.menuIdList;
			for (var i = 0; i < menuIds.length; i++) {
				var node = ztree.getNodeByParam("menuId", menuIds[i]);
				if (null == node) {
					continue;
				}
				ztree.checkNode(node, true, false);
			}
			$("input[name='roleId']").val(r.role.roleId);
		} else {
			layer.alert(r.msg, {
				icon : 2
			});
		}
	});
}