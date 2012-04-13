package org.cdszmis.dao;


import org.cdszmis.entity.SysDictionaryEntity;

public interface SystemDao {
	/**
	 * 系统字典管理
	 * 增改
	 * @param dic
	 * @return
	 */
	public SysDictionaryEntity dicManager(SysDictionaryEntity dic);
	


}
