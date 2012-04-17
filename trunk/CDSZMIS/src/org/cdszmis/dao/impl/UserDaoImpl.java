package org.cdszmis.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.cdszmis.dao.UserDao;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


@Component
@Scope("prototype")
public class UserDaoImpl implements UserDao {
	@Resource
	HibernateUtils hibernateUtils;

	public UserEntity userlogin(String usname, String uspass) {
		UserEntity u = null;
		u = (UserEntity) hibernateUtils
				.findobjByHsql("from UserEntity user where  user.uspass='"
						+ uspass + "' and user.loginname='" + usname + "'");
		return u;
	}
 
 

	public UserEntity userRegister(UserEntity user) {

		return (UserEntity) hibernateUtils.saveorupdate(user);
	}

	public UserEntity userManager(UserEntity user) {
		return (UserEntity) hibernateUtils.saveorupdate(user);
	}

	public UserEntity userGroupManager(UserEntity user) {
		return (UserEntity) hibernateUtils.saveorupdate(user);
	}


	public UserEntity userGroupManager(List<Integer> groupids, int userid) {

		return null;
	}
	public List userSelect(String key){
		if(key == null){
			key = "";
		}
		String HSQL="from UserEntity obj where obj .usname like '"+key+"%' or obj.idcard like '"+key+"%' ";
		 return   hibernateUtils.findlistByHsql(HSQL);
 
	}
	@SuppressWarnings("rawtypes")
	public List userList(List<Integer> ids) {

		return null;
	}
	 
	public boolean userGroupManager(Set<UserGroupEntity> group, UserEntity user) {
		return false;
	}

}
