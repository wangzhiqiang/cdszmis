package org.cdszmis.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.dao.UserGroupDao;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.stereotype.Component;

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

	@SuppressWarnings("rawtypes")
	public List findAllgroup() {
		return hibernateUtils.findall(UserGroupEntity.class);
	}

	public UserGroupEntity findByid(int id) {
		 
		return (UserGroupEntity) hibernateUtils.getObjbyId(id, UserGroupEntity.class);
	}

	@SuppressWarnings("unchecked")
	public List<SysMenuEntity> findAllMenu() {
		
		return hibernateUtils.findall(SysMenuEntity.class);
	}

	public UserGroupEntity allocationGroup(UserGroupEntity group) {
		 
		return (UserGroupEntity) hibernateUtils.saveorupdate(group);
	}
}
