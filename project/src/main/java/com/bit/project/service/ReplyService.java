package com.bit.project.service;

import org.springframework.ui.Model;

import com.bit.project.model.entity.ReplyVo;

public interface ReplyService {

	void selectAll_Board_reply(int key, Model model);
	void selectAll_Partner_reply(int key, Model model);
	void selectAll_Free_reply(int key, Model model);
	void selectAll_Event_reply(int key, Model model);
	
	void insertOne_Board_reply(ReplyVo bean);
	void insertOne_Partner_reply(ReplyVo bean);
	void insertOne_Free_reply(ReplyVo bean);
	void insertOne_Event_reply(ReplyVo bean);
	
	void updateOne_reply(ReplyVo bean);
	void deleteOne_reply(int key);
}
