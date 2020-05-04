package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.ReceiveVo;

public interface PaidService {

//	회원용
	void selectOne_paid(Model model,int paid_no);
	List<PaidVo> selectAll_paid(Search search) throws Exception;
	void paid_confirm(PaidVo bean);
	public int getPaidListCnt(Search search) throws Exception;
//	관리자용
	List<PaidVo> selectAll_allpaid(Search search) throws Exception;
	List<PaidVo> selectAll_paidState(Search search) throws Exception;
	List<PaidVo> selectAll_paidConfirm(Search search) throws Exception;
	List<PaidVo> selectAll_paidDate(Search search) throws Exception;
	void allpaid_confirm(PaidVo bean);
	public int getallPaidListCnt(Search search) throws Exception;
}
