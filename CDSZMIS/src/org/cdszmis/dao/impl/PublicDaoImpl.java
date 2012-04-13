package org.cdszmis.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.dao.PublicDao;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.stereotype.Component;

@Component
public class PublicDaoImpl implements PublicDao {
	@Resource
	HibernateUtils hibernateUtils;

	public Object saveOrupdateObject(Object obj) {
		return hibernateUtils.saveorupdate(obj);
	}

	@SuppressWarnings("rawtypes")
	public Object queryObject(Class clazz, int id) {

		return hibernateUtils.getObjbyId(id, clazz);
	}

	public Object queryObject(Object obj, int id) {
		String hsql = "from " + obj.getClass().getSimpleName()
				+ " obj where obj.id=" + id;
		return hibernateUtils.findobjByHsql(hsql);
	}

	@SuppressWarnings("rawtypes")
	public List queryList(Class Clazz) {

		return hibernateUtils.findall(Clazz);
	}

	@SuppressWarnings("rawtypes")
	public List  findObjectListByHsql(String HSQL) {

		return hibernateUtils.findlistByHsql(HSQL);
	}

	public boolean delObj(Object obj) {
		
		return  hibernateUtils.delObject(obj);
	}

}
