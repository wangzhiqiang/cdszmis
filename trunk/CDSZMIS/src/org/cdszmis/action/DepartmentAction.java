package org.cdszmis.action;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.service.DepartService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DepartmentAction extends ActionSupport{
@Resource private DepartService departService;

private DepartmentEntity depart;
private String isdel=null;
	public String departmanager(){
		if(depart!=null){
			if(isdel==null){
//			System.out.println(depart.getDepartname());
			departService.departManager(depart);
			}else{
				
				System.out.println("**************"+depart.getId());
				departService.delDepart(depart);
			}
		}
		List<DepartmentEntity> dlist=departService.departList();
		ActionContext.getContext().put("alldepart", dlist);
		return "add";
	}
	
	public String findallDepart(){
		String hsql="from DepartmentEntity obj where 1=1 ";
		if(null!=depart){
			if (null!=depart.getDepartname()){
				hsql=hsql+"and obj.departname like '"+depart.getDepartname()+"%' ";
			}if(null!=depart.getDepartowner()){
				
				hsql=hsql+"and obj.departowner like '"+depart.getDepartowner()+"%'";
			}
		}
		List<DepartmentEntity> dlist=departService.getListByHsql(hsql);
		ActionContext.getContext().put("alldepart", dlist);
		return "listdepart";
	}
	
	public DepartmentEntity getDepart() {
		return depart;
	}
	public void setDepart(DepartmentEntity depart) {
		this.depart = depart;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
 
	
}
