package com.bit.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.TourVo;

@Repository
public class TourDaoImpl implements TourDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<TourVo> selectAll_eastasia() throws Exception {
		return sqlSession.selectList("tour.selectAll_eastasia");
	}

	@Override
	public TourVo selectOne_tour(int tour_no) throws Exception {
			return sqlSession.selectOne("tour.selectOne_tour",tour_no);
	}

	@Override
	public void insertOne(PaidVo bean) {
		sqlSession.insert("tour.insertOne_tour",bean);
		
	}

	@Override
	public List<TourVo> selectAll_southeastasia() throws Exception {
		return sqlSession.selectList("tour.selectAll_southeastasia");
	}

	@Override
	public List<TourVo> selectAll_america() throws Exception {
		return sqlSession.selectList("tour.selectAll_america");
	}

	@Override
	public List<TourVo> selectAll_europe() throws Exception {
		return sqlSession.selectList("tour.selectAll_europe");
	}

	@Override
	public List<TourVo> selectAll_pacific() throws Exception {
		return sqlSession.selectList("tour.selectAll_pacific");
	}

	@Override
	public List<TourVo> selectAll_africa() throws Exception {
		return sqlSession.selectList("tour.selectAll_africa");
	}

	@Override
	public List<TourVo> selectAll_themetour() throws Exception {
		return  sqlSession.selectList("tour.selectAll_theme");
	}

	@Override
	public List<TourVo> selectAll_themesnap() throws Exception {
		return sqlSession.selectList("tour.selectAll_themesnap");
	}

	@Override
	public List<TourVo> selectAll_themeactivity() throws Exception {
		return sqlSession.selectList("tour.selectAll_themeactivity");
	}

	@Override
	public List<TourVo> selectAll_themefood() throws Exception {
		return sqlSession.selectList("tour.selectAll_themefood");
	}

	@Override
	public List<TourVo> selectAll_thememovie() throws Exception {
		return sqlSession.selectList("tour.selectAll_thememovie");
	}

	@Override
	public List<TourVo> selectAll_themesports() throws Exception {
		return sqlSession.selectList("tour.selectAll_themesports");
	}

	@Override
	public List<TourVo> selectAll_tour(Search search) throws Exception {
		return sqlSession.selectList("tour.selectAll_tour",search);
	}

	@Override
	public int getallTourListCnt(Search search) throws Exception {
		return sqlSession.selectOne("tour.getallTourListCnt", search);
	}

	@Override
	public List<TourVo> selectAll_tour_arrayland(Search search) throws Exception {
		return sqlSession.selectList("tour.selectAll_tour_arrayland",search);
	}

	@Override
	public List<TourVo> selectAll_tour_arraycountry(Search search) throws Exception {
		return sqlSession.selectList("tour.selectAll_tour_arraycountry",search);
	}

	@Override
	public List<TourVo> homeSearch(Search search) throws Exception {
		return sqlSession.selectList("tour.homeSearch", search);
	}

	@Override
	public int updateOne_tour(TourVo bean) throws Exception {
		return sqlSession.update("tour.updateOne_tour",bean);
		
	}

	@Override
	public List<TourVo> selectAll_recomm1() throws Exception {
		return sqlSession.selectList("tour.selectAll_recomm1");
	}

	@Override
	public List<TourVo> selectAll_recomm2() throws Exception {
		return sqlSession.selectList("tour.selectAll_recomm2");
	}

	@Override
	public List<TourVo> selectAll_recomm3() throws Exception {
		return sqlSession.selectList("tour.selectAll_recomm3");
	}
}
