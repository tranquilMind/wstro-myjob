**项目结构** 
```
wstro
├──sql  项目SQL语句
│ 
├──App 项目启动类
│
├──config 配置信息
│
├──controller 控制器
│  ├─admin 后台管理员控制器
│ 
├──service 业务逻辑接口
│  ├─impl 业务逻辑接口实现类
│
├──dao 数据访问接口
│
├──entity 数据持久化实体类
│
├──datasources 多数据源工具类
│
├──shiro Shiro验证框架
│ 
├──task Quartz定时任务
│ 
├──util 项目所用的的所有工具类
│  ├─FreeMarker 自定义FreeMarker标签
│  
├──resources 
│  ├─mapper SQL对应的XML文件
│  ├─templates FreeMarker模版
│  
├──webapp
│  ├─statics 静态资源
│  ├─upload 上传文件
│  ├─WEB-INF
│	├─templates 页面FreeMarker模版


 **本地部署**
- 项目访问路径：http://localhost:8080/wstro
- 账号密码：admin/admin

启动说明:
	访问地址:
		localhost:8080/admin
	此处Redis缓存注解和EhCache缓存注解只能使用1个
	使用
		@Primary标注
