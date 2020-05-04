package com.bit.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.BoardVo;

public interface BoardService {

	
	List<BoardVo> selectAll_review(Search search) throws Exception;
	List<BoardVo> selectAll_reviewCity(Search search) throws Exception;
	List<BoardVo> selectAll_reviewTheme(Search search) throws Exception;
	
	void selectOne_review(int key,Model model);
	
	void insertOne_review(BoardVo bean);
	
	void updateOne_review(BoardVo bean);
	
	void deleteOne_review(int key);
	
	void select_land(int key, Model model);
//	°Ô½Ã¹° ÃÑ °¹¼ö
	public int getBoardListCnt(Search search) throws Exception;
	
//	³»°¡ ¾´ ±Û
	List<BoardVo> myBoardList(Search search) throws Exception;
	public int myBoardTotal(Search search) throws Exception;
}

