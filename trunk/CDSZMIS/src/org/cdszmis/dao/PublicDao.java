package org.cdszmis.dao;

import java.util.List;

public interface PublicDao {
	/**
	 * 数据添加
	 * 
	 * @param obj
	 * @return
	 */
	public boolean addObject(Object obj);

	/**
	 * 更新
	 * 
	 * @param obj
	 * @return
	 */
	public boolean updateObject(Object obj);

	/**
	 * 单条记录查询
	 * 
	 * @param obj obj中可不包含id
	 * @param id
	 * @return
	 */
	public Object queryObject(Object obj, int id);
	/**
	 * 单条记录查询
	 * @param obj  obj中必须包含id
	 * @return
	 */
	public Object queryObject(Object obj);
	/**
	 * 集合查寻
	 * @param Clazz
	 * @return
	 */
 
	@SuppressWarnings("rawtypes")
	public List queryList(Class Clazz);
}
