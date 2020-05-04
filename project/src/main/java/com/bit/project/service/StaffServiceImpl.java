package com.bit.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.StaffDao;
import com.bit.project.model.entity.StaffVo;

@Service
public class StaffServiceImpl implements StaffService {

	@Autowired
	StaffDao staffDao;
	
	@Override
	public List<StaffVo> selectAll_staff(Search search) throws Exception {
		return staffDao.selectAll_staff(search);
	}
	
	@Override
	public List<StaffVo> selectAll_staffNo(Search search) throws Exception {
		return staffDao.selectAll_staffNo(search);
	}
	
	@Override
	public List<StaffVo> selectAll_staffTeam(Search search) throws Exception {
		return staffDao.selectAll_staffTeam(search);
	}
	

	@Override
	public void selectOne_staff(int key, Model model) {
		try {
			model.addAttribute("bean",staffDao.selectOne_staff(key));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOne_staff(StaffVo bean) {
		try {
			staffDao.insertOne_staff(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOne_staff(StaffVo bean) {
		try {
			staffDao.updateOne_staff(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOne_staff(int key) {
		try {
			staffDao.deleteOne_staff(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public StaffVo loginCheck(StaffVo bean) throws Exception {
		return staffDao.loginCheck(bean);
	}

	@Override
	public int getStaffListCnt(Search search) throws Exception {
		return staffDao.getStaffListCnt(search);
	}

	@Override
	public void changePw(StaffVo bean) throws Exception {
		try {
			staffDao.changePw(bean);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


}
