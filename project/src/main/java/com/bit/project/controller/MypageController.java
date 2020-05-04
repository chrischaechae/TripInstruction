package com.bit.project.controller;


import javax.servlet.http.HttpServletRequest;
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
import com.bit.project.model.entity.ClientVo;
import com.bit.project.model.entity.WishVo;
import com.bit.project.service.BoardService;
import com.bit.project.service.ClientService;
import com.bit.project.service.ReceiveService;
import com.bit.project.service.WishService;
//로그인 시 마이페이지 컨트롤러
@Controller
public class MypageController {

	@Autowired
	ReceiveService receiveService;
	@Autowired
	ClientService clientService;
	@Autowired
	BoardService boardService;
	@Autowired
	WishService wishService; 
	
	
	//	쪽지함으로 이동
	@RequestMapping(value="/main/message", method=RequestMethod.GET)
	public String receiveMsg(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="receive_content") String searchType,
 			@RequestParam(required=false) String keyword,
 			@ModelAttribute("search") Search search,
 			HttpServletRequest req
 			) throws Exception {

 		String value=req.getServletPath();
 		model.addAttribute("url", value);
		model.addAttribute("search", search);
 		search.setSearchType(searchType);
 		search.setKeyword(keyword);
 		search.setClient_nick2(id);
 		
 		int listCnt=0;
		try {
			listCnt=receiveService.getReceiveListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pagination", search);
		model.addAttribute("list",receiveService.selectAll_receive(search));
		model.addAttribute("listCnt",listCnt);
		return "mypage/message";
	}
	
	// 쪽지 상세보기 + 쪽지 확인시 읽음처리
	@RequestMapping(value="/main/messageDe/{idx}", method=RequestMethod.GET)
	public String receiveMsg(@PathVariable("idx") int key, Model model) {
		receiveService.selectOne_receive(key, model);
		return "mypage/receiveMsg";
	}
	// 쪽지 삭제
	@RequestMapping(value="/main/messageDele", method=RequestMethod.POST)
	public String receiveMsgDel(int key) {
		receiveService.deleteOne_receive(key);
		return "mypage/message";
	}
	// 실시간 받은 쪽지
	@RequestMapping(value="/main/partnerMessage", method=RequestMethod.GET)
	public String partnerMsg(String key, Model model) throws Exception {
		receiveService.selectOne_receiveLimitOne(key, model);
		return "mypage/sockMsg";
	}
	// 선택쪽지 읽음 처리
	@RequestMapping(value="/main/allMsg", method=RequestMethod.GET)
	public String read(int key) throws Exception {
		receiveService.updateOne_receive(key);
		return "mypage/sockMsg";
	}
	// 내가 쓴 글
  	@RequestMapping(value="/main/myBoard", method=RequestMethod.GET)
  	public String myBoard(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="receive_content") String searchType,
 			@RequestParam(required=false) String keyword,
 			@ModelAttribute("search") Search search,
 			HttpServletRequest req
 			) throws Exception {

 		String value=req.getServletPath();
 		model.addAttribute("url", value);
  		model.addAttribute("search", search);
  		search.setSearchType(searchType);
 		search.setKeyword(keyword);
 		search.setClient_nick1(id);
 		
 		// 전체 게시글 갯수
 		int listCnt=0;
		try {
			listCnt=boardService.myBoardTotal(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
 		
		model.addAttribute("pagination", search);
		model.addAttribute("list",boardService.myBoardList(search));
		model.addAttribute("listCnt",listCnt);
  		return "mypage/myBoard";
  	}
  	//내정보관리
  	@RequestMapping(value="/main/myinfo", method=RequestMethod.GET)
  	public String Myinfo() {
  		return "mypage/myinfo";
  	}
  	
  	//내정보수정 비밀번호 확인
  	@RequestMapping(value="/main/mypage/lock", method=RequestMethod.GET)
  	public String Changeinfo() {
  		return "mypage/lock";
  	}
  	
  	//내정보수정 비밀번호 확인
  	@RequestMapping(value="/main/mypage/lock", method=RequestMethod.POST)
  	public ModelAndView Lock(ClientVo bean) throws Exception {
  		ClientVo pwcheck = clientService.loginCheck(bean);
  		ModelAndView mav=new ModelAndView();
  		if(pwcheck != null) {
  			mav.setViewName("mypage/changemyinfo");
  		}else {
  			mav.addObject("msg2", "fail");
  			mav.setViewName("mypage/lock");
  		}
  		return mav;
  	}
  	
  	//내정보수정
  	@RequestMapping(value="/main/mypage/changemyinfo", method=RequestMethod.POST)
  	public ModelAndView Changeinfo(ClientVo bean, HttpServletRequest req) throws Exception {
  		
  		clientService.changeInfo(bean);
  		HttpSession session=req.getSession();
  		ClientVo update = (ClientVo)session.getAttribute("check");
  		update.setClient_nick1(bean.getClient_nick1());
  		update.setClient_nick2(bean.getClient_nick1());
  		update.setClient_phone(bean.getClient_phone());
  		ModelAndView mav=new ModelAndView();
  		mav.setViewName("redirect:/main/myinfo");
  		return mav;
  	}
  	
  	//비밀번호 변경 페이지로 이동
  	@RequestMapping(value="/main/mypage/changepw", method=RequestMethod.GET)
  	public String Changepw() {
  		return "mypage/changepw";
  	}
  	//비밀번호 변경 이벤트 실행
  	@RequestMapping(value="/main/mypage/changepw", method=RequestMethod.POST)
  	public ModelAndView Changepw(ClientVo bean, HttpServletRequest req) throws Exception {
  		ModelAndView mav=new ModelAndView();
  		clientService.changePw(bean);
  		HttpSession session=req.getSession();
  		ClientVo change = (ClientVo)session.getAttribute("check");
  		mav.addObject("changepw", change.getClient_pw());
  		mav.setViewName("jsonView");
  		session.invalidate();
  		return mav;
  	}
  	
  	
}
