package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.StaffVo;

@Repository
public class StaffDaoImpl implements StaffDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<StaffVo> selectAll_staff(Search search) throws Exception {
		return sqlSession.selectList("staff.selectAll_staff", search);	
	}
	
	@Override
	public List<StaffVo> selectAll_staffNo(Search search) throws Exception {
		return sqlSession.selectList("staff.selectAll_staffNo", search);
	}
	
	@Override
	public List<StaffVo> selectAll_staffTeam(Search search) throws Exception {
		return sqlSession.selectList("staff.selectAll_staffTeam", search);
	}
	
	@Override
	public StaffVo selectOne_staff(int key) throws Exception {
		return sqlSession.selectOne("staff.selectOne_staff",key);
	}

	@Override
	public void insertOne_staff(StaffVo bean) throws Exception {
		 sqlSession.insert("staff.insertOne_staff",bean);
	}

	@Override
	public int updateOne_staff(StaffVo bean) throws Exception {
		return sqlSession.update("staff.updateOne_staff",bean);
	}

	@Override
	public int deleteOne_staff(int key) throws Exception {
		return sqlSession.delete("staff.deleteOne_staff",key);
	}

	@Override
	public StaffVo loginCheck(StaffVo bean) throws Exception {
		return sqlSession.selectOne("staff.stafflogin", bean);
	}

	@Override
	public int getStaffListCnt(Search search) throws Exception {
		return sqlSession.selectOne("staff.getStaffListCnt", search);
	}

	@Override
	public int changePw(StaffVo bean) throws Exception {
		return sqlSession.update("staff.changePw", bean);
	}



}
