package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.GuideVo;

@Repository
public class GuideDaoImpl implements GuideDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<GuideVo> selectAll_guide(Search search) throws Exception {
		return sqlSession.selectList("guide.selectAll_guide", search);
	}

	@Override
	public List<GuideVo> selectAll_guideNo(Search search) throws Exception {
		return sqlSession.selectList("guide.selectAll_guideNo", search);
	}
	
	@Override
	public List<GuideVo> selectAll_guideName(Search search) throws Exception {
		return sqlSession.selectList("guide.selectAll_guideName", search);
	}
	
	@Override
	public List<GuideVo> selectAll_guideCity(Search search) throws Exception {
		return sqlSession.selectList("guide.selectAll_guideCity", search);
	}
	
	@Override
	public GuideVo selectOne_guide(int key) throws Exception {
		return sqlSession.selectOne("guide.selectOne_guide",key);
	}

	@Override
	public void insertOne_guide(GuideVo bean) throws Exception {
		System.out.println("dao : "+bean);
		sqlSession.insert("guide.insertOne_guide",bean);
	}

	@Override
	public int updateOne_guide(GuideVo bean) throws Exception {
		return sqlSession.update("guide.updateOne_guide",bean);
	}

	@Override
	public int deleteOne_guide(int key) throws Exception {
		return sqlSession.delete("guide.deleteOne_guide",key);
	}

	@Override
	public int getGuideListCnt(Search search) throws Exception {
		return sqlSession.selectOne("guide.getGuideListCnt", search);
	}



}
