package com.bit.project.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.project.common.Search;
import com.bit.project.model.TourDao;
import com.bit.project.model.entity.PaidVo;
import com.bit.project.model.entity.TourVo;

@Service
public class TourServiceImpl implements TourService{

	@Autowired
	TourDao tourDao;
	
	
	@Override
	public void selectAll_eastasia(Model model) {
	
		try {
			List<TourVo> list = tourDao.selectAll_eastasia();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	List coolist = new ArrayList();
	List coolist2 = new ArrayList();
	@Override
	public void selectOne_tour(Model model, int tour_no, HttpServletResponse res, HttpServletRequest req) {
		try {
			model.addAttribute("bean",tourDao.selectOne_tour(tour_no));
				Cookie[] cookies = req.getCookies();
				Cookie cookie = new Cookie("imgs"+0,tourDao.selectOne_tour(tour_no).getMainimg());
				Cookie idx = new Cookie("idx"+0, Integer.toString(tourDao.selectOne_tour(tour_no).getTour_no()));
				Cookie name = new Cookie("name"+0, URLEncoder.encode(tourDao.selectOne_tour(tour_no).getName(), "UTF-8"));
				Cookie city = new Cookie("city"+0, URLEncoder.encode(tourDao.selectOne_tour(tour_no).getCity(), "UTF-8"));
				res.addCookie(cookie);
				res.addCookie(idx);
				res.addCookie(name);
				res.addCookie(city);
				coolist.add(cookie.getValue());
				coolist.add(idx.getValue());
				coolist.add(URLDecoder.decode( name.getValue() , "UTF-8"));
				coolist.add(URLDecoder.decode( city.getValue() , "UTF-8"));
				for(int i=0; i<coolist.size(); i++) {
					if(!coolist2.contains(coolist.get(i))) {
						coolist2.add(coolist.get(i));
					}
				}
				HttpSession session = req.getSession();
				session.setAttribute("Coolist2", coolist2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertOne_tour(PaidVo bean) {
		try {
			tourDao.insertOne(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void selectAll_southeastasia(Model model) {
		try {
			List<TourVo> list = tourDao.selectAll_southeastasia();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void selectAll_america(Model model) {
		try {
			List<TourVo> list = tourDao.selectAll_america();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void selectAll_europe(Model model) {
		try {
			List<TourVo> list = tourDao.selectAll_europe();
			model.addAttribute("list",list);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public void selectAll_pacific(Model model) {
		try {
			List<TourVo> list = tourDao.selectAll_pacific();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void selectAll_africa(Model model) {
		try {
			List<TourVo> list = tourDao.selectAll_africa();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void selectAll_themetour(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_themetour();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void selectAll_themesnap(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_themesnap();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void selectAll_themeactivity(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_themeactivity();
			model.addAttribute("list",list);		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void selectAll_themefood(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_themefood();
			model.addAttribute("list",list);		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void selectAll_thememovie(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_thememovie();
			model.addAttribute("list",list);		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void selectAll_themesports(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_themesports();
			model.addAttribute("list",list);		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<TourVo> selectAll_tour(Search search) throws Exception {
		return tourDao.selectAll_tour(search);
	}
	@Override
	public List<TourVo> selectAll_tour_arrayland(Search search) throws Exception {
		return tourDao.selectAll_tour_arrayland(search);
	}
	@Override
	public List<TourVo> selectAll_tour_arraycountry(Search search) throws Exception {
		return tourDao.selectAll_tour_arraycountry(search);
	}

	@Override
	public int getallTourListCnt(Search search) throws Exception {
		return tourDao.getallTourListCnt(search);
	}

	@Override
	public List<TourVo> homeSearch(Search search) throws Exception {
		return tourDao.homeSearch(search);
	}

	@Override
	public void updateOne_tour(TourVo bean) {
		try {
			tourDao.updateOne_tour(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void selectAll_recomm1(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_recomm1();
			model.addAttribute("list1",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void selectAll_recomm2(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_recomm2();
			model.addAttribute("list2",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void selectAll_recomm3(Model model) {
		List<TourVo> list;
		try {
			list = tourDao.selectAll_recomm3();
			model.addAttribute("list3",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
