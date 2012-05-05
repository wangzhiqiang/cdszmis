package org.cdszmis.dao.impl;


import java.util.List;


import javax.annotation.Resource;

import org.cdszmis.dao.SystemDao;
import org.cdszmis.entity.SysDictionaryEntity;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.stereotype.Component;
@Component
public class SystemDaoImpl implements SystemDao {
@Resource HibernateUtils hibernateUtils;

public SysDictionaryEntity dicManager(SysDictionaryEntity dic) {
	return  (SysDictionaryEntity) hibernateUtils.saveorupdate(dic);
}

public boolean delDic(SysDictionaryEntity dic) {
		 try {
			 hibernateUtils.delObject(dic);
		} catch (Exception e) {
			e.printStackTrace();
				return false;
		}
		return true;
	}


	@SuppressWarnings("unchecked")
	public List<SysDictionaryEntity> dicList(){
		 
		return hibernateUtils.findall(SysDictionaryEntity.class);
	}

 
	@SuppressWarnings("unchecked")
	public List<SysDictionaryEntity> dicListByActive() {
		return  hibernateUtils.findlistByHsql("from SysDictionaryEntity obj where obj.status=0");
	}




	public SysDictionaryEntity findic(int id) {
		 return (SysDictionaryEntity) hibernateUtils.findobjByHsql("from SysDictionaryEntity obj where obj.id="+id);
	}


public SysDictionaryEntity findic(String properties) {
	 return (SysDictionaryEntity) hibernateUtils.findobjByHsql("from SysDictionaryEntity obj where obj.properties="+properties);
}

@SuppressWarnings("unchecked")
public boolean delDic(Class clazz, int id) {
	return false;
}


}
