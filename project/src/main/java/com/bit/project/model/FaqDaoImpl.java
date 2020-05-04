package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.FaqVo;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<FaqVo> selectAll_faq(Search search) throws Exception {
		return sqlSession.selectList("faq.selectAll_faq", search);
	}

	@Override
	public void insertOne_faq(FaqVo bean) throws Exception {
		sqlSession.insert("faq.insertOne_faq",bean);
	}

	@Override
	public int updateOne_faq(FaqVo bean) throws Exception {
		return sqlSession.update("faq.updateOne_faq",bean);
	}

	@Override
	public int deleteOne_faq(int key) throws Exception {
		return sqlSession.delete("faq.deleteOne_faq",key);
	}


}
