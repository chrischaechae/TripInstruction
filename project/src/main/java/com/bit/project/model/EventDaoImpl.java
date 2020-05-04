package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.EventVo;

@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<EventVo> selectAll_event(Search search) throws Exception {
		return sqlSession.selectList("event.selectAll_event",search);
	}

	@Override
	public EventVo selectOne_event(int key) throws Exception {
		return sqlSession.selectOne("event.selectOne_event",key);
	}

	@Override
	public void insertOne_event(EventVo bean) throws Exception {
		sqlSession.insert("event.insertOne_event",bean);
	}

	@Override
	public int updateOne_event(EventVo bean) throws Exception {
		return sqlSession.update("event.updateOne_event",bean);
	}

	@Override
	public int deleteOne_event(int key) throws Exception {
		return sqlSession.delete("event.deleteOne_event",key);
	}

	@Override
	public int updateCnt(int key) throws Exception {
		return sqlSession.update("event.updateCnt",key);
	}

	@Override
	public int getEventListCnt(Search search) throws Exception {
		return sqlSession.selectOne("event.getEventListCnt",search);
	}

}
