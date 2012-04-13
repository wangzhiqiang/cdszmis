package org.cdszmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.dao.DepartDao;
import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.service.DepartService;
import org.springframework.stereotype.Service;
@Service
public class DepartServiceImpl implements DepartService {
@Resource DepartDao departDao;
	public List<DepartmentEntity> departList() {
		return departDao.departList();
	}
	public DepartmentEntity departManager(DepartmentEntity depart) {
		 
		return  departDao.departManager(depart);
				
	}
	public List<DepartmentEntity> departListByActive() {
		 
		return departDao.departListByActive();
	}
	public DepartmentEntity findByid(int id) {
		return departDao.findepart(id);
	}
	public boolean delDepart(DepartmentEntity depart) {
		 
		return departDao.delDepart(depart);
	}

}
