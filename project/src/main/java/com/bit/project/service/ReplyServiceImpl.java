package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.model.ReplyDao;
import com.bit.project.model.entity.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao replyDao;
	
	@Override
	public void selectAll_Board_reply(int key, Model model) {
		try {
			List<ReplyVo> list=replyDao.selectAll_Board_reply(key);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void selectAll_Partner_reply(int key, Model model) {
		try {
			List<ReplyVo> list=replyDao.selectAll_Partner_reply(key);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void selectAll_Free_reply(int key, Model model) {
		try {
			List<ReplyVo> list=replyDao.selectAll_Free_reply(key);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void selectAll_Event_reply(int key, Model model) {
		try {
			List<ReplyVo> list=replyDao.selectAll_Event_reply(key);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void insertOne_Board_reply(ReplyVo bean) {
		try {
			replyDao.insertOne_Board_reply(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void insertOne_Partner_reply(ReplyVo bean) {
		try {
			replyDao.insertOne_Partner_reply(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void insertOne_Free_reply(ReplyVo bean) {
		try {
			replyDao.insertOne_Free_reply(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void insertOne_Event_reply(ReplyVo bean) {
		try {
			replyDao.insertOne_Event_reply(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_reply(ReplyVo bean) {
		try {
			replyDao.updateOne_reply(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_reply(int key) {
		try {
			replyDao.deleteOne_reply(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
