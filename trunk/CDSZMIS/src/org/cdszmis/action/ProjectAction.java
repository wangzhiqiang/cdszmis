package org.cdszmis.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.cdszmis.entity.DepartmentEntity;
import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;
import org.cdszmis.entity.UserGroupEntity;
import org.cdszmis.service.ProjectService;
import org.cdszmis.utils.Encipherment;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings ("serial")
public class ProjectAction extends ActionSupport {
	@Resource private ProjectService projectservice;
	private ProjectEntity project;
	private ProjectStatusEntity projectstatus;
	ProjectArrangementEntity paentity;
	ProjectDepartArrangementEntity pdaentity;
	private String chargeperson;
	private String departids;
	private String isdel = null;

	public String projectmanage() {
		if(project != null)
		{
			if(isdel == null)
			{
				projectservice.projectManage(project);

			} else
			{
				System.out.print("**************" + project.getId());
				projectservice.delProject(project);

			}
		}
		List <ProjectEntity> plist = projectservice.projectList();
		ActionContext.getContext().put("allproject",plist);
		return "add";
	}

	public String findallProject() {
		List <ProjectEntity> plist = projectservice.projectList();
		ActionContext.getContext().put("allproject",plist);
		return "listproject";
	}

	public String arrangeDepartids() {
		if(null != paentity && paentity.getDepartids().equals(" "))
		{
			projectservice.arrangeDepart(paentity,departids);
		}
		List <ProjectArrangementEntity> plist = projectservice
				.noarrangedDepart();
		ActionContext.getContext().put("allnoarrangdepart",plist);
		return "arrangedepart";

	}

	public String arrangePerson() {
		if(null != pdaentity && pdaentity.equals(""))
		{
			projectservice.arrangeChargePerson(pdaentity,chargeperson);
		}
		List <ProjectDepartArrangementEntity> plist = projectservice
				.noarrangedPerson();
		ActionContext.getContext().put("allnoarrangperson",plist);
		return "arrangeperson";
	}

	public String projectImpl() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectimpl";
	}

	public String projectCheck() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectcheck";
	}

	public String projectSign() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectsign";
	}

	public String projectPublic() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectpublic";
	}

	public String projectSale() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectsale";
	}

	public String projectFilling() {
		try
		{
			projectservice.changeStatus(projectstatus);
		} catch(Exception e)
		{

			e.printStackTrace();
		}
		List <ProjectStatusEntity> plist = projectservice.statusList();
		ActionContext.getContext().put("allproject",plist);
		return "projectfilling";
	}

	/**
	 * 按部门统计
	 * 
	 * @return
	 */
	public String conutBydepart() {

		return "countbydepart";
	}

	/**
	 * 项目状态查询
	 * 
	 * @return
	 */
	public String projectStatus() {
		// ProjectStatusEntity
		return "projectstatus";
	}

	/**
	 * 项目详细信息查询
	 * 
	 * @return
	 */
	public String projectDetail() {

		return "projectdetail";
	}

	/**
	 * 项目进度查询
	 * 
	 * @return
	 */
	public String projectProgress() {
		return "projectprogess";
	}

	public ProjectEntity getProject() {
		return project;
	}

	public void setProject(ProjectEntity project) {
		this.project = project;
	}

	public ProjectStatusEntity getProjectstatus() {
		return projectstatus;
	}

	public void setProjectstatus(ProjectStatusEntity projectstatus) {
		this.projectstatus = projectstatus;
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

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

}
