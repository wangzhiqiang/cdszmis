package org.cdszmis.dao;

import java.util.List;

import org.cdszmis.entity.DepartmentEntity;

public interface DepartDao {
	/**
	 * 
	 * 部门信息维护 增改
	 * 
	 * @param depart
	 * @return
	 */
	public DepartmentEntity departManager(DepartmentEntity depart);
	/**
	 * 部门信息查询 all
	 * @return
	 */
	public List<DepartmentEntity> departList();
	
	/**
	 * 查询激活状态的部门信息
	 * @return
	 */
	public List<DepartmentEntity> departListByActive();
	/**
	 * 通过id查询部门
	 * @param id
	 * @return
	 */
	public DepartmentEntity findepart(int id);
	/**
	 * 删除部门
	 * @param clazz
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public boolean delDepart(Class clazz ,int id);
	/**
	 * 删除部门
	 * @param depart
	 * @return
	 */
	public boolean delDepart(DepartmentEntity depart);
	
}
