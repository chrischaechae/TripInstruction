package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.FreeVo;

public interface FreeService {

	
	List<FreeVo> selectAll_free(Search search) throws Exception;
	
	void selectOne_free(int key,Model model);
	
	void insertOne_free(FreeVo bean);
	
	void updateOne_free(FreeVo bean);
	
	void deleteOne_free(int key);
	
//	°Ô½Ã¹° ÃÑ °¹¼ö
	public int getFreeListCnt(Search search) throws Exception;
}

