package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.FreeDao;
import com.bit.project.model.entity.FreeVo;

@Service
public class FreeServiceImpl implements FreeService {

	@Autowired
	FreeDao freeDao;

	
	@Override
	public List<FreeVo> selectAll_free(Search search) throws Exception {
		return freeDao.selectAll_free(search);
	}

	@Override
	public void selectOne_free(int key, Model model) {
		try {
			freeDao.updateCnt(key);
			model.addAttribute("bean",freeDao.selectOne_free(key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOne_free(FreeVo bean) {
		try {
			freeDao.insertOne_free(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_free(FreeVo bean) {
		try {
			freeDao.updateOne_free(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_free(int key) {
		try {
			freeDao.deleteOne_free(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getFreeListCnt(Search search) throws Exception {
		return freeDao.getFreeListCnt(search);
	}
	
	
}
