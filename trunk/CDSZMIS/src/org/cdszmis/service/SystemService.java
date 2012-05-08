package org.cdszmis.service;

import java.util.List;


import org.cdszmis.entity.SysDictionaryEntity;

public interface SystemService {

	/**
	 * 系统字典管理
	 * 增 改 
	 * @param dic
	 * @return
	 */
	public SysDictionaryEntity dicManager(SysDictionaryEntity dic);
	/**
	 * 系统字典管理
	 * 查询所有职称信息
	 * @param 
	 * @return
	 */
	public List<SysDictionaryEntity> dicList();
	/**
	 * 通过id查询职称信息
	 * @param id
	 * @return
	 */
	public SysDictionaryEntity findic(int id);
	/**
	 * 查询激活状态职称信息
	 * @return
	 */
    public List<SysDictionaryEntity> dicListByActive();
	/**
	 * 根据字典标识查询
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List findic();
	@SuppressWarnings("unchecked")
	public List findic01();
	/**
	 * 删除职称信息
	 * @param dic
	 * @return
	 */
	public boolean delDic(SysDictionaryEntity dic);
	
}

