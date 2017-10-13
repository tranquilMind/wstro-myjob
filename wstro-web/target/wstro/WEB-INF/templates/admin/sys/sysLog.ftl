<!DOCTYPE html>
<html>
<head>
    <title>登录日志管理</title>
    [#include "/admin/header.ftl"]
    <link rel="stylesheet" href="${rc.contextPath}/statics/common/bootstrap-table/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/statics/common/icheck/flat/green.css"/>
    <link rel="stylesheet" href="${rc.contextPath}/statics/common/bootstrap-switch/css/bootstrap-switch.min.css"/>
</head>
<body class="gray-bg" style="display:none;">
<div class="wrapper wrapper-content">
    <div id="row" class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>登录日志列表</h5>

                    <div class="ibox-tools"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> </div>
                </div>
                <div class="ibox-content form-horizontal">
                    <div class="row row-lg">
                        <form id="searchform">
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"
                                                type="button" aria-expanded="false">用户账号
                                        </button>
                                    </div>
                                    <input type="text" class="form-control" name="q_userCode" placeholder="">
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-primary" onclick="search()">
                                    <i class="fa fa-search"></i>&nbsp;搜索
                                </button>
                            </div>
                        </form>
                        <div class="col-sm-12">
                            <div class="example-wrap">
                                <div class="example">
                                    <table id="table"
                                           data-toggle="table"
                                           data-height="600"
                                           data-search="false"
                                           data-search-on-enter-key="false"
                                           data-show-refresh="true"
                                           data-show-toggle="false"
                                           data-show-export="true"
                                           data-show-columns="true"
                                           data-url="${rc.contextPath}/admin/sys/log/list" [#-- 服务器数据URL --]
                                           data-pagination="true"
                                           data-page-size="10"
                                           data-page-list="[10, 20, 30, 40]"
                                           data-side-pagination="server"
                                           data-striped="true"
                                           data-pagination="true"
                                           data-sort-name="loginTime" [#-- 默认排序字段 --]
                                           data-sort-order="desc" [#-- 默认排序顺序 可选asc desc --]
                                           data-toolbar="#toolbar" [#-- 指定工具类元素 --]
                                           data-click-to-select="true" [#-- 设置true 将在点击行时，自动选择rediobox 和 checkbox --]
                                           data-single-select="false" [#-- 设置True 将禁止多选 --]
                                           data-unique-id="logId" [#-- 填写主键ID即可 --][#-- 官方文档:http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/ --]
                                    	   data-response-handler="defaultBootstarpTableHandler">
                                    <thead>
                                    <tr>
                                        <th data-checkbox="true"></th>
                                        <th data-field="userCode" data-halign="center" data-align="center"
                                            data-sortable="true">用户账号
                                        </th>
                                        <th data-field="loginIp" data-halign="center" data-align="center"
                                            data-sortable="true">登录IP
                                        </th>
                                        <th data-field="operatingSystem"
                                            data-sortable="true" data-halign="center" data-align="center">操作系统
                                        </th>
                                        <th data-field="browser"
                                            data-sortable="true" data-halign="center" data-align="center">浏览器
                                        </th>
                                        <th data-field="loginTime" data-formatter="BootstrapTableformatDate"
                                            data-sortable="true" data-halign="center" data-align="center">最后登录时间
                                        </th>
                                    </tr>
                                    </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- bootstrapvalidator-master前端验证框架 -->
<script src="${rc.contextPath}/statics/common/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<!-- Bootstrap table -->
<script src="${rc.contextPath}/statics/common/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${rc.contextPath}/statics/common/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
<script src="${rc.contextPath}/statics/common/bootstrap-table/tableExport.js"></script>
<script src="${rc.contextPath}/statics/common/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<!-- 自定义js -->
<script src="${rc.contextPath}/statics/js/admin/sys/sysLog.js"></script>
<!-- iCheck -->
<script src="${rc.contextPath}/statics/common/icheck/icheck.min.js"></script>
<script src="${rc.contextPath}/statics/common/bootstrap-switch/js/bootstrap-switch.min.js"></script>
[#-- 页面加载进度条 --]
[#assign parentName="#row"][#-- 默认为Body --]
[#include "/admin/nprogress.ftl"]
</body>
</html>