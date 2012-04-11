package org.cdszmis.service;

import java.util.List;

import org.cdszmis.entity.DepartmentEntity;

public interface DepartService {
	public List<DepartmentEntity> departList() ;
	public List<DepartmentEntity> departListByActive();
	public DepartmentEntity departManager(DepartmentEntity depart);
	public DepartmentEntity findByid(int id);
	public boolean delDepart(DepartmentEntity depart);
}
