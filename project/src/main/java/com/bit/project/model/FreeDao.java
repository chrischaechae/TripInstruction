package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.FreeVo;

public interface FreeDao {


	
	List<FreeVo> selectAll_free(Search search) throws Exception;
	 
//	DETAIL
	FreeVo selectOne_free(int key) throws Exception;
	 
//	INSERT
	void insertOne_free(FreeVo bean) throws Exception;
	 
//	UPDATE
	int updateOne_free(FreeVo bean) throws Exception;

//	DELETE
	int deleteOne_free(int key) throws Exception;
	
//	Á¶È¸¼ö
	int updateCnt(int key) throws Exception;
//	°Ô½Ã¹° ÃÑ °¹¼ö
	public int getFreeListCnt(Search search) throws Exception;
}
