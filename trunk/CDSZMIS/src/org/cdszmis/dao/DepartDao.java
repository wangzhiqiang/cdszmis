package org.cdszmis.dao;

import java.util.List;

import org.cdszmis.entity.DepartmentEntity;
import org.springframework.stereotype.Component;

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
	
	
	public List<DepartmentEntity> departListByActive();
	
	public DepartmentEntity findepart(int id);
	
	public boolean delDepart(Class clazz ,int id);
	public boolean delDepart(DepartmentEntity depart);
	
}
