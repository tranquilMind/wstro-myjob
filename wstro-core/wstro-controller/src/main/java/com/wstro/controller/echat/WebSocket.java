package com.wstro.controller.echat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.wstro.entity.echat.ChatMessageHistory;
import com.wstro.service.echat.ChatMessageHistoryService;
import com.wstro.util.SpringContextUtils;

@ServerEndpoint("/WebSocket/{id}")
public class WebSocket {
	private static final Logger logger = LoggerFactory.getLogger(WebSocket.class);
	private static int onlineCount = 0;
	private static Map<String, WebSocket> webSocketHashMap = new HashMap<String, WebSocket>();
	private Session session;
	private ChatMessageHistoryService chatMessageHistoryService;

	@OnOpen
	public void onOpen(@PathParam("id") String id, Session session) {
		this.session = session;
		webSocketHashMap.put(id, this);
		addOnlineCount();
		logger.info("有新连接加入！当前在线人数为" + getOnlineCount());
		if (SpringContextUtils.containsBean("chatMessageHistoryService")) {
			this.chatMessageHistoryService = ((ChatMessageHistoryService) SpringContextUtils.getBean("chatMessageHistoryService"));
		}
	}

	@OnClose
	public void onClose() {
		webSocketHashMap.remove(this);
		subOnlineCount();
		logger.info("有一链接关闭！当前在线人数为" + getOnlineCount());
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		logger.info("来自客户端的消息:" + message);
		JSONObject json = JSON.parseObject(message);
		JSONObject jsonObject = (JSONObject) json.get("data");
		String to = jsonObject.get("to").toString();
		ChatMessageHistory messageHistory = new ChatMessageHistory();
		messageHistory.setFromName(jsonObject.getString("fromName"));
		messageHistory.setFromUser(jsonObject.getString("from"));
		messageHistory.setToName(jsonObject.getString("toName"));
		messageHistory.setToUser(jsonObject.getString("to"));
		messageHistory.setMsgType(json.getString("type"));
		messageHistory.setMsg(jsonObject.getString("msg"));
		String randomSeed = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
		messageHistory.setId(randomSeed);
		this.chatMessageHistoryService.insert(messageHistory);
		try {
			for (String key : webSocketHashMap.keySet()) {
				if (key.equals(to)) {
					((WebSocket) webSocketHashMap.get(key)).sendMessage(message);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Session session, Throwable error) {
		logger.info("发生错误！");
		error.printStackTrace();
	}

	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		onlineCount += 1;
	}

	public static synchronized void subOnlineCount() {
		onlineCount -= 1;
	}
}
