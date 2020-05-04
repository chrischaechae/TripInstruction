package com.bit.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.common.Search;
import com.bit.project.service.ReceiveService;
import com.bit.project.service.TourService;

@Controller
public class HomeController {
	
	@Autowired
	ReceiveService receiveService;
	@Autowired
	TourService tourService;
	
	//메인홈
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		tourService.selectAll_recomm1(model);
		tourService.selectAll_recomm2(model);
		tourService.selectAll_recomm3(model);
		return "home";
	}
	//안읽은 쪽지
	@RequestMapping(value = "/count", method = RequestMethod.POST)
	public ModelAndView count(String client_nick2) throws Exception {
			
			int data = receiveService.select_receiveUnCnt(client_nick2);
			ModelAndView mav = new ModelAndView();
			mav.addObject("Data", data);
			mav.setViewName("jsonView");
		return mav;
	}
	//메인검색기능
	@RequestMapping(value="/tour", method=RequestMethod.GET)
	public String tour(Model model, @RequestParam(required=false, defaultValue="board_sub") String searchType,
 			@RequestParam(required=false) String keyword,
 			@ModelAttribute("search") Search search) throws Exception {
		model.addAttribute("list", tourService.homeSearch(search));
		return "tour/maintour";
	}
}
