package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.project.common.Search;
import com.bit.project.model.FaqDao;
import com.bit.project.model.entity.FaqVo;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	FaqDao faqDao;
	
	@Override
	public List<FaqVo> selectAll_faq(Search search) throws Exception {
		return faqDao.selectAll_faq(search);
	}

	@Override
	public void insertOne_faq(FaqVo bean) {
		try {
			faqDao.insertOne_faq(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_faq(FaqVo bean) {
		try {
			faqDao.updateOne_faq(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_faq(int key) {
		try {
			faqDao.deleteOne_faq(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
