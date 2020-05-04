package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.WishDao;
import com.bit.project.model.entity.ClientVo;
import com.bit.project.model.entity.WishVo;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	WishDao wishDao;
	

	@Override
	public void insert_wish(WishVo bean) {
		try {
			wishDao.insert_wish(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete_wish(int wish_no) {
		try {
			wishDao.delete_wish(wish_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<WishVo> selectAll_wish(Search search) throws Exception {
		return wishDao.selectAll_wish(search);
	}

	@Override
	public WishVo keep_wish(WishVo bean) throws Exception {
		return wishDao.keep_wish(bean);
	}

}
