package com.zte.sms.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AccessFilter implements Filter{
	
	//定义一个数组
	private String[]  arr;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse)response;
		//获取服务器路径
		String path = req.getServletPath();
		for (int i = 0; i < arr.length; i++) {
			//查看该服务器路径是否是需要屏蔽的路径，如果是，不执行过滤器，放行
			if(path.equals("/"+arr[i])){
				chain.doFilter(request, response);
				return;
			}
			
		}
		
		//获取当前会话
		HttpSession session = req.getSession(false);
		if(session==null || session.getAttribute("user")==null){
			//重新登录
			resp.sendRedirect(req.getContextPath()+"/login.jsp");
			return;
		}
		//放行，通过过滤器
		chain.doFilter(request, response);
		
		
		
		
		
		
	}

	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		//获取web.xml中设置的不需要执行过滤器的路径
		String urls = filterConfig.getInitParameter("urls");
		//将该字符串分割成一个数组
		arr=urls.split(",");
	}

}
