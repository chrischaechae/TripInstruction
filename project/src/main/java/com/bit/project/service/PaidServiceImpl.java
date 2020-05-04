package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.PaidDao;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.ReceiveVo;

@Service
public class PaidServiceImpl implements PaidService {

	@Autowired
	PaidDao paidDao;
	

	@Override
	public void selectOne_paid(Model model, int paid_no) {
		try {
			model.addAttribute("bean",paidDao.selectOne_paid(paid_no));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<PaidVo> selectAll_paid(Search search) throws Exception {
		return paidDao.selectAll_paid(search);
	}
	
	@Override
	public void paid_confirm(PaidVo bean) {
		try {
			paidDao.paid_confirm(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int getallPaidListCnt(Search search) throws Exception {
		return paidDao.getallPaidListCnt(search);
	}


	@Override
	public List<PaidVo> selectAll_allpaid(Search search) throws Exception {
		return paidDao.selectAll_allpaid(search);
	}

	@Override
	public void allpaid_confirm(PaidVo bean) {
		try {
			paidDao.allpaid_confirm(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<PaidVo> selectAll_paidState(Search search) throws Exception {
		return paidDao.selectAll_paidState(search);
	}

	@Override
	public List<PaidVo> selectAll_paidConfirm(Search search) throws Exception {
		return paidDao.selectAll_paidConfirm(search);
	}

	@Override
	public List<PaidVo> selectAll_paidDate(Search search) throws Exception {
		return paidDao.selectAll_paidDate(search);
	}

	@Override
	public int getPaidListCnt(Search search) throws Exception {
		return paidDao.getPaidListCnt(search);
	}

}
