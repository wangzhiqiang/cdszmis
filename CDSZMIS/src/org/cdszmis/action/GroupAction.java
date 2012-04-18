package org.cdszmis.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.cdszmis.dao.PublicDao;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.UserGroupService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class GroupAction extends ActionSupport {
	@Resource private UserGroupService userGroupService;
	@Resource private PublicDao publicDao;
	private String menuids;
	private UserGroupEntity group;

	public String groupManager() {
 
		List<UserGroupEntity> ugl = new ArrayList<UserGroupEntity>();
		List<SysMenuEntity> sml = new ArrayList<SysMenuEntity>();
		ugl = userGroupService.groupList();
		sml = userGroupService.findAllMenu();
		if (group != null&&group.getGroupname()!=null&&!group.getGroupname().equals("")) {
			if (menuids != null) {
				Set<SysMenuEntity> sm = new HashSet<SysMenuEntity>();
				String id[] = menuids.split(",");
				String temp = null;
				for (int i = 0; i < sml.size(); i++) {
					temp = String.valueOf(sml.get(i).getId());
					for (int j = 0; j < id.length; j++) {
//						System.out.println(id[j]);
						if (temp.equals(id[j])) {
							sm.add(sml.get(i));
						}
					}
				}

				group.setMenSysMenuEntities(sm);
			}
			userGroupService.groupManager(group);
		}

		ActionContext.getContext().put("ugl", ugl);
		ActionContext.getContext().put("sml", sml);
		return "add";
	}

	
	@SuppressWarnings ("rawtypes")
	public String groupMenu(){
		List allmenu=publicDao.queryList(SysMenuEntity.class);
		List allgroup=publicDao.queryList(UserGroupEntity.class);
		
		ActionContext.getContext().put("allmenu",allmenu);
		ActionContext.getContext().put("allgroup",allgroup);
		
		return "groupmenu";
	}
	
	public String getMenuids() {
		return menuids;
	}

	public void setMenuids(String menuids) {
		this.menuids = menuids;
	}

	public UserGroupEntity getGroup() {
		return group;
	}

	public void setGroup(UserGroupEntity group) {
		this.group = group;
	}

}
