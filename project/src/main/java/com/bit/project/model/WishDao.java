package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ClientVo;
import com.bit.project.model.entity.WishVo;

public interface WishDao {

	public WishVo keep_wish(WishVo bean) throws Exception;
	void insert_wish(WishVo bean) throws Exception;
	int delete_wish(int wish_no) throws Exception;
	
	List<WishVo> selectAll_wish(Search search) throws Exception;
}
