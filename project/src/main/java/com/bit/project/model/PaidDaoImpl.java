package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.ReceiveVo;

@Repository
public class PaidDaoImpl implements PaidDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public PaidVo selectOne_paid(int paid_no) throws Exception {
		return sqlSession.selectOne("paid.selectOne_paid",paid_no);
	}

	@Override
	public List<PaidVo> selectAll_paid(Search search) throws Exception {
		return sqlSession.selectList("paid.selectAll_paid",search);
	}
	@Override
	public int getPaidListCnt(Search search) throws Exception {
		return sqlSession.selectOne("paid.getPaidListCnt", search);
	}

	@Override
	public int getallPaidListCnt(Search search) throws Exception {
		return sqlSession.selectOne("paid.getallPaidListCnt", search);
	}

	@Override
	public int paid_confirm(PaidVo bean) throws Exception {
		return sqlSession.update("paid.paid_confirm", bean);
	}

	@Override
	public List<PaidVo> selectAll_allpaid(Search search) throws Exception {
		return sqlSession.selectList("paid.selectAll_allpaid",search);
	}

	@Override
	public int allpaid_confirm(PaidVo bean) throws Exception {
		return sqlSession.update("paid.allpaid_confirm", bean);
	}

	@Override
	public List<PaidVo> selectAll_paidState(Search search) throws Exception {
		return sqlSession.selectList("paid.selectAll_paidState",search);
	}

	@Override
	public List<PaidVo> selectAll_paidConfirm(Search search) throws Exception {
		return sqlSession.selectList("paid.selectAll_paidConfirm",search);
	}

	@Override
	public List<PaidVo> selectAll_paidDate(Search search) throws Exception {
		return sqlSession.selectList("paid.selectAll_paidDate",search);
	}

}
