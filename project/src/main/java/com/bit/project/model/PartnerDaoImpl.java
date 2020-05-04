package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PartnerVo;

@Repository
public class PartnerDaoImpl implements PartnerDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<PartnerVo> selectAll_partner(Search search) throws Exception {
		return sqlSession.selectList("partner.selectAll_partner",search);
	}

	@Override
	public PartnerVo selectOne_partner(int key) throws Exception {
		return sqlSession.selectOne("partner.selectOne_partner", key);
	}

	@Override
	public void insertOne_partner(PartnerVo bean) throws Exception {
		sqlSession.insert("partner.insertOne_partner", bean);
	}

	@Override
	public int updateOne_partner(PartnerVo bean) throws Exception {
		return sqlSession.update("partner.updateOne_partner", bean);
	}

	@Override
	public int deleteOne_partner(int key) throws Exception {
		return sqlSession.delete("partner.deleteOne_partner", key);
	}

	@Override
	public int updateCnt(int key) throws Exception {
		return sqlSession.update("partner.updateCnt", key);
	}

	@Override
	public int getPartnerListCnt(Search search) throws Exception {
		return sqlSession.selectOne("partner.getPartnerListCnt",search);
	}

	
}
