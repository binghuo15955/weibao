package com.yt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		System.err.println(request.getHeaderNames());
		System.err.println(request.getHeader("X-Requested-With"));
		String XRequested =request.getHeader("X-Requested-With");
		if(session.getAttribute("userid")!=null&&session.getAttribute("userid")!="") {
			return true;
		}else {
	        if("XMLHttpRequest".equals(XRequested)){
	            response.getWriter().write("IsAjax");
	        }else {
				request.getRequestDispatcher("../login.jsp").forward(request, response);	        	
	        }
	        return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
