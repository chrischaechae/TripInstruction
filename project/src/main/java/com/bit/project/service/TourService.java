package com.bit.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.TourVo;

public interface TourService {
	//회원용
	void selectAll_eastasia(Model model);
	void selectAll_southeastasia(Model model);
	void selectAll_america(Model model);
	void selectAll_europe(Model model);
	void selectAll_pacific(Model model);
	void selectAll_africa(Model model);
	void selectAll_themetour(Model model);
	void selectAll_themesnap(Model model);
	void selectAll_themeactivity(Model model);
	void selectAll_themefood(Model model);
	void selectAll_thememovie(Model model);
	void selectAll_themesports(Model model);
	
	void selectOne_tour(Model model,int tour_no,HttpServletResponse res, HttpServletRequest req);
	void insertOne_tour(PaidVo bean);
	////////////////////////
	//관리자용(system)
	List<TourVo> selectAll_tour(Search search) throws Exception;
	List<TourVo> selectAll_tour_arrayland(Search search) throws Exception;
	List<TourVo> selectAll_tour_arraycountry(Search search) throws Exception;
	public int getallTourListCnt(Search search) throws Exception;
	void updateOne_tour(TourVo bean);
	
	// 홈 검색
	List<TourVo> homeSearch(Search search) throws Exception;
	//홈추천
	void selectAll_recomm1(Model model);
	void selectAll_recomm2(Model model);
	void selectAll_recomm3(Model model);
}
