package com.bit.project.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.common.Search;
import com.bit.project.model.entity.*;
import com.bit.project.service.*;
//회원가입,로그인 및 여행상품 관련 컨트롤러
@Controller
public class TravelController {
	
	@Autowired
	ClientService clientService;
	@Autowired
	TourService tourservice;
	@Autowired
	StaffService staffService;
	@Autowired
	MapService mapservice;
	@Autowired
	PaidService paidservice;
	@Autowired
	WishService wishservice;
	
	
// 로그인
	//회원가입창으로 이동
	@RequestMapping(value = "/main/admin", method = RequestMethod.GET)
	public String admin() {
		return "login/admin";
	}
	//회원가입 완료 , 로그인창으로 이동
	@RequestMapping(value = "/main/admin", method = RequestMethod.POST)
	public String admin(@ModelAttribute ClientVo bean) {
		  clientService.insertOne_client(bean);
		  return "redirect:login";
	}
	//직원로그인창으로 이동
	@RequestMapping(value = "/main/stafflogin", method = RequestMethod.GET)
	public String stafflogin() {
		return "login/stafflogin";
	}
	
	//직원 로그인
	@RequestMapping(value= "/main/stafflogin", method=RequestMethod.POST)
	public ModelAndView stafflogin(StaffVo bean, HttpServletRequest req) throws Exception{
		
		HttpSession session = req.getSession();
		StaffVo login= staffService.loginCheck(bean);
		ModelAndView mav=new ModelAndView();
		if(login!=null) {
			//로그인 성공 시
			session.setAttribute("staffcheck", login);
			mav.setViewName("redirect:/");
		}else {
			//로그인 실패 시
			session.setAttribute("staffcheck", null);
			mav.addObject("msg", "fail");
			mav.setViewName("login/stafflogin");
		}
		return mav;
	}
	
	//로그인창으로 이동
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)
	public String login() {
	   return "login/login";
	}
	
	//회원 로그인
	@RequestMapping(value="/main/login", method=RequestMethod.POST)
	public ModelAndView login(ClientVo bean, HttpServletRequest req) throws Exception{
		
		HttpSession session = req.getSession();
		ClientVo login= clientService.loginCheck(bean);
		ModelAndView mav=new ModelAndView();
		if(login!=null) {
			//로그인 성공 시
			session.setAttribute("check", login);
			mav.setViewName("redirect:/");
			
		}else {
			//로그인 실패 시
			session.setAttribute("check", null);
			mav.addObject("msg", "fail");
			mav.setViewName("login/login");
		}
		return mav;
	}
    //로그아웃
	@RequestMapping(value="/main/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		return "redirect:/";
	}
	
	//닉네임 중복검사
	@RequestMapping(value="/main/nickdupli", method=RequestMethod.POST)
	public ModelAndView NickDupli(ClientVo bean) throws Exception{
		ClientVo nickdupli = clientService.nickDupli(bean);
		ModelAndView mav = new ModelAndView();
		mav.addObject("Nickdupli", nickdupli);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//아이디 중복검사
	@RequestMapping(value="/main/iddupli", method=RequestMethod.POST)
	public ModelAndView IdDupli(ClientVo bean) throws Exception{
		ClientVo iddupli = clientService.idDupli(bean);
		ModelAndView mav = new ModelAndView();
		mav.addObject("Iddupli", iddupli);
		mav.setViewName("jsonView");
		return mav;
	}
	
// 여행상품 
	//투어>중국/일본
	@RequestMapping(value = "/tour/eastasia", method = RequestMethod.GET)
	public String eastasia(Model model) {
		tourservice.selectAll_eastasia(model);
		return "tour/maintour";
	}
	//투어>동남아시아
	@RequestMapping(value = "/tour/southeastasia", method = RequestMethod.GET)
	public String southeastasia(Model model) {
		tourservice.selectAll_southeastasia(model);
		return "tour/maintour";
	}
	//투어>아메리카
	@RequestMapping(value = "/tour/america", method = RequestMethod.GET)
	public String america(Model model) {
		tourservice.selectAll_america(model);
		return "tour/maintour";
	}
	//투어>유럽	
	@RequestMapping(value = "/tour/europe", method = RequestMethod.GET)
	public String europe(Model model) {
		tourservice.selectAll_europe(model);
		return "tour/maintour";
	}
	//투어>남태평양	
	@RequestMapping(value = "/tour/pacific", method = RequestMethod.GET)
	public String pacific(Model model) {
		tourservice.selectAll_pacific(model);
		return "tour/maintour";
	}
	//투어>아프리카	
	@RequestMapping(value = "/tour/africa", method = RequestMethod.GET)
	public String africa(Model model) {
		tourservice.selectAll_africa(model);
		return "tour/maintour";
	}
//테마여행
	//테마여행 메인페이지이자 힐링
	@RequestMapping(value = "/tour/theme", method = RequestMethod.GET)
	public String theme(Model model) {
		tourservice.selectAll_themetour(model);
		return "tour/themetour";
	}
	//테마여행(스냅)
	@RequestMapping(value = "/tour/themesnap", method = RequestMethod.GET)
	public String themesnap(Model model) {
		tourservice.selectAll_themesnap(model);
		return "tour/themetour";
	}
	//테마여행(액티비티)
	@RequestMapping(value = "/tour/themeactivity", method = RequestMethod.GET)
	public String themeactivity(Model model) {
		tourservice.selectAll_themeactivity(model);
		return "tour/themetour";
	}
	//테마여행(식도락)
	@RequestMapping(value = "/tour/themefood", method = RequestMethod.GET)
	public String themefood(Model model) {
		tourservice.selectAll_themefood(model);
		return "tour/themetour";
	}
	//테마여행(영화)
	@RequestMapping(value = "/tour/thememovie", method = RequestMethod.GET)
	public String thememovie(Model model) {
		tourservice.selectAll_thememovie(model);
		return "tour/themetour";
	}
	//테마여행(스포츠)
	@RequestMapping(value = "/tour/themesports", method = RequestMethod.GET)
	public String themesports(Model model) {
		tourservice.selectAll_themesports(model);
		return "tour/themetour";
	}
//여행상품 LIST END
//찜하기	
	//투어>상품>찜하기
	@RequestMapping(value="/tour/wishon",method = RequestMethod.POST)
	public String wishon(@ModelAttribute WishVo bean) {
		wishservice.insert_wish(bean);
		return "home";
	}
	//투어>상품>찜하기(취소)
	@RequestMapping(value="/tour/wishoff",method = RequestMethod.POST)
	public String wishoff(int wish_no) {
		wishservice.delete_wish(wish_no);
		return "home";
	}
	//찜한상품 여부확인
	@RequestMapping(value = "/tour/keepwish", method = RequestMethod.POST)
	public ModelAndView keepwish(WishVo bean) throws Exception{
		WishVo wishchk = wishservice.keep_wish(bean);
		ModelAndView mav = new ModelAndView();
		mav.addObject("Wishchk",wishchk);
		mav.setViewName("jsonView");		
		return mav;
	}
	//마이페이지>찜한상품
	@RequestMapping(value="/main/mywish", method=RequestMethod.GET)
	public String mywish(String id, Model model,
	 		@ModelAttribute("search") Search search
	 		) throws Exception {
			
			model.addAttribute("search", search);
	 		search.setClient_name(id);
	 		model.addAttribute("list",wishservice.selectAll_wish(search));
			
			return "mypage/wish";
	}
//찜하기  END
	
	//투어>여행상품 세부정보
	@RequestMapping(value = "/tour/detail/{idx}", method = RequestMethod.GET)
	public String detail(Model model, @PathVariable ("idx") int tour_no,HttpServletResponse res, HttpServletRequest req) {
		tourservice.selectOne_tour(model, tour_no,res,req);
		mapservice.selectAll_map(model,tour_no);
		return "tour/detailtour";
	}
	//투어>상품세부>예약페이지로 이동
	@RequestMapping(value = "/tour/{idx}/booking", method = RequestMethod.GET)
	public String bookingeastasia(Model model, @PathVariable ("idx") int tour_no,HttpServletResponse res, HttpServletRequest req) {
		tourservice.selectOne_tour(model, tour_no,res,req);
		return "tour/booking";
	}
	//투어>상품세부>예약 이벤트 실행
	@RequestMapping(value = "/tour/{idx}/booking", method = RequestMethod.POST)
	public String bookingtour(@ModelAttribute PaidVo bean) throws UnsupportedEncodingException {
		tourservice.insertOne_tour(bean);
		return "redirect:../../main/mybooking/?id="+URLEncoder.encode(bean.getClient_name(), "UTF-8");
	}
	//마이페이지>예약한 상품확인
	@RequestMapping(value="/main/mybooking", method=RequestMethod.GET)
	public String mybooking(String id, Model model,
				@RequestParam(required = false, defaultValue = "1") int page,
	 			@RequestParam(required=false, defaultValue="1") int range,
	 			@ModelAttribute("search") Search search,
	 			HttpServletRequest req
	          ) throws Exception {

	       String value=req.getServletPath();
	       model.addAttribute("url", value);
			model.addAttribute("search", search);
	 		search.setClient_name(id);
	 		
	 		// 전체 게시글 갯수
	 		int listCnt=0;
			try {
				listCnt=paidservice.getPaidListCnt(search);
				search.pageInfo(page, range, listCnt);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("pagination", search);
			model.addAttribute("list",paidservice.selectAll_paid(search));
			model.addAttribute("listCnt",listCnt);
			return "mypage/mybooking";
	}
	//마이페이지>예약상품(세부)
	@RequestMapping(value = "/mypage/paid/{idx}", method = RequestMethod.GET)
	public String detailpaid(Model model, @PathVariable ("idx") int paid_no) {
		paidservice.selectOne_paid(model, paid_no);
		return "mypage/detailmybooking";
	}
	//마이페이지>예약상품(세부)>결제
	@RequestMapping(value="/mypage/paidconfirm",method = RequestMethod.POST)
	public String paid_confirm(@ModelAttribute PaidVo bean) {
		paidservice.paid_confirm(bean);
		return "home";
	}
//관리자센터 	
	//관리자센터>결제관리
	@RequestMapping(value = "/system/paid", method = RequestMethod.GET)
	public String allpaid(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="paid_name") String searchType,
 			@RequestParam(required=false) String keyword,
 			@ModelAttribute("search") Search search,
 			HttpServletRequest req
	          ) throws Exception {

	       String value=req.getServletPath();
	       model.addAttribute("url", value);
		model.addAttribute("search", search);
 		search.setSearchType(searchType);
 		search.setKeyword(keyword);
 		
 		// 전체 게시글 갯수
 		int listCnt=0;
		try {
			listCnt=paidservice.getallPaidListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pagination", search);
		model.addAttribute("list",paidservice.selectAll_allpaid(search));
		model.addAttribute("listCnt",listCnt);
		return "system/allpaid";
	}
	//관리자센터>결제관리(결제상태별로 정렬)
	@RequestMapping(value = "/system/paidState", method = RequestMethod.GET)
	public String allpaidState(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required=false, defaultValue="1") int range,
			@RequestParam(required=false, defaultValue="paid_name") String searchType,
			@RequestParam(required=false) String keyword,
			@ModelAttribute("search") Search search,
			HttpServletRequest req
	          ) throws Exception {

	       String value=req.getServletPath();
	       model.addAttribute("url", value);
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt=0;
		try {
			listCnt=paidservice.getallPaidListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pagination", search);
		model.addAttribute("list",paidservice.selectAll_paidState(search));
		model.addAttribute("listCnt",listCnt);
		return "system/allpaid";
	}
	//관리자센터>결제관리(확정상태별로 정렬)
	@RequestMapping(value = "/system/paidConfirm", method = RequestMethod.GET)
	public String allpaidConfirm(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required=false, defaultValue="1") int range,
			@RequestParam(required=false, defaultValue="paid_name") String searchType,
			@RequestParam(required=false) String keyword,
			@ModelAttribute("search") Search search,
			HttpServletRequest req
	          ) throws Exception {

	       String value=req.getServletPath();
	       model.addAttribute("url", value);
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt=0;
		try {
			listCnt=paidservice.getallPaidListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pagination", search);
		model.addAttribute("list",paidservice.selectAll_paidConfirm(search));
		model.addAttribute("listCnt",listCnt);
		return "system/allpaid";
	}
	//관리자센터>결제관리(출발일 기준으로 정렬)
	@RequestMapping(value = "/system/paidDate", method = RequestMethod.GET)
	public String allpaidDate(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required=false, defaultValue="1") int range,
			@RequestParam(required=false, defaultValue="paid_name") String searchType,
			@RequestParam(required=false) String keyword,
			@ModelAttribute("search") Search search,
			HttpServletRequest req
	          ) throws Exception {

	       String value=req.getServletPath();
	       model.addAttribute("url", value);
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt=0;
		try {
			listCnt=paidservice.getallPaidListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pagination", search);
		model.addAttribute("list",paidservice.selectAll_paidDate(search));
		model.addAttribute("listCnt",listCnt);
		return "system/allpaid";
	}
	//관리자센터>결제관리(세부)
	@RequestMapping(value = "/system/paid/{idx}", method = RequestMethod.GET)
	public String detailallpaid(Model model, @PathVariable ("idx") int paid_no) {
		paidservice.selectOne_paid(model, paid_no);
		return "system/detailallpaid";
	}
	//관리자센터>결제관리(여행확정처리)
	@RequestMapping(value = "/system/paid/confirm", method = RequestMethod.POST)
	public String confirmallpaid(@ModelAttribute PaidVo bean) {
		paidservice.allpaid_confirm(bean);
		return "system/detailallpaid";
	}
	//관리자센터>투어관리
	@RequestMapping(value = "/system/tour", method = RequestMethod.GET)
	public String tour(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
	 		@RequestParam(required=false, defaultValue="1") int range,
	 		@RequestParam(required=false, defaultValue="land") String searchType,
	 		@RequestParam(required=false) String keyword,
	 		@ModelAttribute("search") Search search,
	 		HttpServletRequest req
			) throws Exception {

		    String value=req.getServletPath();
		    model.addAttribute("url", value);
	 			
			model.addAttribute("search", search);
	 		search.setSearchType(searchType);
	 		search.setKeyword(keyword);
	 		
	 		int listCnt=0;
			try {
				listCnt=tourservice.getallTourListCnt(search);
				search.pageInfo(page, range, listCnt);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("pagination", search);
			model.addAttribute("list",tourservice.selectAll_tour(search));
			model.addAttribute("listCnt",listCnt);
			return "system/alltour";
	}
	//관리자센터>투어관리(지역별로 정렬)
	@RequestMapping(value = "/system/arrayland", method = RequestMethod.GET)
	public String tour_arrayland(String id, Model model,
			 @RequestParam(required = false, defaultValue = "1") int page,
			 @RequestParam(required=false, defaultValue="1") int range,
			 @RequestParam(required=false, defaultValue="land") String searchType,
			 @RequestParam(required=false) String keyword,
			 @ModelAttribute("search") Search search,
			 HttpServletRequest req
			 ) throws Exception {

			 String value=req.getServletPath();
			 model.addAttribute("url", value);
					
			 model.addAttribute("search", search);
			 search.setSearchType(searchType);
			 search.setKeyword(keyword);
			 		
			 int listCnt=0;
			try {
				listCnt=tourservice.getallTourListCnt(search);
				search.pageInfo(page, range, listCnt);
			} catch (Exception e) {
					e.printStackTrace();
			}
					
			model.addAttribute("pagination", search);
			model.addAttribute("list",tourservice.selectAll_tour_arrayland(search));
			model.addAttribute("listCnt",listCnt);
			return "system/alltour";
	}
	//관리자센터>투어관리(지역별로 정렬)
	@RequestMapping(value = "/system/arraycountry", method = RequestMethod.GET)
	public String tour_arraycountry(String id, Model model,
			 @RequestParam(required = false, defaultValue = "1") int page,
			 @RequestParam(required=false, defaultValue="1") int range,
			 @RequestParam(required=false, defaultValue="land") String searchType,
			 @RequestParam(required=false) String keyword,
			 @ModelAttribute("search") Search search,
			 HttpServletRequest req
			 ) throws Exception {

			 String value=req.getServletPath();
			 model.addAttribute("url", value);
					
			 model.addAttribute("search", search);
			 search.setSearchType(searchType);
			 search.setKeyword(keyword);
			 		
			 	int listCnt=0;
				try {
					listCnt=tourservice.getallTourListCnt(search);
					search.pageInfo(page, range, listCnt);
				} catch (Exception e) {
					e.printStackTrace();
				}
					
				model.addAttribute("pagination", search);
				model.addAttribute("list",tourservice.selectAll_tour_arraycountry(search));
				model.addAttribute("listCnt",listCnt);
				return "system/alltour";
	}
	//관리자센터>투어관리(세부)
	@RequestMapping(value = "/system/tour/{idx}", method = RequestMethod.GET)
	public String detailtour(Model model, @PathVariable ("idx") int tour_no,HttpServletResponse res, HttpServletRequest req) {
		tourservice.selectOne_tour(model, tour_no,res,req);
		return "system/detailalltour";
	}
	//관리자센터>투어관리(수정)
	@RequestMapping(value = "/system/tour/{idx}/edit", method = RequestMethod.GET)
	public String edittour(Model model, @PathVariable ("idx") int tour_no,HttpServletResponse res, HttpServletRequest req) {
		tourservice.selectOne_tour(model, tour_no,res,req);
		return "system/edittour";
	}
	//관리자센터>투어관리(수정이벤트)
	@RequestMapping(value = "/system/tour/editconfirm", method = RequestMethod.POST)
	public String editconfirm(@ModelAttribute TourVo bean) {
		tourservice.updateOne_tour(bean);
		return "redirect:../tour/"+bean.getTour_no();
	}	
	
}