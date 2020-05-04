package com.bit.project.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.project.common.Pagination;
import com.bit.project.common.Search;
import com.bit.project.file.UploadFileUtils;
import com.bit.project.model.entity.BoardVo;
import com.bit.project.model.entity.EventVo;
import com.bit.project.model.entity.FaqVo;
import com.bit.project.model.entity.FreeVo;
import com.bit.project.model.entity.NoticeVo;
import com.bit.project.model.entity.PartnerVo;
import com.bit.project.model.entity.ReplyVo;
import com.bit.project.model.entity.SendVo;
import com.bit.project.service.BoardService;
import com.bit.project.service.EventService;
import com.bit.project.service.FaqService;
import com.bit.project.service.FreeService;
import com.bit.project.service.NoticeService;
import com.bit.project.service.PartnerService;
import com.bit.project.service.ReplyService;
import com.bit.project.service.SendService;
//커뮤니티,이벤트,고객센터(내용리스트,작성,수정,삭제,댓글,쪽지주고받기) 게시글 컨트롤러
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	ReplyService replyService;
	@Autowired
	PartnerService partnerService;
	@Autowired
	FreeService freeService;
	@Autowired
	EventService eventService;
	@Autowired
	SendService sendService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	FaqService faqService;
	
	@Resource
	Pagination pagination;
	@Resource
	Search search;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 커뮤니티>여행후기 (기본 정렬)
 	@RequestMapping(value = "/board/review", method = RequestMethod.GET)
 	public String review(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="board_sub") String searchType,
 			@RequestParam(required=false) String keyword,
 			@ModelAttribute("search") Search search,
 			HttpServletRequest req
 			) throws Exception {

 		String value=req.getServletPath();
 		model.addAttribute("url", value);
 		
 		model.addAttribute("search", search);
 		search.setSearchType(searchType);
 		search.setKeyword(keyword);
 		//페이지 정렬
 		int listCnt=0;
		try {
			listCnt = boardService.getBoardListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",boardService.selectAll_review(search));
		model.addAttribute("listCnt",listCnt);
 		return "board/review";
 	}
 	
 	// 커뮤니티>여행후기 (나라별 정렬)
 	@RequestMapping(value="/board/reviewLocal", method=RequestMethod.GET)
 	public String reviewLocal(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="board_sub") String searchType,
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
			listCnt = boardService.getBoardListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",boardService.selectAll_reviewCity(search));
		model.addAttribute("listCnt",listCnt);
 		return "board/review";
 	}
 	
 	// 커뮤니티>여행후기 (테마별 정렬)
 	@RequestMapping(value="/board/reviewTheme", method=RequestMethod.GET)
 	public String reviewTheme(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="board_sub") String searchType,
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
			listCnt = boardService.getBoardListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",boardService.selectAll_reviewTheme(search));
		model.addAttribute("listCnt",listCnt);
 		return "board/review";
 	}
 	
 	// 커뮤니티>동행구하기
 	@RequestMapping(value = "/board/partner", method = RequestMethod.GET)
 	public String partner(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="partner_sub") String searchType,
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
			listCnt = partnerService.getPartnerListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",partnerService.selectAll_partner(search));
		model.addAttribute("listCnt",listCnt);
 		return "partner/partner";
 	}
 	
 	// 커뮤니티>자유게시판
 	@RequestMapping(value = "/board/free", method = RequestMethod.GET)
 	public String free(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="free_sub") String searchType,
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
			listCnt = freeService.getFreeListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",freeService.selectAll_free(search));
		model.addAttribute("listCnt",listCnt);
 		return "free/free";
 	}
 	
 	// 이벤트
 	@RequestMapping(value = "/board/event", method = RequestMethod.GET)
 	public String event(Model model, @RequestParam(required = false, defaultValue = "1") int page,
 			@RequestParam(required=false, defaultValue="1") int range,
 			@RequestParam(required=false, defaultValue="event_sub") String searchType,
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
			listCnt = eventService.getEventListCnt(search);
			search.pageInfo(page, range, listCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("pagination", search);
		model.addAttribute("list",eventService.selectAll_event(search));
		model.addAttribute("listCnt",listCnt);
 		return "event/event";
 	}
 	
 	// 고객센터>공지
  	@RequestMapping(value = "/board/notice", method = RequestMethod.GET)
  	public String notice(Model model, @RequestParam(required = false, defaultValue = "1") int page,
  			@RequestParam(required=false, defaultValue="1") int range,
  			@RequestParam(required=false, defaultValue="notice_sub") String searchType,
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
 			listCnt = noticeService.getNoticeListCnt(search);
 			search.pageInfo(page, range, listCnt);
 		} catch (Exception e) {
 			e.printStackTrace();
 		}

 		model.addAttribute("pagination", search);
 		model.addAttribute("list",noticeService.selectAll_notice(search));
 		model.addAttribute("listCnt",listCnt);
  		return "notice/notice";
  	}
  	// 고객센터>자주묻는질문
  	@RequestMapping(value="/board/faq", method=RequestMethod.GET)
  	public String faq(Model model, @RequestParam(required=false, defaultValue="faq_question") String searchType,
  			@RequestParam(required=false) String keyword,
  			@ModelAttribute("search") Search search
  			) throws Exception {

  		model.addAttribute("search", search);
  		search.setSearchType(searchType);
  		search.setKeyword(keyword);
  		

 		model.addAttribute("pagination", search);
 		model.addAttribute("list",faqService.selectAll_faq(search));
  		return "faq/faq";
  	}
  	
// 글쓰기 페이지로 이동
 	// 커뮤니티>여행후기>글쓰기
 	@RequestMapping(value = "/board/reviewIns", method = RequestMethod.GET)
 	public String reviewIns() {
 		return "board/write";
 	}
 	// 커뮤니티>동행구하기>글쓰기
 	@RequestMapping(value = "/board/partnerIns", method = RequestMethod.GET)
 	public String partnerIns() {
 		return "partner/write";
 	}
 	// 커뮤니티>자유게시판>글쓰기
 	@RequestMapping(value = "/board/freeIns", method = RequestMethod.GET)
 	public String freeIns() {
 		return "free/write";
 	}
 	// 이벤트>글쓰기
 	@RequestMapping(value = "/board/eventIns", method = RequestMethod.GET)
 	public String eventIns() {
 		return "event/write";
 	}
 	// 고객센터>공지>글쓰기
 	@RequestMapping(value="/board/noticeIns", method=RequestMethod.GET)
 	public String notice() {
 		return "notice/write";
 	}
 	
//	글쓰기 및 파일업로드 이벤트 실행
 	// 커뮤니티>여행후기>글쓰기
 	@RequestMapping(value = "/board/reviewIns", method = RequestMethod.POST)
 	public String reviewIns(@ModelAttribute BoardVo bean, MultipartFile file) throws Exception {
 		
 		String imgUploadPath = uploadPath + File.separator + "imgUpload";
 		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 		String fileName = null;

 		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
 			fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
 		} else {
 			fileName=uploadPath+File.separator+"images"+ File.separator+"none.png";
 		}

 		bean.setBoard_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 		bean.setBoard_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 		
 		boardService.insertOne_review(bean);
 		return "redirect:review";
 	}
 	
 	// 커뮤니티>동행구하기>글쓰기
  	@RequestMapping(value = "/board/partnerIns", method = RequestMethod.POST)
  	public String partnerIns(@ModelAttribute PartnerVo bean, MultipartFile file) throws Exception {
  		
  		String imgUploadPath = uploadPath + File.separator + "imgUpload";
  		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
  		String fileName = null;

  		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
  			fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
  		} else {
  			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
  		}

  		bean.setPartner_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
  		bean.setPartner_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
  		
  		partnerService.insertOne_partner(bean);
  		return "redirect:partner";
  	}
  	
  	// 커뮤니티>자유게시판>글쓰기
  	@RequestMapping(value = "/board/freeIns", method = RequestMethod.POST)
  	public String freeIns(@ModelAttribute FreeVo bean, MultipartFile file) throws Exception {
  		
  		String imgUploadPath = uploadPath + File.separator + "imgUpload";
  		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
  		String fileName = null;

  		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
  			fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
  		} else {
  			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
  		}

  		bean.setFree_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
  		bean.setFree_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
  		
  		freeService.insertOne_free(bean);
  		return "redirect:free";
  	}
  	
  	// 이벤트>글쓰기
  	@RequestMapping(value = "/board/eventIns", method = RequestMethod.POST)
  	public String eventIns(@ModelAttribute EventVo bean, MultipartFile file) throws Exception {
  		
  		String imgUploadPath = uploadPath + File.separator + "imgUpload";
  		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
  		String fileName = null;

  		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
  			fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
  		} else {
  			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
  		}

  		bean.setEvent_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
  		bean.setEvent_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
  		
  		eventService.insertOne_event(bean);
  		return "redirect:event";
  	}
  	
  	// 고객센터>공지>글쓰기
   	@RequestMapping(value = "/board/noticeIns", method = RequestMethod.POST)
   	public String noticetIns(@ModelAttribute NoticeVo bean, MultipartFile file) throws Exception {
   		
   		String imgUploadPath = uploadPath + File.separator + "imgUpload";
   		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
   		String fileName = null;

   		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
   			fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
   		} else {
   			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
   		}

   		bean.setNotice_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
   		bean.setNotice_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
   		
   		noticeService.insertOne_notice(bean);
   		return "redirect:notice";
   	}
   	
   	// 고객센터>자주묻는질문>글쓰기
   	@RequestMapping(value="/board/faqIns", method=RequestMethod.POST)
   	public String faqIns(@ModelAttribute FaqVo bean) {
   		faqService.insertOne_faq(bean);
   		return "redirect:faq";
   	}
   	
// 게시판 내용 상세 페이지(클릭시 이벤트)
  	// 커뮤니티>여행후기
 	@RequestMapping(value="/board/reviewDe/{idx}",method=RequestMethod.GET)
 	public String detailReview(@PathVariable("idx") int key, Model model) {
 		boardService.selectOne_review(key, model);
 		replyService.selectAll_Board_reply(key, model);
 		return "board/detail";
 	}
 	// 커뮤니티>동행구하기
 	@RequestMapping(value="/board/partnerDe/{idx}",method=RequestMethod.GET)
 	public String detailPartner(@PathVariable("idx") int key, Model model) {
 		partnerService.selectOne_partner(key, model);
 		replyService.selectAll_Partner_reply(key, model);
 		return "partner/detail";
 	}
 	// 커뮤니티>자유게시판
 	@RequestMapping(value="/board/freeDe/{idx}",method=RequestMethod.GET)
 	public String detailFree(@PathVariable("idx") int key, Model model) {
 		freeService.selectOne_free(key, model);
 		replyService.selectAll_Free_reply(key, model);
 		return "free/detail";
 	}
 	// 이벤트
 	@RequestMapping(value="/board/eventDe/{idx}",method=RequestMethod.GET)
 	public String detailEvent(@PathVariable("idx") int key, Model model) {
 		eventService.selectOne_event(key, model);
 		replyService.selectAll_Event_reply(key, model);
 		return "event/detail";
 	}
	// 고객센터>공지
  	@RequestMapping(value="/board/noticeDe/{idx}",method=RequestMethod.GET)
  	public String noticeEvent(@PathVariable("idx") int key, Model model) {
  		noticeService.selectOne_notice(key, model);
  		return "notice/detail";
  	}
//	수정페이지로 이동
 	// 커뮤니티>여행후기
 	@RequestMapping(value = "/board/reviewUp/{idx}", method = RequestMethod.GET)
 	public String update(@PathVariable("idx") int key, Model model) {
 		boardService.selectOne_review(key, model);
 		return "board/update";
 	}
 	// 커뮤니티>동행구하기
 	@RequestMapping(value = "/board/partnerUp/{idx}", method = RequestMethod.GET)
 	public String partnerUp(@PathVariable("idx") int key, Model model) {
 		partnerService.selectOne_partner(key, model);
 		return "partner/update";
 	}
 	// 커뮤니티>자유게시판
 	@RequestMapping(value = "/board/freeUp/{idx}", method = RequestMethod.GET)
 	public String freeUp(@PathVariable("idx") int key, Model model) {
 		freeService.selectOne_free(key, model);
 		return "free/update";
 	}
 	// 이벤트
 	@RequestMapping(value = "/board/eventUp/{idx}", method = RequestMethod.GET)
 	public String eventUp(@PathVariable("idx") int key, Model model) {
 		eventService.selectOne_event(key, model);
 		return "event/update";
 	}
 	// 고객센터>공지
 	@RequestMapping(value = "/board/noticeUp/{idx}", method = RequestMethod.GET)
 	public String noticeUp(@PathVariable("idx") int key, Model model) {
 		noticeService.selectOne_notice(key, model);
 		return "notice/update";
 	}
 	// 후기 지역변경 (selectbox)
 	@RequestMapping(value="/board/updateLand", method=RequestMethod.POST)
 	public String updateLand(int key, Model model) {
 		boardService.select_land(key, model);
 		return "board/update";
 	}
 	
// 수정완료 이벤트 후 상세페이지로 이동
 	// 커뮤니티>여행후기
 	@RequestMapping(value="/board/reviewUp/{idx}", method=RequestMethod.POST)
	public String reviewUp(@ModelAttribute BoardVo bean, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
 		
 		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="") {
  			new File(uploadPath + req.getParameter("board_img")).delete();
 			new File(uploadPath + req.getParameter("board_thumb")).delete();
 		  
 			String imgUploadPath = uploadPath + File.separator + "imgUpload";
 			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
 		  
 			bean.setBoard_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 			bean.setBoard_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 		  
 		} else {
 			bean.setBoard_img(req.getParameter("board_img"));
 			bean.setBoard_thumb(req.getParameter("board_thumb"));
 		 }
 		 
 		boardService.updateOne_review(bean);
 		return "redirect:../reviewDe/"+bean.getBoard_no();
 	}
 	// 커뮤니티>동행구하기
 	@RequestMapping(value="/board/partnerUp/{idx}", method=RequestMethod.POST)
	public String partnerUp(@ModelAttribute PartnerVo bean, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
 			
 		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="") {
 			new File(uploadPath + req.getParameter("partner_img")).delete();
 			new File(uploadPath + req.getParameter("partner_thumb")).delete();
 		  
 			String imgUploadPath = uploadPath + File.separator + "imgUpload";
 			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
 		  
 			bean.setPartner_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 			bean.setPartner_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 		  
 		} else {
 			bean.setPartner_img(req.getParameter("partner_img"));
 			bean.setPartner_thumb(req.getParameter("partner_thumb"));
 		 }
 		 
 		partnerService.updateOne_partner(bean);
 		return "redirect:../partnerDe/"+bean.getBoard_no();
 	}
 	// 커뮤니티>자유게시판
 	@RequestMapping(value="/board/freeUp/{idx}", method=RequestMethod.POST)
	public String freeUp(@ModelAttribute FreeVo bean, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
 		
 		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="") {
 			new File(uploadPath + req.getParameter("free_img")).delete();
 			new File(uploadPath + req.getParameter("free_thumb")).delete();
 		  
 			String imgUploadPath = uploadPath + File.separator + "imgUpload";
 			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
 		  
 			bean.setFree_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 			bean.setFree_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 		  
 		} else {
 			bean.setFree_img(req.getParameter("free_img"));
 			bean.setFree_thumb(req.getParameter("free_thumb"));
 		 }
 		 
 		freeService.updateOne_free(bean);
 		return "redirect:../freeDe/"+bean.getBoard_no();
 	}
 	// 이벤트
 	@RequestMapping(value="/board/eventUp/{idx}", method=RequestMethod.POST)
	public String eventUp(@ModelAttribute EventVo bean, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
 		
 		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="") {
 			new File(uploadPath + req.getParameter("event_img")).delete();
 			new File(uploadPath + req.getParameter("event_thumb")).delete();
 		  
 			String imgUploadPath = uploadPath + File.separator + "imgUpload";
 			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
 		  
 			bean.setEvent_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 			bean.setEvent_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 		  
 		} else {
 			bean.setEvent_img(req.getParameter("event_img"));
 			bean.setEvent_thumb(req.getParameter("event_thumb"));
 		 }
 		 
 		eventService.updateOne_event(bean);
 		return "redirect:../eventDe/"+bean.getBoard_no();
 	}
 	// 고객센터>공지
 	@RequestMapping(value="/board/noticeUp/{idx}", method=RequestMethod.POST)
	public String noticeUp(@ModelAttribute NoticeVo bean, MultipartFile file, HttpServletRequest req) throws IOException, Exception {
 		
 		if(file.getOriginalFilename()!= null && file.getOriginalFilename()!="") {
 			new File(uploadPath + req.getParameter("notice_img")).delete();
 			new File(uploadPath + req.getParameter("notice_thumb")).delete();
 		  
 			String imgUploadPath = uploadPath + File.separator + "imgUpload";
 			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
 			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
 		  
 			bean.setNotice_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
 			bean.setNotice_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
 		  
 		} else {
 			bean.setNotice_img(req.getParameter("notice_img"));
 			bean.setNotice_thumb(req.getParameter("notice_thumb"));
 		 }
 		 
 		noticeService.updateOne_notice(bean);
 		return "redirect:../noticeDe/"+bean.getNotice_no();
 	}
 	@RequestMapping(value="/board/faqUp", method=RequestMethod.POST)
 	public String faqUp(@ModelAttribute FaqVo bean) {
 		faqService.updateOne_faq(bean);
 		return "redirect:faq";
 	}
// 게시글 삭제
 	// 커뮤니티>여행후기
 	@RequestMapping(value="/board/reviewDel", method=RequestMethod.POST)
 	public String reviewDel(int key) {
 		boardService.deleteOne_review(key);
 		return "redirect:review";
 	}
 	// 커뮤니티>동행구하기
 	@RequestMapping(value="/board/partnerDel", method=RequestMethod.POST)
 	public String partnerDel(int key) {
 		partnerService.deleteOne_partner(key);
 		return "redirect:partner";
 	}
 	// 커뮤니티>자유게시판
 	@RequestMapping(value="/board/freeDel", method=RequestMethod.POST)
 	public String freeDel(int key) {
 		freeService.deleteOne_free(key);
 		return "redirect:free";
 	}
 	// 이벤트
 	@RequestMapping(value="/board/eventDel", method=RequestMethod.POST)
 	public String eventDel(int key) {
 		eventService.deleteOne_event(key);
 		return "redirect:event";
 	}
 	// 고객센터>공지사항
  	@RequestMapping(value="/board/noticeDel", method=RequestMethod.POST)
  	public String noticeDel(int key) {
  		noticeService.deleteOne_notice(key);
  		return "redirect:notice";
  	}
  	// 고객센터>자주묻는질문
  	@RequestMapping(value="/board/faqDel", method=RequestMethod.POST)
  	public String fqaDel(int key) {
  		faqService.deleteOne_faq(key);
  		return "redirect:faq";
  	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 	
//	댓글작성
 	// 커뮤니티>여행후기
 	@RequestMapping(value="/board/reviewRepIn", method=RequestMethod.POST)
 	public String reviewRepIn(@ModelAttribute ReplyVo bean) {
 		replyService.insertOne_Board_reply(bean);
 		return "board/detail";
 	}
	// 커뮤니티>동행구하기
  	@RequestMapping(value="/board/partnerRepIn", method=RequestMethod.POST)
  	public String partnerRepIn(@ModelAttribute ReplyVo bean) {
  		replyService.insertOne_Partner_reply(bean);
  		return "partner/detail";
  	}
	// 커뮤니티>자유게시판
  	@RequestMapping(value="/board/freeRepIn", method=RequestMethod.POST)
  	public String freeRepIn(@ModelAttribute ReplyVo bean) {
  		replyService.insertOne_Free_reply(bean);
  		return "free/detail";
  	}
	// 이벤트
  	@RequestMapping(value="/board/eventRepIn", method=RequestMethod.POST)
  	public String eventRepIn(@ModelAttribute ReplyVo bean) {
  		replyService.insertOne_Event_reply(bean);
  		return "event/detail";
  	}

// 댓글수정
  	// 커뮤니티>여행후기
  	@RequestMapping(value="/board/reviewRepUp", method=RequestMethod.POST)
  	public String reviewRepUp(@ModelAttribute ReplyVo bean) {
  		replyService.updateOne_reply(bean);
  		return "board/detail";
  	}
	// 커뮤니티>동행구하기
   	@RequestMapping(value="/board/partnerRepUp", method=RequestMethod.POST)
   	public String partnerRepUp(@ModelAttribute ReplyVo bean) {
   		replyService.updateOne_reply(bean);
   		return "partner/detail";
   	}
	// 커뮤니티>자유게시판
   	@RequestMapping(value="/board/freeRepup", method=RequestMethod.POST)
   	public String freeRepup(@ModelAttribute ReplyVo bean) {
   		replyService.updateOne_reply(bean);
   		return "free/detail";
   	}
	// 이벤트
   	@RequestMapping(value="/board/eventRepUp", method=RequestMethod.POST)
   	public String eventRepUp(@ModelAttribute ReplyVo bean) {
   		replyService.updateOne_reply(bean);
   		return "event/detail";
   	}
  	
// 댓글삭제
   	// 커뮤티니>여행후기
  	@RequestMapping(value="/board/reviewRepDel", method=RequestMethod.POST)
  	public String reviewRepDel(int key) {
  		replyService.deleteOne_reply(key);
  		return "board/detail";
  	}
   	// 커뮤니티>동행구하기
  	@RequestMapping(value="/board/partnerRepDel", method=RequestMethod.POST)
  	public String partnerRepDel(int key) {
  		replyService.deleteOne_reply(key);
  		return "partner/detail";
  	}
   	// 커뮤니티>자유게시판
  	@RequestMapping(value="/board/freeRepDel", method=RequestMethod.POST)
  	public String freeRepDel(int key) {
  		replyService.deleteOne_reply(key);
  		return "free/detail";
  	}
   	// 이벤트
  	@RequestMapping(value="/board/eventRepDel", method=RequestMethod.POST)
  	public String eventRepDel(int key) {
  		replyService.deleteOne_reply(key);
  		return "event/detail";
  	}
  	
// 쪽지 주고받기 
  	// 쪽지발송페이지
 	@RequestMapping(value = "/partner", method = RequestMethod.GET)
 	public String msg(String id) {
 		return "partner/sendMsg";
 	}
 	
 	// 쪽지발송 이벤트
 	@RequestMapping(value = "/partner", method = RequestMethod.POST)
 	public String msgSend(SendVo bean) {
 		sendService.insertOne_send(bean);
 		return "partner/sendMsg";
 	}
 	

}