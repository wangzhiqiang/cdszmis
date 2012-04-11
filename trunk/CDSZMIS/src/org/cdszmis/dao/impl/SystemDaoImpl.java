package org.cdszmis.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.dao.SystemDao;
import org.cdszmis.entity.SysDictionaryEntity;
import org.cdszmis.entity.SysMenuEntity;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.stereotype.Component;
@Component
public class SystemDaoImpl implements SystemDao {
@Resource HibernateUtils hibernateUtils;
	public SysDictionaryEntity dicManager(SysDictionaryEntity dic) {
		// TODO Auto-generated method stub
		return null;
	}


}
