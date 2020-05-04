package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ReceiveVo;

public interface ReceiveDao {

//	쪽지
	List<ReceiveVo> selectAll_receive(Search search) throws Exception;
//	받은 쪽지
	ReceiveVo selectOne_receive(int key) throws Exception;
//	실시간 받은 쪽지
	ReceiveVo selectOne_receiveLimitOne(String key) throws Exception;
//	읽은쪽지 읽음 처리
	int updateOne_receive(int key) throws Exception;
//	쪽지 삭제
	int deleteOne_receive(int key) throws Exception;
//	쪽지 총 갯수
	public int getReceiveListCnt(Search search) throws Exception;
//	읽지않은 쪽지 갯수
	public int select_receiveUnCnt(String client_nick2) throws Exception;
}
