package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.GuideVo;

public interface GuideService {

	List<GuideVo> selectAll_guide(Search search) throws Exception;
	List<GuideVo> selectAll_guideNo(Search search) throws Exception;
	List<GuideVo> selectAll_guideName(Search search) throws Exception;
	List<GuideVo> selectAll_guideCity(Search search) throws Exception;
	void selectOne_guide(int key,Model model);
	void insertOne_guide(GuideVo bean);
	void updateOne_guide(GuideVo bean);
	void deleteOne_guide(int key);
	public int getGuideListCnt(Search search) throws Exception;
}
