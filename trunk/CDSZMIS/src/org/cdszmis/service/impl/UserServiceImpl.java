package org.cdszmis.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.cdszmis.dao.PublicDao;
import org.cdszmis.dao.UserDao;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.UserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope("prototype")
public class UserServiceImpl implements UserService {
	@Resource private UserDao userDaoImpl;
	@Resource private PublicDao publicDao;
	public UserEntity userlogin(String usname, String uspass) {
		UserEntity u = new UserEntity();
		try {
			u = userDaoImpl.userlogin(usname, uspass);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return u;
	}

	public UserEntity userRegister(UserEntity user) {
		
		
		return userDaoImpl.userRegister(user);
	}

	 

	public UserEntity userManager(UserEntity user) {
		return null;
	}

	public UserEntity userGroupManager(Set<UserGroupEntity> group, UserEntity user) {
		return null;
	}

	public UserEntity userGroupManager(UserEntity user) {
		return null;
	}

	public UserEntity userGroupManager(List<Integer> groupids, int userid) {
		return null;
	}
	public List selectList(String key){
		
		return userDaoImpl.userSelect(key);
	}
	@SuppressWarnings("rawtypes")
	public List userList(List<Integer> ids) {
		return null;
	}

	@SuppressWarnings("rawtypes")
	public List  getUserByloginname(String loginname) {
		return publicDao.findObjectListByHsql("from  UserEntity obj where obj.loginname='"+loginname+"'");
	}
}
