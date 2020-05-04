package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.NoticeDao;
import com.bit.project.model.entity.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public List<NoticeVo> selectAll_notice(Search search) throws Exception {
		return noticeDao.selectAll_notice(search);
	}

	@Override
	public void selectOne_notice(int key, Model model) {
		try {
			model.addAttribute("bean",noticeDao.selectOne_notice(key));
			noticeDao.updateCnt(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOne_notice(NoticeVo bean) {
		try {
			noticeDao.insertOne_notice(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_notice(NoticeVo bean) {
		try {
			noticeDao.updateOne_notice(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_notice(int key) {
		try {
			noticeDao.deleteOne_notice(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getNoticeListCnt(Search search) throws Exception {
		return noticeDao.getNoticeListCnt(search);
	}

	
}
