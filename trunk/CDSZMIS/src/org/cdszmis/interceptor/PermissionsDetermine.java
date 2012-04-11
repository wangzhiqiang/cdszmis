package org.cdszmis.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;


/**
 * 权限判定
 * @author WZQ
 * 
 */
@SuppressWarnings("serial")
public class PermissionsDetermine implements Interceptor{

	public void destroy() {
		
	}

	public void init() {
		
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String url = request.getRequestURL().toString();
		 return invocation.invoke();
	}

}
