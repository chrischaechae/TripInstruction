package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<BoardVo> selectAll_review(Search search) throws Exception {
		return sqlSession.selectList("board.selectAll_review", search);
	}

	@Override
	public List<BoardVo> selectAll_reviewCity(Search search) throws Exception {
		return sqlSession.selectList("board.selectAll_reviewCity", search);
	}

	@Override
	public List<BoardVo> selectAll_reviewTheme(Search search) throws Exception {
		return sqlSession.selectList("board.selectAll_reviewTheme", search);
	}

	@Override
	public BoardVo select_land(int key) throws Exception {
		return sqlSession.selectOne("board.select_land", key);
	}

	@Override
	public BoardVo selectOne_review(int key) throws Exception {
		return sqlSession.selectOne("board.selectOne_review", key);
	}

	@Override
	public void insertOne_review(BoardVo bean) throws Exception {
		sqlSession.insert("board.insertOne_review", bean);
		
	}

	@Override
	public int updateOne_review(BoardVo bean) throws Exception {
		return sqlSession.update("board.updateOne_review", bean);
	}

	@Override
	public int deleteOne_review(int key) throws Exception {
		return sqlSession.delete("board.deleteOne_review", key);
	}

	@Override
	public int updateCnt(int key) throws Exception {
		return sqlSession.update("board.updateCnt", key);
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return sqlSession.selectOne("board.getBoardListCnt", search);
	}

//	내가 쓴 글
	@Override
	public List<BoardVo> myBoardList(Search search) throws Exception {
		return sqlSession.selectList("board.myBoardList", search);
	}

	@Override
	public int myBoardTotal(Search search) throws Exception {
		return sqlSession.selectOne("board.myBoardTotal", search);
	}



}