package org.cdszmis.action;


import java.util.List;


import javax.annotation.Resource;
import org.cdszmis.entity.SysDictionaryEntity;

import org.cdszmis.service.SystemService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SystemAction extends ActionSupport {
	@Resource private SystemService systemService;

	private SysDictionaryEntity dic;
	private String isdel=null;
	public String dicmanager(){
		if(dic!=null){
			if(isdel==null){
				systemService.dicManager(dic);
			}else{
				systemService.delDic(dic);
			}
		}
		List<SysDictionaryEntity> dlist=systemService.dicList();
		ActionContext.getContext().put("alldic", dlist);
		return "add";
	}
  public String findallDic(){
		
		List<SysDictionaryEntity> dlist=systemService.dicList();
		ActionContext.getContext().put("alldic", dlist);
		return "listdic";
	}	
	public SysDictionaryEntity getDic() {
		return dic;
	}
	public void setDic(SysDictionaryEntity dic) {
		this.dic = dic;
	}
	public String getIsdel() {
		return isdel;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}	
}
