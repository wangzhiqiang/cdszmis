package org.cdszmis.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.cdszmis.dao.UserGroupDao;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class UserGroupDaoImpl implements UserGroupDao {
	@Resource
	HibernateUtils hibernateUtils;
	public UserGroupEntity groupManager(Object obj) {
		 
		return (UserGroupEntity) hibernateUtils.saveorupdate(obj);
	}

	public UserEntity allocationUser(UserEntity user, UserGroupEntity group) {
		 
		return null;
	}

	public UserGroupEntity allocationGroup(UserGroupEntity group,
			SysMenuEntity menu) {
		 
		return null;
	}

	public UserGroupEntity groupMenu(UserGroupEntity group) {
		UserGroupEntity ug= (UserGroupEntity) hibernateUtils.findobjByHsql("from UserGroupEntity ug where 1=1 and ug.id ="+group.getId());
		 return  ug;
	}

	public List findAllgroup() {
		return hibernateUtils.findall(UserGroupEntity.class);
	}

	public UserGroupEntity findByid(int id) {
		 
		return (UserGroupEntity) hibernateUtils.getObjbyId(id, UserGroupEntity.class);
	}

	public List<SysMenuEntity> findAllMenu() {
		
		return hibernateUtils.findall(SysMenuEntity.class);
	}
}
