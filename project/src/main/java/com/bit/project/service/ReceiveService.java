package com.bit.project.service;


import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ReceiveVo;


public interface ReceiveService {

//	쪽지함
	List<ReceiveVo> selectAll_receive(Search search) throws Exception;
//	받은 쪽지
	void selectOne_receive(int key,Model model);
//	실시간 받은 쪽지
	void selectOne_receiveLimitOne(String key, Model model);
//	쪽지 읽음 처리
	void updateOne_receive(int key);
//	쪽지 삭제
	void deleteOne_receive(int key);
//	게시물 총 갯수
	public int getReceiveListCnt(Search search) throws Exception;
//	읽지 않은 쪽지 갯수
	public int select_receiveUnCnt(String client_nick2) throws Exception;
}
