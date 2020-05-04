package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.EventVo;

public interface EventDao {


	
	List<EventVo> selectAll_event(Search search) throws Exception;
	 
//	DETAIL
	EventVo selectOne_event(int key) throws Exception;
	 
//	INSERT
	void insertOne_event(EventVo bean) throws Exception;
	 
//	UPDATE
	int updateOne_event(EventVo bean) throws Exception;

//	DELETE
	int deleteOne_event(int key) throws Exception;
	
//	Á¶È¸¼ö
	int updateCnt(int key) throws Exception;
//	°Ô½Ã¹° ÃÑ °¹¼ö
	public int getEventListCnt(Search search) throws Exception;
}
