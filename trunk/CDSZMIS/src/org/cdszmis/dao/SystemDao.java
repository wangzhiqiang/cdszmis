package org.cdszmis.dao;

import java.util.List;

import org.cdszmis.entity.SysDictionaryEntity;
import org.cdszmis.entity.SysMenuEntity;

public interface SystemDao {
	/**
	 * 系统字典管理
	 * 增删改
	 * @param dic
	 * @return
	 */
	public SysDictionaryEntity dicManager(SysDictionaryEntity dic);
	


}
