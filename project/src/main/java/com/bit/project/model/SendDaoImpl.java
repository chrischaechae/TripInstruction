package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.model.entity.SendVo;

@Repository
public class SendDaoImpl implements SendDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<SendVo> selectAll_send() throws Exception {
		return sqlSession.selectList("send.selectAll_send");
	}

	@Override
	public SendVo selectOne_send(int key) throws Exception {
		return sqlSession.selectOne("send.selectOne_send",key);
	}

	@Override
	public void insertOne_send(SendVo bean) throws Exception {
		sqlSession.insert("send.insertOne_send",bean);
	}

	@Override
	public int deleteOne_send(int key) throws Exception {
		return sqlSession.delete("send.deleteOne_send",key);
	}


}
