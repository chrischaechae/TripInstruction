package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MapDaoImpl implements MapDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MapDao> selectAll_map(int tour_no) throws Exception {
		return sqlSession.selectList("map.selectAll_map", tour_no);
	}

}
