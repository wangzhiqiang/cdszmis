package org.cdszmis.action;

import java.util.List;
import javax.annotation.Resource;

import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;
import org.cdszmis.service.ProjectService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProjectAction extends ActionSupport {
	@Resource private ProjectService projectservice;
	private ProjectEntity project;
	private ProjectStatusEntity projectstatus;
	ProjectArrangementEntity paentity;
	ProjectDepartArrangementEntity pdaentity;
	String chargeperson;
	String departids;
	private String isdel=null;
	private String isfill=null;
	public String projectmanage(){
		if(project!=null){
			if (isdel==null) {
				projectservice.projectManage(project);
				
			} else {
				System.out.print("**************"+project.getId());
				projectservice.delProject(project);

			}
		}
		List<ProjectEntity> plist = projectservice.projectList();
		ActionContext.getContext().put("allproject", plist);
		return "add";
	}
	public String findallProject(){
		List<ProjectEntity> plist = projectservice.projectList();
		ActionContext.getContext().put("alldepart", plist);
		return "listproject";
	}
	public String  findnoArranged(){
		List<ProjectArrangementEntity> plist = projectservice.noarrangedProject();
		ActionContext.getContext().put("allnoarranged", plist);
		return "listnoarranged";
	}
	public String arrangeDepart(){
		try {
			projectservice.arrangeDepart(paentity, departids);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "arrangedepart";
		
	}
	public String arrangeChargeperson(){
		try {
			projectservice.ArrangeChargePerson(pdaentity, chargeperson);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "arrangechargeperson";
	}
	
	
	
	public String chageStatus(){
		try {
			projectservice.changeStatus(projectstatus);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "changestatus";
		
	}
	
	public ProjectArrangementEntity getPaentity() {
		return paentity;
	}
	public void setPaentity(ProjectArrangementEntity paentity) {
		this.paentity = paentity;
	}
	public ProjectDepartArrangementEntity getPdaentity() {
		return pdaentity;
	}
	public void setPdaentity(ProjectDepartArrangementEntity pdaentity) {
		this.pdaentity = pdaentity;
	}
	public String getChargeperson() {
		return chargeperson;
	}
	public void setChargeperson(String chargeperson) {
		this.chargeperson = chargeperson;
	}
	public String getDepartids() {
		return departids;
	}
	public void setDepartids(String departids) {
		this.departids = departids;
	}
	public ProjectStatusEntity getProjectstatus() {
		return projectstatus;
	}
	public void setProjectstatus(ProjectStatusEntity projectstatus) {
		this.projectstatus = projectstatus;
	}
	public String getIsfill() {
		return isfill;
	}
	public void setIsfill(String isfill) {
		this.isfill = isfill;
	}
	public ProjectEntity getProject() {
		return project;
	}
	public void setProject(ProjectEntity project) {
		this.project = project;
	}
	public String getIsdel() {
		return isdel;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
	
	
}
