package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ReceiveVo;

@Repository
public class ReceiveDaoImpl implements ReceiveDao {

	@Autowired
	SqlSession sqlSession;
	
//	쪽지
	@Override
	public List<ReceiveVo> selectAll_receive(Search search) throws Exception {
		return sqlSession.selectList("receive.selectAll_receive", search);
	}
//	받은 쪽지
	@Override
	public ReceiveVo selectOne_receive(int value) throws Exception {
		return sqlSession.selectOne("receive.selectOne_receive",value);
	}
//	실시간 받은 쪽지
	@Override
	public ReceiveVo selectOne_receiveLimitOne(String key) throws Exception {
		return sqlSession.selectOne("receive.selectOne_receiveLimitOne", key);
	}
//	읽은쪽지 읽음 처리
	@Override
	public int updateOne_receive(int key) throws Exception {
		return sqlSession.update("receive.updateOne_receive", key);
	}
//	쪽지 삭제
	@Override
	public int deleteOne_receive(int value) throws Exception {
		return sqlSession.delete("receive.deleteOne_receive",value);
	}
//	쪽지 총 갯수
	@Override
	public int getReceiveListCnt(Search search) throws Exception {
		return sqlSession.selectOne("receive.getReceiveListCnt", search);
	}
//	읽지않은 쪽지 갯수
	@Override
	public int select_receiveUnCnt(String client_nick2) throws Exception {
		return sqlSession.selectOne("receive.select_receiveUnCnt", client_nick2);
	}


	
}
