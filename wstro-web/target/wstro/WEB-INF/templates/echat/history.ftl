<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>聊天记录</title>
<link href="$!{basePath}/plug-in-ui/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link rel="stylesheet" href="$!{basePath}/content/chat/layui/css/layui.css">
    <style>
        html{background-color: #D9D9D9;}
    </style>
</head>
<body>
	<script src="$!{basePath}/plug-in-ui/hplus/js/jquery.min.js?v=2.1.4"></script>
	<script src="$!{basePath}/content/chat/layui/layui.js"></script>
	<script src="$!{basePath}/plug-in-ui/hplus/js/bootstrap.min.js?v=3.3.6"></script>
	
	<div class="container bs-docs-container" style="width:100%;">
        <div id="message_list" class="list-group">
         
		</div>
	</div>
	<script >
	jQuery(function(){
		jQuery.ajax({
			url:'$!{basePath}/chat/chatMessageHistory.do?getHistoryMessage&from=$!{from}&to=$!{to}&type=$!{type}',
			success:function(res){
				var resJson = JSON.parse(res);
				console.log(resJson);
				if(resJson.success){
					var objArray = resJson.obj;
					for(var i = 0; i < objArray.length; i++){
						var item  = objArray[i];
						var messageList = jQuery("#message_list");
						var msgDate = new Date();
						msgDate.setTime(item.createDate);
						var message = parent.layui.layim.content(item.msg);
						var messageStr = ""+message;
						if(messageStr.indexOf('<img')>-1){
							messageStr = message.replace('<img','<img width="100"');
						}
						var itemStr = '<div class="list-group-item"><div class="row"><div  style="width:20%;float:left;margin-left:10px;">' + item.toName 
								+ '</div><div style="width:50%;float:left;margin-left:10px;">' + msgDate.toLocaleString() +'</div></div><div>'
								+ messageStr + ' </div> </div>';
						messageList.append(itemStr);
					}
				}
			}
		});
	});
    </script>
</body>
</html>