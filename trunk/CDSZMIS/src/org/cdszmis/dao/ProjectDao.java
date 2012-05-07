package org.cdszmis.dao;


import java.util.List;

import org.cdszmis.entity.FilesEntity;
import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;

public interface ProjectDao {
	/**
	 * 项目登记＼修改
	 * 
	 * @param project
	 * @return
	 */
	public ProjectEntity projectManage(ProjectEntity project);
	/**
	 * 删除项目
	 * 
	 * @param clzz
	 * @param id
	 * @return
	 */
	public boolean delProject(Class clazz ,int id);
	/**
	 * 删除项目
	 * @param project
	 * @return
	 */
	public boolean delProject(ProjectEntity project);
	/**
	 * 查询项目
	 * 
	 * @param id
	 * @return
	 */
	public ProjectEntity findProject(int id);
	/**
	 * 查询所有项目
	 * @return
	 */
	public List<ProjectEntity> projectList();
	/**
	 * 所级安排及分派项目的查询（查询所有未安排的项目）
	 * @return
	 */
	public List<ProjectArrangementEntity> noarrangedDepart();
	
	public List<ProjectArrangementEntity> noarrangedPerson();
	/**
	 * 分派项目（确定项目承担的设计所，以及各个阶段相应的进度信息）
	 * @param paentity
	 * @return
	 */
	public ProjectArrangementEntity arrangeDepart(ProjectArrangementEntity paentity,String departids) ;
	/**
	 * 所级安排（设计所所长通过系统安排项目的负责人）
	 * @param project
	 * @return
	 */
	public  ProjectDepartArrangementEntity arrangeChargePerson(ProjectDepartArrangementEntity pdaentity, String chargeperson);
	
	/**
	 * 项目实施（项目负责人定期更新项目进度状态；提交完成的设计项目到总工办审核）
	 * 
	 * （项目进度:方案0。初设1。施工图2）
	 * @param project
	 * @return
	 */

	/**
	 * 总工审查（通过审查，将项目状态改为“院长签发3”，并 传送项目到院长签字环节。
	 * 未通过审查，则系统将项目状态变为“施工图4”，并 将项目退回到设计所，同时记录提交/退回历史信息）
	 * 
	 * 
	 * @param project
	 * @return
	 */
	/**
	 * 签字出图（系统更改项目状态为“出版5”）
	 * 
	 * @param project
	 * @return
	 */
	/**
	 *出版发行（项目状态改为“发行6，系统自动传送出图信息到档案室和经营室）
	 * 
	 * @param project
	 * @return
	 */
	
	/**
	 *发行收费（项目状态改为“项目结束“）
	 * 
	 * @param project
	 * @return
	 */
	/**
	 *项目归档（将项目状态改为“项目归档8”）
	 * 
	 * @param project
	 * @return(更改项目状态)
	 */
	public ProjectStatusEntity changeStatus(ProjectStatusEntity projectstatus);
	
	 
}

