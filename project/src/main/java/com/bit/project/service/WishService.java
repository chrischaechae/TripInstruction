package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.ClientVo;
import com.bit.project.model.entity.WishVo;

public interface WishService {

	List<WishVo> selectAll_wish(Search search) throws Exception;
	
	public WishVo keep_wish(WishVo bean) throws Exception;
	void insert_wish(WishVo bean);
	void delete_wish(int wish_no);
	
	
}
