package org.cdszmis.action;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
 
import org.apache.derby.client.net.Request;
import org.cdszmis.dao.PublicDao;
 
import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.DepartService;
import org.cdszmis.service.UserGroupService;
import org.cdszmis.service.UserService;
import org.cdszmis.utils.Encipherment;
import org.hibernate.HibernateException;
import com.opensymphony.xwork2.ActionContext;




@SuppressWarnings("serial")
public class UserAction extends BaseAction {

	
	@Resource
	private UserService userService;
	@Resource
	private UserGroupService userGroupService;
	@Resource
	private DepartService departService;
//	@Resource private PublicDao publicDao;
	private UserEntity user;
	private String groupids;
	private Integer departid;
	private String keyword;
	private String idcard;
	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String userlogin() {
		// System.out.println(this.getClass().getName());
		UserEntity u = null;
		if(null==ActionContext.getContext().get("user")){
		try {
			if(user!=null){
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
			}else{
				ActionContext.getContext().put("message", "请从登录入口进入");
				return "message";
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			ActionContext.getContext().put("message", "未知异常");
			return "message";
		}
		}

		return "success";
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	public String userRegister() {
		// 查询group depart
		
		
			ActionContext.getContext().getSession().put("grouplist", userGroupService.groupList());
		
			ActionContext.getContext().getSession().put("departlist", departService.departList());
		
//		if(ActionContext.getContext().get("menulist")==null){
//			ActionContext.getContext().getSession().put("menulist", publicDao.queryList(SysMenuEntity.class));
//		}
		if (user != null && !user.equals("")) {
			if(user.getUspass()!=null)
			user.setUspass(Encipherment.Enc_MD5_2(user.getUspass()));
			else{
				ActionContext.getContext().put("message","密码不能为空");
				return "message";
			}
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
		ActionContext.getContext().getSession().put("grouplist", userGroupService.groupList());
		ActionContext.getContext().getSession().put("departlist", departService.departList());
		if(user != null){
			user.setUsdeparts(departid);
			userService.userManager(user);
		}

		List l = userService.selectList("");
		ActionContext.getContext().getSession().put("list", l);
		
		return "update";
	}
	
	public String userManagelist(){	
	
		ActionContext.getContext().getSession().put("grouplist", userGroupService.groupList());		
		ActionContext.getContext().getSession().put("departlist", departService.departList());
	
		
		
		List l = userService.selectList("");
		ActionContext.getContext().getSession().put("list", l);
//		userService.selectList("123");
		return "managerlist";
		
	}
	
	public String userManager(){
		ActionContext.getContext().getSession().put("grouplist", userGroupService.groupList());
		ActionContext.getContext().getSession().put("departlist", departService.departList());
		if(user != null){
			user.setUsdeparts(departid);
			userService.userManager(user);
			
		}
		
		
		List l = userService.selectList("");
		ActionContext.getContext().getSession().put("list", l);
		
		return "updatemanager";

	}

	public String userSelect(){
		
		String key = null;

		if(keyword != null){
			key = keyword;
		}
		
		List l = userService.selectList(key);
		ActionContext.getContext().getSession().put("list", l);
		return "ls";
		
	}
	
	public String userContent(){
		
		String card = null;
		
		if(idcard !=null ){
			card = idcard;
		}
		List c = userService.selectList(card);
		ActionContext.getContext().getSession().put("content", c );
		return "Content";
	}
	
	public String userLogout(){
		ActionContext.getContext().getSession().put("grouplist", userGroupService.groupList());
		ActionContext.getContext().getSession().put("departlist", departService.departList());
		if(user != null){
			user.setStatus(1);
			userService.userManager(user);
			
		}
		
		
		List l = userService.selectList("");
		ActionContext.getContext().getSession().put("list", l);
		
		return "change";
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

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getIdcard() {
		return idcard;
	}



}
