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
	@SuppressWarnings("unchecked")
	public String dicmanager(){
		if(dic!=null){
			if(isdel==null){
				systemService.dicManager(dic);
			}else{
				systemService.delDic(dic);
			}
		}
		List dlist=systemService.findic();
		ActionContext.getContext().put("alldic", dlist);
		return "function";
	}
	
	@SuppressWarnings("unchecked")
	public String dicmanager01(){
		if(dic!=null){
			if(isdel==null){
				systemService.dicManager(dic);
			}else{
				systemService.delDic(dic);
			}
		}
		List dlist=systemService.findic01();
		ActionContext.getContext().put("alldic", dlist);
		return "office";
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
