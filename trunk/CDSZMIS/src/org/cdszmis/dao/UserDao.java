package org.cdszmis.dao;

import java.util.List;
import java.util.Set;

import org.cdszmis.entity.UserEntity;
import org.cdszmis.entity.UserGroupEntity;

public interface UserDao {
	/**
	 * UserLogin 判断用户登录 成功返回用户实体bean 失败返回null
	 * 
	 * @return userEntity
	 */
	public UserEntity userlogin(String usname, String uspass);

	 

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	public UserEntity userRegister(UserEntity user);

	/**
	 * 用户人事管理或用户修改
	 * 
	 * @param user
	 * @return
	 */
	public UserEntity userManager(UserEntity user);

	/**
	 * 用户权限分配
	 * 
	 * @return
	 */
	public boolean userGroupManager(Set<UserGroupEntity> group,
			UserEntity user);
	public UserEntity userGroupManager(UserEntity user);
	/**
	 * 用户权限分配
	 * 
	 * @return
	 */
	public UserEntity userGroupManager(List<Integer> groupids, int userid);
	/**
	 * 用户信息查询
	 * @param ids
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List userList(List <Integer> ids);
}
