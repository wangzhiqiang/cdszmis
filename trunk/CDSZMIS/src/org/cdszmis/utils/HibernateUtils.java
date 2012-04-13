package org.cdszmis.utils;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
/**
 * HibernateUtils  采用Spring 管理的 Transactional，SessionFactory ，dataSource
 * 包含常用的增删改查方法
 *  @author WZQ
 */
public class HibernateUtils {

	@Resource
	private SessionFactory sessionFactory;
	Object obj = null;
	@SuppressWarnings({ "rawtypes" })
	List list = null;

	/**
	 * save an obj if Exception rollback
	 * 
	 * @param obj
	 * @return true or false
	 */
	@Transactional(rollbackFor = Exception.class)
	public Object save(Object obj) {

		try {
			sessionFactory.getCurrentSession().persist(obj);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

	/**
	 * save or update an obj if Exception rollback
	 * 
	 * @param obj
	 * @return true or false
	 */
	@Transactional(rollbackFor = Exception.class)
	public Object saveorupdate(Object obj) {
		try {
			sessionFactory.getCurrentSession().merge(obj);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

	/**
	 * 
	 * @param id
	 * @param clazz
	 *            Class.class
	 * @return obj unique or null
	 */
	@SuppressWarnings("rawtypes")
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public Object getObjbyId(int id, Class clazz) {

		try {
			obj = sessionFactory
					.getCurrentSession()
					.createQuery(
							"from  " + clazz.getSimpleName() + " where id="
									+ id).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

	/**
	 * 
	 * @param clazz
	 * @return list or null
	 */
	@SuppressWarnings("rawtypes")
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public List findall(Class clazz) {
		try {
			list = sessionFactory.getCurrentSession()
					.createQuery("from " + clazz.getSimpleName()).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	/**
	 * 
	 * @param clazz
	 * @param starpage
	 *            now page number
	 * @param pagenum
	 *            splite page number
	 * @return list or null
	 */
	@SuppressWarnings("rawtypes")
	// 未完成
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public List findbypage(Class clazz, int starpage, int pagenum) {
		try {
			list = sessionFactory.getCurrentSession()
					.createQuery("from " + clazz.getSimpleName()).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	/**
	 * 
	 * @param Hsql
	 *            Hibernate HSQL
	 * @return list or null
	 */
	@SuppressWarnings("rawtypes")
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public List findlistByHsql(String Hsql) {

		try {
			list = sessionFactory.getCurrentSession().createQuery(Hsql).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	/**
	 * 
	 * @param Hsql
	 *            Hibernate HSQL
	 * @return obj or null
	 */
	@Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
	public Object findobjByHsql(String Hsql) {
		try {
			obj = sessionFactory.getCurrentSession().createQuery(Hsql)
					.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

	@SuppressWarnings("rawtypes")
	public boolean delObject(Class clazz, int id) {
		try {
			sessionFactory.getCurrentSession().update(
					"from " + clazz.getSimpleName() + " obj where obj.id = "
							+ id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean delObject(Object obj) {
		try {
			sessionFactory.getCurrentSession().delete(obj);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@SuppressWarnings({ "rawtypes", "unused" })
	public List findallBySql(String sql) {
		List lis = null;
		try {
			list = sessionFactory.getCurrentSession().createSQLQuery(sql)
					.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	@SuppressWarnings("rawtypes")
	public Object getObject(Class clazz, int id) {
		Object o = null;

		try {
			o = sessionFactory
					.getCurrentSession()
					.createQuery(
							"from " + clazz.getSimpleName()
									+ " obj where obj.id=" + id).uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

		return o;
	}
}
