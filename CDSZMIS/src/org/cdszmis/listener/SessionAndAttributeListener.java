package org.cdszmis.listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

 
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.cdszmis.entity.UserEntity;

/**
 * 用户登录和网络访问监听
 * 
 * @author WZQ
 * 
 */
public class SessionAndAttributeListener implements
		HttpSessionAttributeListener, HttpSessionListener {
	List<UserEntity> ls =null;
	Map<Integer, String> mu = null;
	public static int sessionids = 0;
	UserEntity user = null;
//	Application a=null;
	@SuppressWarnings("unchecked")
	public void attributeAdded(HttpSessionBindingEvent se) {

		HttpSession session = se.getSession();

		try {
			user = (UserEntity) session.getAttribute("user");
		} catch (Exception e) {
			// e.printStackTrace();
		}
		if (user != null && !user.equals("")) {
			// ls.add(user);
			try {
				ls=(List<UserEntity>) session.getServletContext().getAttribute("ls");
				mu=(Map<Integer, String>) session.getServletContext().getAttribute("mu");
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(ls==null)
			{
				ls= new ArrayList<UserEntity>();
			}
			ls.add(user);
			session.getServletContext().setAttribute("ls", ls);
//			for(int i=0 ;i<ls.size();i++)
//			{
//				for(int j=i+1 ;j<ls.size();j++){
//					System.out.println(ls.get(i).getId()==ls.get(j).getId());
//				}
//			}
			if (mu==null)
			{
				mu=new HashMap<Integer, String>();
			}
			mu.put(user.getId(), user.getUsname());
			
			session.getServletContext().setAttribute("mu", mu);
			System.out.println("User:" + user.getUsname() + " login!");
 
		}

	}

	public void attributeRemoved(HttpSessionBindingEvent se) {
		HttpSession session = se.getSession();
		try {
			user = (UserEntity) session.getAttribute("user");
		} catch (Exception e) {
			// e.printStackTrace();
		}
		if (user != null && !user.equals("")) {
			System.out.println("User:" + user.getUsname() + " logoff!");
			// ls.remove(user);
			mu.remove(user.getId());
			session.getServletContext().setAttribute("mu", mu);
		}

	}

	public void attributeReplaced(HttpSessionBindingEvent se) {
	}

	public void sessionCreated(HttpSessionEvent arg0) {

		try {
			sessionids++;
			arg0.getSession().getServletContext().setAttribute("sessionids", sessionids);
			System.out.println("   SessionIDCreate:" + arg0.getSession().getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		try {
			sessionids--;
			arg0.getSession().getServletContext().setAttribute("sessionids", sessionids);
			System.out.println("SessionIDDestoryed:" + arg0.getSession().getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
