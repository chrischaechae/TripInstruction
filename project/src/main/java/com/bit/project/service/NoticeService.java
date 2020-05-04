package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.NoticeVo;

public interface NoticeService {

	public List<NoticeVo> selectAll_notice(Search search) throws Exception;
	void selectOne_notice(int key,Model model);
	void insertOne_notice(NoticeVo bean);
	void updateOne_notice(NoticeVo bean);
	void deleteOne_notice(int key);
//	°Ô½Ã¹° ÃÑ °¹¼ö
	public int getNoticeListCnt(Search search) throws Exception;
}
