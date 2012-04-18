package org.cdszmis.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.cdszmis.dao.UserDao;
import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.DepartService;
import org.cdszmis.service.UserGroupService;
import org.cdszmis.service.UserService;
import org.cdszmis.utils.Encipherment;
import org.cdszmis.utils.HibernateUtils;
import org.hibernate.HibernateException;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class UserAction extends ActionSupport {

	
	@Resource
	private UserService userService;
	@Resource
	private UserGroupService userGroupService;
	@Resource
	private DepartService departService;
	private UserEntity user;
	private String groupids;
	private Integer departid;

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String userlogin() {
		// System.out.println(this.getClass().getName());
		UserEntity u = null;
		try {
			String uspass = Encipherment.Enc_MD5_2(user.getUspass());
			// System.out.println(user.getGender());
			u = userService.userlogin(user.getLoginname(), uspass);
			if (u == null || u.equals("")) {
				ActionContext.getContext().put("message", "用户名或密码错误");
				return "message";
			} else {
				SysMenuEntity m = null;
				UserGroupEntity group = null;
				Map<Integer, SysMenuEntity> smap = new HashedMap();
				Map<Integer, UserGroupEntity> umap = new HashedMap();
				// 迭代UserGroupEntity
				Iterator<UserGroupEntity> ug = u.getUserGroupEntity()
						.iterator();
				while (ug.hasNext()) {
					group = ug.next();
					umap.put(group.getId(), group);
					Iterator<SysMenuEntity> menu = group
							.getMenSysMenuEntities().iterator();
					// SysMenuEntity 迭代
					while (menu.hasNext()) {
						m = menu.next();
						smap.put(m.getId(), m);
					}
				}
				ActionContext.getContext().getSession().put("menu", smap);
				ActionContext.getContext().getSession().put("group", umap);
				ActionContext.getContext().getSession().put("user", u);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			ActionContext.getContext().put("message", "未知异常");
			return "message";
		}

		return "success";
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	public String userRegister() {
		// 查询group
		ActionContext.getContext().getSession()
				.put("grouplist", userGroupService.groupList());
		ActionContext.getContext().getSession()
				.put("departlist", departService.departList());
		if (user != null && !user.equals("")) {
			user.setUspass(Encipherment.Enc_MD5_2(user.getUspass()));
			// /验证用户是否被注册
			@SuppressWarnings ("rawtypes")
			List ls = null;
			try {
				ls = userService.getUserByloginname(user.getLoginname());
			} catch (Exception e) {
				 
				e.printStackTrace();
			}
			if (ls == null || ls.size() == 0) {
				UserGroupEntity ug = null;
				if (groupids != null && !groupids.equals("")) {
					Set<UserGroupEntity> sug = new HashSet<UserGroupEntity>();
					String a[] = groupids.split(",");
					for (int i = 0; i < a.length; i++) {
						ug = userGroupService.findByid(Integer.valueOf(a[i]));
						sug.add(ug);
					}
					user.setUserGroupEntity(sug);
				}
				if (departid != null && !departid.equals("")) {
					DepartmentEntity dp = new DepartmentEntity();
					dp = departService.findByid(departid);
					user.setDepartmentEntity(dp);
				}
				
				 
					userService.userRegister(user);
				 
				ActionContext.getContext().put("message",user.getLoginname()+"注册成功！");
			} else {
				ActionContext.getContext().put("message", "该登录名已经被注册！");
				return "message";
			}
		}
		return "register";
	}

	public String userlogoff() {
		try {
			ActionContext.getContext().getSession().remove("user");
			ActionContext.getContext().getSession().remove("menu");
			ActionContext.getContext().getSession().remove("group");
		} catch (Exception e) {
		}
		return "login.jsp";
	}
	
	public String userUpdate(){
		
		return "update";
	}
	
	public String userManagelist(){
		
		userService.selectList("123");
		return "managelist";
		
	}
	

	public String userSelect(){

		return "ls";
		
	}
	
	
	public String userMenu() {
		
		return null;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public String getGroupids() {
		return groupids;
	}

	public void setGroupids(String groupids) {
		this.groupids = groupids;
	}

	public Integer getDepartid() {
		return departid;
	}

	public void setDepartid(Integer departid) {
		this.departid = departid;
	}

}
