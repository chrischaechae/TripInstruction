package com.bit.project.model;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ClientVo;
import com.bit.project.model.entity.WishVo;

@Repository
public class WishDaoImpl implements WishDao {

	@Autowired
	SqlSession sqlSession;


	@Override
	public void insert_wish(WishVo bean) throws Exception {
		sqlSession.insert("wish.insert_wish", bean);
	}

	@Override
	public int delete_wish(int wish_no) throws Exception {
		return sqlSession.delete("wish.delete_wish", wish_no);
	}

	@Override
	public List<WishVo> selectAll_wish(Search search) throws Exception {
		return sqlSession.selectList("wish.selectAll_wish",search);
	}

	@Override
	public WishVo keep_wish(WishVo bean) throws Exception {
		return sqlSession.selectOne("wish.keep_wish", bean);
	}
	


}
