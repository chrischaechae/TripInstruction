package com.bit.project.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.ReceiveDao;
import com.bit.project.model.entity.ReceiveVo;

@Service
public class ReceiveServiceImpl implements ReceiveService {
	
	@Autowired
	ReceiveDao receiveDao;
	
//	쪽지함
	@Override
	public List<ReceiveVo> selectAll_receive(Search search) throws Exception {
		return receiveDao.selectAll_receive(search);
	}
//	받은 쪽지
	@Override
	public void selectOne_receive(int key, Model model) {
		try {
			model.addAttribute("bean",receiveDao.selectOne_receive(key));
			receiveDao.updateOne_receive(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	실시간 받은 쪽지
	@Override
	public void selectOne_receiveLimitOne(String key, Model model) {
		try {
			model.addAttribute("bean", receiveDao.selectOne_receiveLimitOne(key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	쪽지 읽음 처리
	@Override
	public void updateOne_receive(int key) {
		try {
			receiveDao.updateOne_receive(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	쪽지 삭제
	@Override
	public void deleteOne_receive(int key) {
		try {
			receiveDao.deleteOne_receive(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	게시물 총 갯수
	@Override
	public int getReceiveListCnt(Search search) throws Exception {
		return receiveDao.getReceiveListCnt(search);
	}
//	읽지 않은 쪽지 갯수
	@Override
	public int select_receiveUnCnt(String client_nick2) throws Exception {
		return receiveDao.select_receiveUnCnt(client_nick2);
	}


}
