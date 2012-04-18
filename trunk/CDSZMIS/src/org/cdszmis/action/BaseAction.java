package org.cdszmis.action;

import java.util.List;
import javax.annotation.Resource;
import org.cdszmis.dao.PublicDao;
import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.DepartService;
import org.cdszmis.service.UserGroupService;
import org.cdszmis.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport{
//	@Resource private PublicDao publicDao;
//	@Resource private UserService userService;
//	@Resource private DepartService departService;
//	@Resource private UserGroupService userGroupService;
//	 final static void base(){
//			if(ActionContext.getContext().get("departlist")==null){
//				 
//				ActionContext.getContext().getApplication().put("departlist",publicDao.queryList(DepartmentEntity.class));
//			}
//			if(ActionContext.getContext().get("grouplist")==null)
//			{
//				ActionContext.getContext().getApplication().put("grouplist",publicDao.queryList(UserGroupEntity.class));
//			}
//			if(ActionContext.getContext().get("menulist")==null)
//			{
//				ActionContext.getContext().getApplication().put("menulist",publicDao.queryList(SysMenuEntity.class));
//			}
//	 
//	 }
}
