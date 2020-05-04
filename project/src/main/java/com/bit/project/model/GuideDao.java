package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.GuideVo;

public interface GuideDao {

	List<GuideVo> selectAll_guide(Search search) throws Exception;
	List<GuideVo> selectAll_guideNo(Search search) throws Exception;
	List<GuideVo> selectAll_guideName(Search search) throws Exception;
	List<GuideVo> selectAll_guideCity(Search search) throws Exception;
	GuideVo selectOne_guide(int key) throws Exception;
	void insertOne_guide(GuideVo bean) throws Exception;
	int updateOne_guide(GuideVo bean) throws Exception;
	int deleteOne_guide(int key) throws Exception;
	public int getGuideListCnt(Search search) throws Exception;
	
}
