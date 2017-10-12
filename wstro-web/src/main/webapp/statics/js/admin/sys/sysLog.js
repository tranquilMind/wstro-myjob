/**
 * 表单验证
 */
$(function() {
	
});

// 筛选数据
function search() {
	var params = $('#table').bootstrapTable('getOptions');
	params.queryParams = function(params) {
		// 定义参数
		var search = {};
		// 遍历form 组装json
		$.each($("#searchform").serializeArray(), function(i, field) {
			// 可以添加提交验证
			search[field.name] = field.value;
		});

		// 参数转为json字符串，并赋给search变量 ,JSON.stringify <ie7不支持，有第三方解决插件
		params.search = JSON.stringify(search);
		return params;
	}
	$('#table').bootstrapTable('refresh', params);
}
