package org.cdszmis.system.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author WZQ
 */
public class SystemFilter implements Filter {

	/**
	 * 将传入的字符串替换
	 * 
	 * @param inpute
	 *            传入字符串
	 * @return 被替换后的Sring
	 */
	 final public static String stringfilter(String inpute) {
	
//	 inpute = inpute.replaceAll("&", "&amp;");
	// inpute = inpute.replaceAll("&amp;amp", "&amp;");
	 inpute = inpute.replaceAll("<", "&lt;");
	 inpute = inpute.replaceAll(">", "&gt;");
	 inpute = inpute.replaceAll(" ", "&nbsp;");
	 inpute = inpute.replaceAll("'", "&#39;");
	 inpute = inpute.replaceAll("\"", "&quot;");
	 return inpute.replaceAll("\n", "<br>");
	 }

	public void init(FilterConfig filterconfig) throws ServletException {

	}

	public void doFilter(ServletRequest servletrequest,
			ServletResponse servletresponse, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletrequest;
		HttpServletResponse response = (HttpServletResponse) servletresponse;

		SetPth(request);
		htmlreplace(request);
//		System.out.println(request.getAttribute("name"));
		chain.doFilter(request, response);

	}

	public void destroy() {

	}

	final static void SetPth(HttpServletRequest request) {

		if(!(request.getSession().getAttribute("rooturl")==null)){
		String path = request.getContextPath();
		String rooturl = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path;
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort();
		 
		// 上下文路径
		request.getSession().setAttribute("path", path);
		// 根路径+上下文路径
		request.getSession().setAttribute("rooturl", rooturl);
		// 服务器路径
		request.getSession().setAttribute("basepath", basePath);
//		System.out.println("rooturl已经写入");
		}

	}

	@SuppressWarnings("rawtypes")
	final static void htmlreplace(HttpServletRequest request) {
		Enumeration e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String parname = (String) e.nextElement();
			String parvalue = request.getParameter(parname);
			if (parvalue != null && parvalue.trim().length() > 0) {
//				System.out.println(parname + ":" + parvalue);
				parvalue=stringfilter(parvalue);
				request.setAttribute(parname, parvalue);
			}
		}

	}

}
