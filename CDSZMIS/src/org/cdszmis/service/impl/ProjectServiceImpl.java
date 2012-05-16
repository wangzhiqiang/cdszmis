package org.cdszmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.dao.ProjectDao;
import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;
import org.cdszmis.entity.ProjectSubmitEntity;
import org.cdszmis.service.ProjectService;
import org.springframework.stereotype.Service;
@Service
public class ProjectServiceImpl implements ProjectService {
	@Resource   ProjectDao  projectdao;
	public ProjectDepartArrangementEntity arrangeChargePerson(
			ProjectDepartArrangementEntity pdaentity) {
		return projectdao.arrangeChargePerson(pdaentity);
	}

	public ProjectArrangementEntity arrangeDepart(ProjectArrangementEntity paentity) {
		return projectdao.arrangeDepart(paentity);
	}


	public ProjectStatusEntity changeStatus(ProjectStatusEntity projectstatus) {
		return projectdao.changeStatus(projectstatus);
	}

	public boolean delProject(Class clazz, int id) {
		return projectdao.delProject(clazz, id);
	}

	public boolean delProject(ProjectEntity project) {
		return projectdao.delProject(project);
	}

	public ProjectEntity findProject(int id) {
		return projectdao.findProject(id);
	}
	
	public List<ProjectEntity> projectList() {
		return projectdao.projectList();
	}
	public List<ProjectEntity> implStatusList(){
		return projectdao.implStatusList();
	}
	
	public List<ProjectEntity> checkStatusList(){
		return projectdao.checkStatusList();
	}
	
	public List<ProjectEntity> signStatusList(){
		return projectdao.signStatusList();
	}

	public List<ProjectEntity>  publicStatusList(){
		return projectdao.publicStatusList();
	}

	public List<ProjectEntity>  saleStatusList(){
		return projectdao.saleStatusList();
	}

	public List<ProjectEntity> fillStatusList(){
		return projectdao.fillStatusList();
	}
	

	public ProjectEntity projectManage(ProjectEntity project) {
		return projectdao.projectManage(project);
	}
	

}
