package org.cdszmis.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.cdszmis.dao.PublicDao;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.UserGroupService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings ("serial")
public class GroupAction extends ActionSupport {
	@Resource private UserGroupService userGroupService;
	@Resource private PublicDao publicDao;
	private String menuids;
	private String groupid;
	private UserGroupEntity group;
	private String userid;
	private String groupids;

	/**
	 * 用户组信息维护
	 * 
	 * @return
	 */
	public String groupManager() {

		List <UserGroupEntity> ugl = new ArrayList <UserGroupEntity>();
		List <SysMenuEntity> sml = new ArrayList <SysMenuEntity>();
		sml = userGroupService.findAllMenu();
		if(group != null && group.getGroupname() != null && !group.getGroupname().equals(""))
		{
			if(menuids != null)
			{
				Set <SysMenuEntity> sm = new HashSet <SysMenuEntity>();
				String id[] = menuids.split(",");
				String temp = null;
				for (int i = 0;i < sml.size();i++)
				{
					temp = String.valueOf(sml.get(i).getId());
					for (int j = 0;j < id.length;j++)
					{
						// System.out.println(id[j]);
						if(temp.equals(id[j]))
						{
							sm.add(sml.get(i));
						}
					}
				}

				group.setMenSysMenuEntities(sm);
			}
			userGroupService.groupManager(group);
		}
		ugl = userGroupService.groupList();
		sml = userGroupService.findAllMenu();
		ActionContext.getContext().put("ugl",ugl);
		ActionContext.getContext().put("sml",sml);
		return "add";
	}

	@SuppressWarnings ("rawtypes")
	/**
	 * 权限分配
	 * @return
	 */
	public String groupMenu() {
		List allmenu = publicDao.queryList(SysMenuEntity.class);
		List allgroup = publicDao.queryList(UserGroupEntity.class);

		if(null != groupid && null != menuids)
		{
			String menuid[] = menuids.split(",");
			SysMenuEntity sysmenu = null;
			UserGroupEntity usergroup = null;
			usergroup = userGroupService.findByid(Integer.valueOf(groupid));

			Set <SysMenuEntity> sm = new HashSet <SysMenuEntity>();
			for (int i = 0;i < menuid.length;i++)
			{
				sysmenu = userGroupService.sysmMenu(Integer.valueOf(menuid[i]));
				sm.add(sysmenu);
			}
			usergroup.setMenSysMenuEntities(sm);
			userGroupService.groupManager(usergroup);

		}

		ActionContext.getContext().put("allmenu",allmenu);
		ActionContext.getContext().put("allgroup",allgroup);

		return "groupmenu";
	}

	/**
	 * 用户分配
	 * 
	 * @return
	 */
	public String groupUser() {

		if(null != userid && null != groupids)
		{
			String gid[] = groupids.split(",");
			UserEntity use = null;
			UserGroupEntity usergroup = null;
			use = (UserEntity) publicDao.queryObject(UserEntity.class,
					Integer.valueOf(userid));

			Set <UserGroupEntity> su = new HashSet <UserGroupEntity>();
			for (int i = 0;i < gid.length;i++)
			{
				usergroup = (UserGroupEntity) publicDao.queryObject(
						UserGroupEntity.class,Integer.valueOf(gid[i]));
				su.add(usergroup);
			}
			use.setUserGroupEntity(su);
			publicDao.saveOrupdateObject(use);
		}
		List <UserGroupEntity> lsg = publicDao.queryList(UserGroupEntity.class);
		List <UserEntity> lsu = publicDao.queryList(UserEntity.class);
		ActionContext.getContext().put("lsg",lsg);
		ActionContext.getContext().put("lsu",lsu);
		return "groupuser";
	}

	public String groupmenuview() {

		List <SysMenuEntity> lsm = new ArrayList <SysMenuEntity>();
		SysMenuEntity mu = null;
		String mid[] = menuids.split(",");
		for (int i = 0;i < mid.length;i++)
		{
			mu = (SysMenuEntity) publicDao.queryObject(SysMenuEntity.class,
					Integer.valueOf(mid[i]));
			lsm.add(mu);
		}
		ActionContext.getContext().put("lsm",lsm);
		return "groupmenuview";
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

	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGroupids() {
		return groupids;
	}

	public void setGroupids(String groupids) {
		this.groupids = groupids;
	}

}
