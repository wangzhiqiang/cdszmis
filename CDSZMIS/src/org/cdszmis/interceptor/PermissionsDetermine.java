package org.cdszmis.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.apache.struts2.ServletActionContext;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserGroupEntity;

import com.opensymphony.xwork2.ActionContext;
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
		System.out.println("URL:"+url);
		Map<Integer, SysMenuEntity> smap = new HashedMap();
		Map<Integer, UserGroupEntity> umap = new HashedMap();
		umap=(Map<Integer, UserGroupEntity>) ActionContext.getContext().getSession().get("group");
		smap=	(Map<Integer, SysMenuEntity>) ActionContext.getContext().getSession().get("menu");
		if(umap!=null||smap!=null)
		{
			
		}
		 return invocation.invoke();
	}

}
