package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.BoardVo;

public interface BoardDao {


	
//	후기 기본 정렬 (작성 순서)
	List<BoardVo> selectAll_review(Search search) throws Exception;

	/* List<BoardVo> selectAll_review() throws Exception; */
//	후기 도시별 정렬
	List<BoardVo> selectAll_reviewCity(Search search) throws Exception;
//	후기 테마별 정렬
	List<BoardVo> selectAll_reviewTheme(Search search) throws Exception;
	 
	
//	update 페이지 나라 조회
	BoardVo select_land(int key) throws Exception;
	
//	DETAIL
	BoardVo selectOne_review(int key) throws Exception;
	
	 
//	INSERT
	void insertOne_review(BoardVo bean) throws Exception;

	 
//	UPDATE
	int updateOne_review(BoardVo bean) throws Exception;

//	DELETE
	int deleteOne_review(int key) throws Exception;
	
//	조회수
	int updateCnt(int key) throws Exception;
//	게시물 총 갯수
	public int getBoardListCnt(Search search) throws Exception;
	
//	내가 쓴 글
	List<BoardVo> myBoardList(Search search) throws Exception;
	public int myBoardTotal(Search search) throws Exception;
}
