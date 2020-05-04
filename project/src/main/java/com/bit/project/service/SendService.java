package com.bit.project.service;

import org.springframework.ui.Model;

import com.bit.project.model.entity.SendVo;

public interface SendService {

	void selectAll_send(Model model);
	void selectOne_send(int key,Model model);
	void insertOne_send(SendVo bean);
	void deleteOne_send(int key);
}
