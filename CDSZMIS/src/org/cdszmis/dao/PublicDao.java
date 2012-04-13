package org.cdszmis.dao;

import java.util.List;

public interface PublicDao {
	/**
	 * 数据添加或更新
	 * 
	 * @param obj
	 * @return
	 */
	public Object saveOrupdateObject(Object obj);

	/**
	 * 单条记录查询
	 * 
	 *  
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object queryObject(Class clazz, int id);

	/**
	 * 单条记录查询
	 * 
	 * @param obj
	 *            obj中必须包含id
	 * @return
	 */
	public Object queryObject(Object obj,int id);

	/**
	 * 集合查寻所有数据
	 * 
	 * @param Clazz
	 * @return
	 */

	@SuppressWarnings("rawtypes")
	public List queryList(Class Clazz);

	/**
	 * HSQL 查询list集合
	 * 
	 * @param HSQL
	 * @return
	 */
	public List  findObjectListByHsql(String HSQL);
	
	/**
	 * 删除数据
	 * @param obj
	 * @return
	 */
	public boolean delObj(Object obj);
}
