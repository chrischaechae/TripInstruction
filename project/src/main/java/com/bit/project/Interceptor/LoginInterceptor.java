package com.bit.project.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.project.model.entity.ClientVo;
import com.bit.project.model.entity.StaffVo;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	//회원가입,로그인 여부 확인(SESSION)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		ClientVo bean=(ClientVo)session.getAttribute("check");
		StaffVo bean2 = (StaffVo)session.getAttribute("staffcheck");
		
		if(bean2 != null || bean !=null) {
			
			return true;
			
		}else{
			
			response.sendRedirect("../main/login");
			return false;
		}
		
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
}
