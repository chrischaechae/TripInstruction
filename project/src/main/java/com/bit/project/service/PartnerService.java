package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PartnerVo;

public interface PartnerService {

	
	List<PartnerVo> selectAll_partner(Search search) throws Exception;
	
	void selectOne_partner(int key,Model model);
	
	void insertOne_partner(PartnerVo bean);
	
	void updateOne_partner(PartnerVo bean);
	
	void deleteOne_partner(int key);
	
//	°Ô½Ã¹° ÃÑ °¹¼ö
	public int getPartnerListCnt(Search search) throws Exception;
}

