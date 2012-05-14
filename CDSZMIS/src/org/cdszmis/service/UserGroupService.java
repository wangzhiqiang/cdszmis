package org.cdszmis.service;

import java.util.List;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.springframework.stereotype.Service;
@Service
public interface UserGroupService {

	/**
	 * 用户组信息维护 增删改
	 * 
	 * @return
	 */
	public UserGroupEntity groupManager(Object obj);

	/**
	 * 用户分配
	 * 
	 * @param user
	 * @param group
	 * @return
	 */
	public UserEntity allocationUser(UserEntity user, UserGroupEntity group);

	/**
	 * 用户组权限分配
	 * 
	 * @param group
	 * @param menu
	 * @return
	 */
	public UserGroupEntity allocationGroup(UserGroupEntity group,
			SysMenuEntity menu);

	/**
	 * 用户组menu查询
	 */
	public UserGroupEntity groupMenu(UserGroupEntity group);

	@SuppressWarnings("rawtypes")
	public List findAllgroup();

	public List<SysMenuEntity> findAllMenu();

	public UserGroupEntity findByid(int id);

	public List<UserGroupEntity> groupList();
	
	/**
	 * 权限分配
	 * @param group
	 * @return
	 */
	public UserGroupEntity allocationGroup(UserGroupEntity group);
	
	/**
	 * 通过id查询sysmenu
	 */
	public SysMenuEntity sysmMenu(int id);
}
