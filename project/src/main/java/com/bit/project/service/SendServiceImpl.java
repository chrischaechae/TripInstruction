package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.model.SendDao;
import com.bit.project.model.entity.SendVo;

@Service
public class SendServiceImpl implements SendService {

	@Autowired
	SendDao sendDao;
	
	@Override
	public void selectAll_send(Model model) {
		try {
			List<SendVo> list=sendDao.selectAll_send();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void selectOne_send(int key, Model model) {
		try {
			model.addAttribute("bean",sendDao.selectOne_send(key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOne_send(SendVo bean) {
		try {
			sendDao.insertOne_send(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_send(int key) {
		try {
			sendDao.deleteOne_send(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
