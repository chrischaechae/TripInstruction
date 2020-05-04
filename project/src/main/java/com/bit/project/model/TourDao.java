package com.bit.project.model;

import java.util.List;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.TourVo;

public interface TourDao {
	//회원용
	List<TourVo> selectAll_eastasia() throws Exception;
	List<TourVo> selectAll_southeastasia() throws Exception;
	List<TourVo> selectAll_america() throws Exception;
	List<TourVo> selectAll_europe() throws Exception;
	List<TourVo> selectAll_pacific() throws Exception;
	List<TourVo> selectAll_africa() throws Exception;
	List<TourVo> selectAll_themetour() throws Exception;
	List<TourVo> selectAll_themesnap() throws Exception;
	List<TourVo> selectAll_themeactivity() throws Exception;
	List<TourVo> selectAll_themefood() throws Exception;
	List<TourVo> selectAll_thememovie() throws Exception;
	List<TourVo> selectAll_themesports() throws Exception;
	
	TourVo selectOne_tour(int tour_no) throws Exception;
	//결제
	void insertOne(PaidVo bean) throws Exception;
	//관리자용
	List<TourVo> selectAll_tour(Search search) throws Exception;
	List<TourVo> selectAll_tour_arrayland(Search search) throws Exception;
	List<TourVo> selectAll_tour_arraycountry(Search search) throws Exception;
	public int getallTourListCnt(Search search) throws Exception;
	int updateOne_tour(TourVo bean) throws Exception;
	
	//홈 검색
	List<TourVo> homeSearch(Search search) throws Exception;
	//홈추천
	List<TourVo> selectAll_recomm1() throws Exception;
	List<TourVo> selectAll_recomm2() throws Exception;
	List<TourVo> selectAll_recomm3() throws Exception;
}
