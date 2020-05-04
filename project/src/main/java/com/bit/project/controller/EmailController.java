package com.bit.project.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.project.model.entity.ClientVo;
import com.bit.project.service.ClientService;
//아이디,비밀번호 이메일 인증 컨트롤러
@Controller
public class EmailController {

	@Autowired
	ClientService clientService;	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	    
	    //아이디 찾기 창으로 이동
	    @RequestMapping(value = "/main/login/findid", method = RequestMethod.GET)
	    	public String findid() {
	    		return "login/findid";
	    	}
	    //비밀번호 찾기 창으로 이동
	    @RequestMapping(value = "/main/login/findpw", method = RequestMethod.GET)
	    	public String findpw() {
	    		return "login/findpw";
	    	}
	    	
	    //임시 비밀번호 발급 후 로그인 클릭 시 로그인 창으로 감
	    @RequestMapping(value = "/main/PwUpdate", method = RequestMethod.POST)
	    public ModelAndView PwUpdate (ClientVo bean) throws Exception{
	    	clientService.pwUpdate(bean);
	    	ModelAndView mav=new ModelAndView();
	    	mav.setViewName("redirect:login");
	    	return mav;
	    }
	    
	    // 인증코드 이메일 발송
	    @RequestMapping( value = "/main/login/findid" , method=RequestMethod.POST )
	    public ModelAndView mailSending(HttpServletRequest request, ClientVo bean,HttpServletResponse response_email) throws Exception {
	        ClientVo findid = clientService.findId(bean);
	        Random r = new Random();
	        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
	            
	            String setfrom = "wjdwlans9303@gmail.com";
	            String tomail = request.getParameter("client_email"); // 받는 사람 이메일
	            String title = "아이디 찾기 인증 이메일 입니다."; // 제목
	            String content =
	            
	            System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	            
	            System.getProperty("line.separator")+
	                    
	            "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	    
	            " 인증번호는 " +dice+ " 입니다. "
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
	            
	            try {
	                MimeMessage message = mailSender.createMimeMessage();
	                MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                        true, "UTF-8");
	 
	                messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	                messageHelper.setTo(tomail); // 받는사람 이메일
	                messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	                messageHelper.setText(content); // 메일 내용
	                
	                mailSender.send(message);
	            } catch (Exception e) {
	                System.out.println(e);
	            }
	            
	            ModelAndView mav= new ModelAndView();
	            mav.addObject("Dice", dice);
	            mav.addObject("FindId", findid);
	            mav.setViewName("jsonView");
	            return mav;
	        }
	    
	    //이메일로 받은 인증번호를 입력하고 확인 버튼을 누르면 맵핑되는 메소드.
	    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 아이디 찾기 결과 페이지로 넘어가고,
	    //틀리면 그대로 남음
	    @RequestMapping(value = "/main/code_check", method = RequestMethod.POST)
	    public ModelAndView code_check( ClientVo bean) throws Exception {
	        
	        ClientVo IdResult = clientService.findId(bean);
	        ModelAndView mav = new ModelAndView();
	                   
	            //뷰에서 인증번호 일치 시 아이디 찾기 결과 페이지로 이동하기위해 페이지 저장.
	            mav.setViewName("/login/findidResult");
	            //아이디 결과 페이지에 띄우기 위해 아이디 저장.
	            mav.addObject("ID", IdResult.getClient_id());

	            return mav;
	    }
	    //비밀번호 찾기 인증코드 이메일 발송
	    @RequestMapping( value = "/main/login/findpw" , method=RequestMethod.POST )
	    public ModelAndView mailSending2(HttpServletRequest request, ClientVo bean,HttpServletResponse response_email) throws Exception {
	    	ClientVo findpw = clientService.findPw(bean);
	    	Random r = new Random();
	    	int dice2 = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
	    	
	    	String setfrom = "wjdwlans9303@gmail.com";
	    	String tomail = request.getParameter("client_email"); // 받는 사람 이메일
	    	String title = "비밀번호 찾기 인증 이메일 입니다."; // 제목
	    	String content =
	    			
	    			System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	    			
	    			System.getProperty("line.separator")+
	    			
	    			"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	    			
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            " 인증번호는 " +dice2+ " 입니다. "
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
	    	
	    	
	    	try {
	    		MimeMessage message = mailSender.createMimeMessage();
	    		MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	    				true, "UTF-8");
	    		
	    		messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	    		messageHelper.setTo(tomail); // 받는사람 이메일
	    		messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	    		messageHelper.setText(content); // 메일 내용
	    		
	    		mailSender.send(message);
	    	} catch (Exception e) {
	    		System.out.println(e);
	    	}
	    	
	    	ModelAndView mav= new ModelAndView();
	    	mav.addObject("Dice2", dice2);
	    	mav.addObject("FindPw", findpw);
	    	mav.setViewName("jsonView");
	    	return mav;
	    }
	    
	    
	    //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 비밀번호 찾기 결과 페이지로 넘어가고,
	    //틀리면 그대로 남음.
	    @RequestMapping(value = "/main/code_check2", method = RequestMethod.POST)
	    public ModelAndView code_check2(ClientVo bean) throws Exception {
	    	ClientVo id = clientService.findPw(bean);
	    	
	    	
	    	//임시 비밀번호 생성
	    	StringBuffer buffer = new StringBuffer();
	    	Random random = new Random();
	    	String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
	    	for (int i = 0; i < 7; i++) {

	    	buffer.append(chars[random.nextInt(chars.length)]);

	    	}
	    	
	    	String password = buffer.toString();
	    	
	    	//페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
	    	
	    	ModelAndView mav = new ModelAndView();
	    		//임시비밀번호 부여
	    		mav.addObject("Password", password);
	    		mav.addObject("id", id.getClient_id());
	    		//인증번호가 일치할 경우 비밀번호변경페이지로 이동함
	    		mav.setViewName("/login/findpwResult");
	    	return mav;
	    	
	    }
	    
}
