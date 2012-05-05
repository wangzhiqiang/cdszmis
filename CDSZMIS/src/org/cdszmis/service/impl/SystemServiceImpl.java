package org.cdszmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.entity.SysDictionaryEntity;
import org.cdszmis.service.SystemService;
import org.cdszmis.dao.SystemDao;
import org.springframework.stereotype.Service;

@Service
public class SystemServiceImpl implements SystemService{
@Resource private SystemDao systemDao;

	

	public List<SysDictionaryEntity> dicList() {
		
		return  systemDao.dicList();
	}

	public List<SysDictionaryEntity> dicListByActive() {
		return  systemDao.dicListByActive();
	}

	public SysDictionaryEntity dicManager(SysDictionaryEntity dic) {
		return  systemDao.dicManager(dic);
	}

	public SysDictionaryEntity findic(int id) {
		return  systemDao.findic(id);
	}

	public SysDictionaryEntity findic(String properties) {
		return  systemDao.findic(properties);
	}
    public boolean delDic(SysDictionaryEntity dic) {
		
		return systemDao.delDic(dic);
	}

}
