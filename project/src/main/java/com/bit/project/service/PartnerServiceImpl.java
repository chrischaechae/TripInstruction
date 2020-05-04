package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.PartnerDao;
import com.bit.project.model.entity.PartnerVo;

@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired
	PartnerDao partnerDao;
	
	
	
	@Override
	public List<PartnerVo> selectAll_partner(Search search) throws Exception {
		return partnerDao.selectAll_partner(search);
	}

	@Override
	public void selectOne_partner(int key, Model model) {
		try {
			partnerDao.updateCnt(key);
			model.addAttribute("bean",partnerDao.selectOne_partner(key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOne_partner(PartnerVo bean) {
		try {
			partnerDao.insertOne_partner(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_partner(PartnerVo bean) {
		try {
			partnerDao.updateOne_partner(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_partner(int key) {
		try {
			partnerDao.deleteOne_partner(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getPartnerListCnt(Search search) throws Exception {
		return partnerDao.getPartnerListCnt(search);
	}

}
