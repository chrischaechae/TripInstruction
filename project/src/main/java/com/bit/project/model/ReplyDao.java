package com.bit.project.model;

import java.util.List;

import com.bit.project.model.entity.ReplyVo;

public interface ReplyDao {

	List<ReplyVo> selectAll_Board_reply(int key) throws Exception;
	List<ReplyVo> selectAll_Partner_reply(int key) throws Exception;
	List<ReplyVo> selectAll_Free_reply(int key) throws Exception;
	List<ReplyVo> selectAll_Event_reply(int key) throws Exception;
	
	void insertOne_Board_reply(ReplyVo bean) throws Exception;
	void insertOne_Partner_reply(ReplyVo bean) throws Exception;
	void insertOne_Free_reply(ReplyVo bean) throws Exception;
	void insertOne_Event_reply(ReplyVo bean) throws Exception;
	
	int updateOne_reply(ReplyVo bean) throws Exception;
	int deleteOne_reply(int key) throws Exception;
}
