package com.yt.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements javax.servlet.Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.err.println("����Filter-->init()");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.err.println("����Filter-->doFilter()");
		HttpServletResponse response = (HttpServletResponse) res;
		HttpServletRequest  request=(HttpServletRequest) req;
        String servletPath = request.getServletPath();

        HttpSession session = request.getSession();
        //����login.jspʱ���ŷŹ�������login.jsp�ĺ�������������ִ�У�������
        if (servletPath.equals("/manage-index.jsp")  ) {
            if( session.getAttribute("userid")!=null && session.getAttribute("userid")!="" && session.getAttribute("status").equals("3")) {
            	chain.doFilter(req, res);
            	return;
            }
        	String contextPath=request.getContextPath();
 	        response.setCharacterEncoding("utf-8");
		    request.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			PrintWriter pw = response.getWriter();
			//�������أ���תָ����ҳ��
			pw.print("<script>window.top.location.href='"+contextPath + "/login.jsp'"+";</script>");
        
		}else {
			chain.doFilter(req, res);
            return;
		}
	}

	@Override
	public void destroy() {
		System.err.println("����Filter-->destroy()");
		
	}

}
