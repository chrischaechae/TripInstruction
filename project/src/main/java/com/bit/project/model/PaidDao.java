package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.ReceiveVo;

public interface PaidDao {
	
//	회원용
	PaidVo selectOne_paid(int paid_no) throws Exception;
	
	List<PaidVo> selectAll_paid(Search search) throws Exception;
	int paid_confirm(PaidVo bean) throws Exception;
	public int getPaidListCnt(Search search) throws Exception;
	
//	관리자용
	// 기본정렬
	List<PaidVo> selectAll_allpaid(Search search) throws Exception;
	// 결제상태
	List<PaidVo> selectAll_paidState(Search search) throws Exception;
	// 확정여부
	List<PaidVo> selectAll_paidConfirm(Search search) throws Exception;
	// 출발일
	List<PaidVo> selectAll_paidDate(Search search) throws Exception;
	int allpaid_confirm(PaidVo bean) throws Exception;
	public int getallPaidListCnt(Search search) throws Exception;
}
