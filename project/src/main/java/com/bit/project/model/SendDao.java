package com.bit.project.model;

import java.util.List;

import com.bit.project.model.entity.SendVo;

public interface SendDao {

	List<SendVo> selectAll_send() throws Exception;
	SendVo selectOne_send(int key) throws Exception;
	void insertOne_send(SendVo bean) throws Exception;
	int deleteOne_send(int key) throws Exception;
	
}
