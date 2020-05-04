package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.FreeVo;

@Repository
public class FreeDaoImpl implements FreeDao {
	
	@Autowired
	SqlSession sqlSession;

	
	
	@Override
	public List<FreeVo> selectAll_free(Search search) throws Exception {
		return sqlSession.selectList("free.selectAll_free", search);
	}

	@Override
	public FreeVo selectOne_free(int key) throws Exception {
		return sqlSession.selectOne("free.selectOne_free", key);
	}

	@Override
	public void insertOne_free(FreeVo bean) throws Exception {
		sqlSession.insert("free.insertOne_free", bean);
	}

	@Override
	public int updateOne_free(FreeVo bean) throws Exception {
		return sqlSession.update("free.updateOne_free", bean);
	}

	@Override
	public int deleteOne_free(int key) throws Exception {
		return sqlSession.delete("free.deleteOne_free", key);
	}

	@Override
	public int updateCnt(int key) throws Exception {
		return sqlSession.update("free.updateCnt", key);
	}

	@Override
	public int getFreeListCnt(Search search) throws Exception {
		return sqlSession.selectOne("free.getFreeListCnt", search);
	}

	


}
