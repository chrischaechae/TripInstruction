package com.bit.project.controller;


import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.common.Search;
import com.bit.project.file.UploadFileUtils;
import com.bit.project.model.entity.ClientVo;
import com.bit.project.model.entity.GuideVo;
import com.bit.project.model.entity.StaffVo;
import com.bit.project.service.ClientService;
import com.bit.project.service.GuideService;
import com.bit.project.service.StaffService;
//직원로그인 후 마이페이지 및 관리자센터 컨트롤러
@Controller
public class StaffController {
	
	@Autowired
	StaffService staffService;
	@Autowired
	GuideService guideService;
	@Autowired
	ClientService clientService;
	@Resource
	Search search;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	//직원>내정보관리
	@RequestMapping(value="/main/staffinfo",method=RequestMethod.GET)
	public String Staffinfo() {
		return "/mypage/staffinfo";
	}
	
	//직원>내정보관리(정보확인 전 비밀번호 확인)
	@RequestMapping(value="/main/mypage/lock2",method=RequestMethod.GET)
	public String Changeinfo() {
		return "/mypage/lock";
	}
	
	//직원>내정보관리(정보확인 전 비밀번호 확인)
	@RequestMapping(value="/main/mypage/lock2",method=RequestMethod.POST)
	public ModelAndView Lock(StaffVo bean) throws Exception {
		StaffVo pwcheck = staffService.loginCheck(bean);
		ModelAndView mav=new ModelAndView();
		if(pwcheck != null) {
			mav.setViewName("/mypage/changestaffpw");
		}else {
			mav.addObject("msg", "fail");
			mav.setViewName("mypage/lock");
		}
		return mav;
	}
	
	//직원>내정보관리(비밀번호변경)
	@RequestMapping(value="/main/mypage/changestaffpw",method=RequestMethod.POST)
	public ModelAndView Changepw(StaffVo bean, HttpServletRequest req) throws Exception {
		staffService.changePw(bean);
		HttpSession session=req.getSession();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("jsonView");
		session.invalidate();
		return mav;
	}
	
	//관리자센터>직원관리
	@RequestMapping(value = "/system/staff", method = RequestMethod.GET)
 	public String staff(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="staff_name") String searchType,
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
			listCnt = staffService.getStaffListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",staffService.selectAll_staff(search));
		model.addAttribute("listCnt",listCnt);
 		return "/system/staff";
 	}
	
	//관리자센터>직원관리(사번별 정렬)
 	@RequestMapping(value="/system/staffNo", method=RequestMethod.GET)
 	public String staffNo(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="staff_name") String searchType,
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
			listCnt = staffService.getStaffListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",staffService.selectAll_staffNo(search));
		model.addAttribute("listCnt",listCnt);
 		return "/system/staff";
 	}
 	
 	//관리자센터>직원관리(부서별 정렬)
 	@RequestMapping(value="/system/staffTeam", method=RequestMethod.GET)
 	public String staffTeam(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="staff_name") String searchType,
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
			listCnt = staffService.getStaffListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",staffService.selectAll_staffTeam(search));
		model.addAttribute("listCnt",listCnt);
 		return "/system/staff";
 	}
 	
 	//관리자센터>직원관리>등록
 	@RequestMapping(value = "/system/staffIns", method = RequestMethod.GET)
 	public String staffIns() {
 		return "/system/staffenroll";
 	}
 	
 	//관리자센터>직원관리>등록
 	@RequestMapping(value="/system/staffIns",method=RequestMethod.POST)
    public String staffIns(@ModelAttribute StaffVo bean, MultipartFile file) throws Exception {
  		
  		String imgUploadPath = uploadPath + File.separator + "imgUpload";
  		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
  		String fileName = null;

  		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
  			fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
  		} else {
  			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
  		}

  		bean.setStaff_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
  		bean.setStaff_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
  		
  		staffService.insertOne_staff(bean);
 		return "redirect:/system/staff";
 	}
 	
 	//관리자센터>직원관리(세부)
 	@RequestMapping(value="/system/staffDe/{idx}",method=RequestMethod.GET)
 	public String staffDetail(@PathVariable("idx") int key, Model model) {
 		staffService.selectOne_staff(key, model);
 		return "/system/staffdetail";
 	}
 	
 	//관리자센터>직원관리(정보수정페이지)
 	@RequestMapping(value="/system/staffEdit/{idx}",method=RequestMethod.GET)
	public String staffEdit(@PathVariable("idx") int key, Model model) {
 		staffService.selectOne_staff(key, model);
		return "/system/staffedit";
	}
 	
 	//관리자센터>직원관리(정보수정이벤트)
 	@RequestMapping(value="/system/staffEdit/{idx}", method=RequestMethod.POST)
	public String staffEdit(@ModelAttribute StaffVo bean, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
 		
 		// 새로운 파일이 등록되었는지 확인
 		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="") {
 			// 기존 파일 삭제
 			new File(uploadPath + req.getParameter("staff_img")).delete();
 			new File(uploadPath + req.getParameter("staff_thumb")).delete();
 		  
 			// 새로 첨부한 파일 등록
 			String imgUploadPath = uploadPath + File.separator + "imgUpload";
 			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
 		  
 			bean.setStaff_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 			bean.setStaff_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 		  
 		} else {
 			// 기존 이미지 그대로 사용
 			bean.setStaff_img(req.getParameter("staff_img"));
 			bean.setStaff_thumb(req.getParameter("staff_thumb"));
 		 }
 		
 		staffService.updateOne_staff(bean);
 		return "redirect:../staffDe/"+bean.getStaff_no();
 	}
 	
 	//관리자센터>직원관리(삭제)
 	@RequestMapping(value="/system/staffDel", method=RequestMethod.POST)
	public String staffDel(int key) {
 		staffService.deleteOne_staff(key);
		return "redirect:/system/staff";
	}
 	
 	//관리자센터>가이드관리
 	@RequestMapping(value = "/system/guide", method = RequestMethod.GET)
 	public String guide(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="guide_name") String searchType,
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
			listCnt = guideService.getGuideListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",guideService.selectAll_guide(search));
		model.addAttribute("listCnt",listCnt);
 		return "/system/guide";
 	}
 	
	//관리자센터>가이드관리(가이드 번호별 정렬)
 	@RequestMapping(value="/system/guideNo", method=RequestMethod.GET)
 	public String guideNo(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="guide_name") String searchType,
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
			listCnt = guideService.getGuideListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",guideService.selectAll_guideNo(search));
		model.addAttribute("listCnt",listCnt);
 		return "/system/guide";
 	}
 	
 	//관리자센터>가이드관리(가이드 이름별 정렬)
 	@RequestMapping(value="/system/guideName", method=RequestMethod.GET)
 	public String guideName(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="guide_name") String searchType,
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
			listCnt = guideService.getGuideListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",guideService.selectAll_guideName(search));
		model.addAttribute("listCnt",listCnt);
 		return "/system/guide";
 	}
 	
 	//관리자센터>가이드관리(가이드 지역별 정렬)
 	@RequestMapping(value="/system/guideCity", method=RequestMethod.GET)
 	public String guideCity(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="guide_name") String searchType,
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
 			listCnt = guideService.getGuideListCnt(search);
 			search.pageInfo(page, range, listCnt);
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		
 		model.addAttribute("pagination", search);
 		model.addAttribute("list",guideService.selectAll_guideCity(search));
 		model.addAttribute("listCnt",listCnt);
 		return "/system/guide";
 	}
 	
 	//관리자센터>가이드관리>등록(페이지이동)
 	@RequestMapping(value = "/system/guideIns", method = RequestMethod.GET)
 	public String guideIns() {
 		return "/system/guideenroll";
 	}
 	
 	 //관리자센터>가이드관리>등록(이벤트실행)
 	@RequestMapping(value="/system/guideIns",method=RequestMethod.POST)
 	public String guideIns(@ModelAttribute GuideVo bean, MultipartFile file) throws Exception {
 	  		
 	  	String imgUploadPath = uploadPath + File.separator + "imgUpload";
 	  	String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 	  	String fileName = null;

 	  	if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
 	  		fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
 	  	} else {
 	  		fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
 	  	}

 	  	bean.setGuide_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 	  	bean.setGuide_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 	 	guideService.insertOne_guide(bean);
 	 	return "redirect:/system/guide";
 	 }
 	 	
 	 //관리자센터>가이드관리(세부정보)
 	 @RequestMapping(value="/system/guideDe/{idx}",method=RequestMethod.GET)
 	 public String guideDetail(@PathVariable("idx") int key, Model model) {
 	 	guideService.selectOne_guide(key, model);
 	 	return "/system/guidedetail";
 	 }
 	 
 	 //관리자센터>가이드관리(정보수정페이지)
 	 @RequestMapping(value="/system/guideEdit/{idx}",method=RequestMethod.GET)
 	 public String guideEdit(@PathVariable("idx") int key, Model model) {
 	 	guideService.selectOne_guide(key, model);
 		return "/system/guideedit";
 	 }
 	 
 	 //관리자센터>가이드관리(정보수정이벤트)
 	 @RequestMapping(value="/system/guideEdit/{idx}", method=RequestMethod.POST)
 	 public String guideEdit(@ModelAttribute GuideVo bean, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
 	 		
 	 		// 새로운 파일이 등록되었는지 확인
 	 		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="") {
 	 			// 기존 파일 삭제
 	 			new File(uploadPath + req.getParameter("guide_img")).delete();
 	 			new File(uploadPath + req.getParameter("guide_thumb")).delete();
 	 		  
 	 			// 새로 첨부한 파일 등록
 	 			String imgUploadPath = uploadPath + File.separator + "imgUpload";
 	 			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 	 			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
 	 		  
 	 			bean.setGuide_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 	 			bean.setGuide_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 	 		  
 	 		} else {
 	 			// 기존 이미지 그대로 사용
 	 			bean.setGuide_img(req.getParameter("guide_img"));
 	 			bean.setGuide_thumb(req.getParameter("guide_thumb"));
 	 		 }
 	 		 
 	 		guideService.updateOne_guide(bean);
 	 		return "redirect:../guideDe/"+bean.getGuide_no();
 	  }
 	 
 	 //관리자센터>가이드관리(삭제)
 	 @RequestMapping(value="/system/guideDel", method=RequestMethod.POST)
 	 public String guideDel(int key) {
 	  	 guideService.deleteOne_guide(key);
 		 return "redirect:/system/guide";
 	 }
 	 	
 	 //관리자센터>회원관리
 	 @RequestMapping(value = "/system/client", method = RequestMethod.GET)
 	 public String client(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 	 		@RequestParam(required=false, defaultValue="1") int range,
 	 		@RequestParam(required=false, defaultValue="client_name") String searchType,
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
 				listCnt = clientService.getClientListCnt(search);
 				search.pageInfo(page, range, listCnt);
 			} catch (Exception e) {
 				e.printStackTrace();
 			}

 			model.addAttribute("pagination", search);
 			model.addAttribute("list",clientService.selectAll_client(search));
 			model.addAttribute("listCnt",listCnt);
 	 		return "/system/client";
 	  }
 	 
 	  //관리자센터>회원관리(회원 이름별 정렬)
 	  @RequestMapping(value="/system/clientName", method=RequestMethod.GET)
 	  public String clientNo(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 	 		@RequestParam(required=false, defaultValue="1") int range,
 	 		@RequestParam(required=false, defaultValue="client_name") String searchType,
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
 				listCnt = clientService.getClientListCnt(search);
 				search.pageInfo(page, range, listCnt);
 			} catch (Exception e) {
 				e.printStackTrace();
 			}

 			model.addAttribute("pagination", search);
 			model.addAttribute("list",clientService.selectAll_clientName(search));
 			model.addAttribute("listCnt",listCnt);
 	 		return "/system/client";
 	 }
 	  
 	 //관리자센터>회원관리(회원 세부정보)
 	 @RequestMapping(value="/system/clientDe/{idx}",method=RequestMethod.GET)
 	 public String clientDetail(@PathVariable("idx") int key, Model model) {
 	 	clientService.selectOne_client(key, model);
 	 	return "/system/clientdetail";
 	 }
 	 
 	 //관리자센터>회원관리(회원 정보수정페이지)
 	 @RequestMapping(value="/system/clientEdit/{idx}",method=RequestMethod.GET)
 	 public String clientEdit(@PathVariable("idx") int key, Model model) {
 	 	clientService.selectOne_client(key, model);
 		return "/system/clientedit";
 	}
 	 
 	 //관리자센터>회원관리(회원 정보수정이벤트)
 	 @RequestMapping(value="/system/clientEdit/{idx}", method=RequestMethod.POST)
 	 public String clientEdit(@PathVariable("idx") int key, ClientVo bean){
 	 	clientService.updateOne_client(bean);
 	 	return "redirect:../clientDe/"+bean.getClient_no();
 	 }
 	 
 	 //관리자센터>회원관리(회원 삭제)
 	 @RequestMapping(value="/system/clientDel", method=RequestMethod.POST)
 	 public String clientDel(int key) {
 	 	clientService.deleteOne_client(key);
 		return "redirect:/system/client";
 	}
}
