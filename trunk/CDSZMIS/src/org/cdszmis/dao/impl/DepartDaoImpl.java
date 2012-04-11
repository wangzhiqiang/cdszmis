package org.cdszmis.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.dao.DepartDao;
import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.entity.UserEntity;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.stereotype.Component;
@Component
public class DepartDaoImpl implements DepartDao {
@Resource HibernateUtils hibernateUtils;
	public DepartmentEntity departManager(DepartmentEntity depart) {
		
		return  (DepartmentEntity) hibernateUtils.saveorupdate(depart);
	}

	public List<DepartmentEntity> departList() {
		 
		return hibernateUtils.findall(DepartmentEntity.class);
	}

	public List<DepartmentEntity> departListByActive() {
		return  hibernateUtils.findlistByHsql("from DepartmentEntity obj where obj.status=0");
	}

	public DepartmentEntity findepart(int id) {
		 return (DepartmentEntity) hibernateUtils.findobjByHsql("from DepartmentEntity obj where obj.id="+id);
	}

	public boolean delDepart(Class clazz, int id) {
		
		 
		return false;
	}

	public boolean delDepart(DepartmentEntity depart) {
		 try {
		//	 depart= (DepartmentEntity) hibernateUtils.findobjByHsql("from DepartmentEntity obj where obj.id= "+depart.getId());
//		List<UserEntity> list= 	hibernateUtils.findlistByHsql("from UserEntity obj where obj.departmentEntity="+depart.getId());
//		UserEntity user=null;	
//		for(int i=0;i<list.size();i++){
//			user=list.get(i);
//			user.setDepartmentEntity(null);
//				hibernateUtils.saveorupdate(user); 
//			 }
			 hibernateUtils.delObject(depart);
		} catch (Exception e) {
			e.printStackTrace();
				return false;
		}
		return true;
	}

}
