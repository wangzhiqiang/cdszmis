package org.cdszmis.service.impl;

import java.util.List;

import org.cdszmis.dao.ProjectDao;
import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;
import org.cdszmis.service.ProjectService;

public class ProjectServiceImpl implements ProjectService {
	ProjectDao projectdao;

	public String ArrangeChargePerson(ProjectDepartArrangementEntity pdaentity,
			String chargeperson) {
		// TODO Auto-generated method stub
		return  projectdao.ArrangeChargePerson(pdaentity, chargeperson);
	}

	public String arrangeDepart(ProjectArrangementEntity paentity,
			String departids) {
		// TODO Auto-generated method stub
		return projectdao.arrangeDepart(paentity, departids);
	}

	public ProjectStatusEntity changeStatus(ProjectStatusEntity projectstatus) {
		// TODO Auto-generated method stub
		return projectdao.changeStatus(projectstatus);
	}

	public boolean delProject(Class clazz, int id) {
		// TODO Auto-generated method stub
		return projectdao.delProject(clazz, id);
	}

	public boolean delProject(ProjectEntity project) {
		// TODO Auto-generated method stub
		return projectdao.delProject(project);
	}

	public ProjectEntity findProject(int id) {
		// TODO Auto-generated method stub
		return projectdao.findProject(id);
	}

	public List<ProjectArrangementEntity> noarrangedProject() {
		// TODO Auto-generated method stub
		return projectdao.noarrangedProject();
	}

	public List<ProjectEntity> projectList() {
		// TODO Auto-generated method stub
		return projectdao.projectList();
	}

	public ProjectEntity projectManage(ProjectEntity project) {
		// TODO Auto-generated method stub
		return projectdao.projectManage(project);
	}

}
