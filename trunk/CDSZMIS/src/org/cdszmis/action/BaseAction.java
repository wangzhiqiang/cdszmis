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

	public String newslist(){
		return SUCCESS;
	}
	
}
