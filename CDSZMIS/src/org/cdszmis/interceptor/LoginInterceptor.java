package org.cdszmis.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/***
 * 登录判断
 * 
 * @author WZQ
 * 
 */
@SuppressWarnings("serial")
public class LoginInterceptor implements Interceptor {

	public void destroy() {

	}

	public void init() {

	}

	public String intercept(ActionInvocation invocation) throws Exception {

		Object u = ActionContext.getContext().getSession().get("user");
		if (u == null || u.equals("")) {
			ActionContext.getContext().put("message", "你没有登录，请先登录！");
			return "message";
		} else {
			return invocation.invoke();
		}

	}

}
