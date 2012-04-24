package org.cdszmis.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.cdszmis.dao.ProjectDao;
import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;
import org.cdszmis.service.ProjectService;
import org.springframework.stereotype.Service;
@Service
public class ProjectServiceImpl implements ProjectService {
	@Resource ProjectDao projectdao;

	public String ArrangeChargePerson(ProjectDepartArrangementEntity pdaentity,
			String chargeperson) {
		return  projectdao.ArrangeChargePerson(pdaentity, chargeperson);
	}

	public String arrangeDepart(ProjectArrangementEntity paentity,
			String departids) {
		return projectdao.arrangeDepart(paentity, departids);
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

	public List<ProjectArrangementEntity> noarrangedProject() {
		return projectdao.noarrangedProject();
	}

	public List<ProjectEntity> projectList() {
		return projectdao.projectList();
	}

	public ProjectEntity projectManage(ProjectEntity project) {
		return projectdao.projectManage(project);
	}

}
