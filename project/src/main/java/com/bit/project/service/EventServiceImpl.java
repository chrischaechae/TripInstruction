package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.EventDao;
import com.bit.project.model.entity.EventVo;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao eventDao;
	
	
	
	@Override
	public List<EventVo> selectAll_event(Search search) throws Exception {
		return eventDao.selectAll_event(search);
	}

	@Override
	public void selectOne_event(int key, Model model) {
		try {
			eventDao.updateCnt(key);
			model.addAttribute("bean",eventDao.selectOne_event(key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOne_event(EventVo bean) {
		try {
			eventDao.insertOne_event(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_event(EventVo bean) {
		try {
			eventDao.updateOne_event(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_event(int key) {
		try {
			eventDao.deleteOne_event(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getEventListCnt(Search search) throws Exception {
		return eventDao.getEventListCnt(search);
	}

}
