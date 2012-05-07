package org.cdszmis.service;

import java.util.List;

import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;




public interface ProjectService {
	 
		public ProjectEntity projectManage(ProjectEntity project);
		
		public boolean delProject(Class clazz ,int id);
		
		public boolean delProject(ProjectEntity project);
		
		public ProjectEntity findProject(int id);
		
		public List<ProjectEntity> projectList();
		
		public List<ProjectArrangementEntity> noarrangedDepart();
		
		public List<ProjectArrangementEntity> noarrangedPerson();
		
		public ProjectArrangementEntity arrangeDepart(ProjectArrangementEntity paentity,String departids) ;
		
		public  ProjectDepartArrangementEntity arrangeChargePerson(ProjectDepartArrangementEntity pdaentity, String chargeperson);
		
		public ProjectStatusEntity changeStatus(ProjectStatusEntity projectstatus);
}
