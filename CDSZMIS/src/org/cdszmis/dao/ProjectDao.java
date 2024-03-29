package org.cdszmis.dao;


import java.util.List;

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
	 * 所级安排（设计所所长通过系统安排项目的负责人）
	 * 此时项目状态为“任务下达0”
	 * @param project
	 * @return
	 */
	public  ProjectDepartArrangementEntity arrangeChargePerson(ProjectDepartArrangementEntity pdaentity);
	

	/**
	 * 分派项目（确定项目承担的设计所）
	 * @param paentity
	 * @return
	 */
	public ProjectArrangementEntity arrangeDepart(ProjectArrangementEntity paentity) ;
	
	

	/**
	 * 项目实施（项目负责人定期更新项目进度状态）
	 * 查询状态处于方案1或初设2的
	 * （项目进度:方案1。初设2。施工图3）
	 * @param project
	 * @return
	 */
	public List<ProjectEntity> implStatusList();
	/**
	 * 总工审查（通过审查，将项目状态改为“院长签发4”，并 传送项目到院长签字环节。
	 * 未通过审查，则系统将项目状态变为“施工图3”）
	 * 查询状态为初设2或施工图3
	 * 
	 * @param project
	 * @return
	 */
	public List<ProjectEntity> checkStatusList();
	/**
	 * 签字出图（系统更改项目状态为“出版5”）
	 * 查询状态为院长签发4
	 * @param project
	 * @return
	 */
	public List<ProjectEntity> signStatusList();

	/**
	 *出版发行（项目状态改为“发行6，系统自动传送出图信息到档案室和经营室）
	 * 查询状态处于出版5
	 * @param project
	 * @return
	 */
	public List<ProjectEntity>  publicStatusList();

	/**
	 *发行收费（项目状态改为“项目结束7“）
	 * 查询状态处于发行6
	 * @param project
	 * @return
	 */
	public List<ProjectEntity>  saleStatusList();

	/**
	 *项目归档（将项目状态改为“项目归档8”）
	 * 查询状态处于结束7
	 * @param project
	 * @return(更改项目状态)
	 * 
	 */
	public List<ProjectEntity> fillStatusList();
	
	
	
	public ProjectStatusEntity changeStatus(ProjectStatusEntity projectstatus);
	
	 
}

