package com.bit.project.service;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.FaqVo;

public interface FaqService {

	public List<FaqVo> selectAll_faq(Search search) throws Exception;
	void insertOne_faq(FaqVo bean);
	void updateOne_faq(FaqVo bean);
	void deleteOne_faq(int key);
}
