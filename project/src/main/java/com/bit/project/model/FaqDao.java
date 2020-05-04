package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.FaqVo;

public interface FaqDao {

	List<FaqVo> selectAll_faq(Search search) throws Exception;
	void insertOne_faq(FaqVo bean) throws Exception;
	int updateOne_faq(FaqVo bean) throws Exception;
	int deleteOne_faq(int key) throws Exception;
}
