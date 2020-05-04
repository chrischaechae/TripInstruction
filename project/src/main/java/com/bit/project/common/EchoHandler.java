package com.bit.project.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.project.model.ReceiveDao;

@ServerEndpoint("/echo")
public class EchoHandler {
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	ReceiveDao receiveDao;
	
	private static List<Session> users=Collections.synchronizedList(new ArrayList<>());

	@OnOpen
	public void handleOpen(Session userSession) {
		users.add(userSession);
		System.out.println("session 이 연결되었다");
	}
	
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		String[] str=message.split("/");
		
		// 클로저
		final String sendId=str[0];
		final String receiveId=str[1];
		final String text=str[2];
		
		users.forEach(session -> {
			try {
				session.getBasicRemote().sendText(sendId+"/"+receiveId+"/"+text);
			} catch (IOException e) {
				e.printStackTrace();
			}
		});   // 쪽지 전달
	}
	
	@OnClose
	public void handleClose(Session userSession) {
		users.remove(userSession);
		System.out.println("session 종료");
	}
	
	@OnError
	public void handleError(Session userSession, Throwable throwable) {
		users.remove(userSession);
	}
	
}
