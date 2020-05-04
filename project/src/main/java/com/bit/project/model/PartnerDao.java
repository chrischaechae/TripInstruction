package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PartnerVo;

public interface PartnerDao {


	
	List<PartnerVo> selectAll_partner(Search search) throws Exception;
	 
//	DETAIL
	PartnerVo selectOne_partner(int key) throws Exception;
	 
//	INSERT
	void insertOne_partner(PartnerVo bean) throws Exception;
	 
//	UPDATE
	int updateOne_partner(PartnerVo bean) throws Exception;

//	DELETE
	int deleteOne_partner(int key) throws Exception;
	
//	Á¶È¸¼ö
	int updateCnt(int key) throws Exception;
//	°Ô½Ã¹° ÃÑ °¹¼ö
	public int getPartnerListCnt(Search search) throws Exception;
}
