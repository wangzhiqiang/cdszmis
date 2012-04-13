package org.cdszmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.dao.UserGroupDao;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.UserGroupService;
import org.springframework.stereotype.Service;
@Service
public class UserGroupServiceImpl implements UserGroupService {
	@Resource
	private UserGroupDao userGroupDao;

	@SuppressWarnings("unchecked")
	public List<UserGroupEntity> groupList() {
		List<UserGroupEntity> list = userGroupDao.findAllgroup();
		return list;
	}

	public UserGroupEntity findByid(int id) {
		 
		return userGroupDao.findByid(id);
	}
	public List<SysMenuEntity> findAllMenu() {
		
		return  userGroupDao.findAllMenu();
	}

	public UserGroupEntity groupManager(Object obj) {
		 
		return userGroupDao.groupManager(obj);
	}

	public UserEntity allocationUser(UserEntity user, UserGroupEntity group) {
		
		return null;
	}

	public UserGroupEntity allocationGroup(UserGroupEntity group,
			SysMenuEntity menu) {
		
		return null;
	}

	public UserGroupEntity groupMenu(UserGroupEntity group) {
		
		return null;
	}

	@SuppressWarnings("rawtypes")
	public List findAllgroup() {
		return null;
	}

}
