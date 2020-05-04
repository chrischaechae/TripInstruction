package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.StaffVo;

public interface StaffService {

	List<StaffVo> selectAll_staff(Search search) throws Exception;
	List<StaffVo> selectAll_staffNo(Search search) throws Exception;
	List<StaffVo> selectAll_staffTeam(Search search) throws Exception;
	
	void selectOne_staff(int key,Model model);
	void insertOne_staff(StaffVo bean);
	void updateOne_staff(StaffVo bean);
	void deleteOne_staff(int key);
	public StaffVo loginCheck(StaffVo bean) throws Exception;
	public int getStaffListCnt(Search search) throws Exception;
	void changePw(StaffVo bean) throws Exception;
}
