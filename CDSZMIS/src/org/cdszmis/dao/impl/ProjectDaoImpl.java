package org.cdszmis.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cdszmis.entity.ProjectArrangementEntity;
import org.cdszmis.entity.ProjectDepartArrangementEntity;
import org.cdszmis.entity.ProjectEntity;
import org.cdszmis.entity.ProjectStatusEntity;
import org.cdszmis.utils.HibernateUtils;
import org.springframework.stereotype.Component;

@Component
public class ProjectDaoImpl implements org.cdszmis.dao.ProjectDao {
	@Resource HibernateUtils hibernateUtils;
	public ProjectEntity projectManage(ProjectEntity project)
	{
		return  (ProjectEntity) hibernateUtils.saveorupdate(project);
	}
	
	public boolean delProject(Class clazz ,int id)
	{
		try {
			 hibernateUtils.delObject(clazz, id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean delProject(ProjectEntity project)
	{
		 try {
					 hibernateUtils.delObject(project);
			 }
		 catch (Exception e) {
					e.printStackTrace();
						return false;
				             }
				return true;
	}

	public ProjectEntity findProject(int id)
	{
		return (ProjectEntity) hibernateUtils.findobjByHsql("from ProjectEntity obj where obj.id="+id);
	}
	
	public List <ProjectEntity> projectList()
	{
		return hibernateUtils.findall(ProjectEntity.class);
	}
	
	/**
	 * 项目实施（项目负责人定期更新项目进度状态）
	 * 查询状态处于方案1或初设2的
	 * （项目进度:方案1。初设2。施工图3）
	 * @param project
	 * @return
	 */
	public List<ProjectEntity> implStatusList(){
		return  hibernateUtils.findlistByHsql("from ProjectEntity obj, ProjectStatusEntity obj1 where obj.id=obj1.projectEntity.id and obj1.status=1 or obj1.status=2");
	}
	/**
	 * 总工审查（通过审查，将项目状态改为“院长签发4”，并 传送项目到院长签字环节。
	 * 未通过审查，则系统将项目状态变为“施工图3”）
	 * 查询状态为初设2或施工图3
	 * 
	 * @param project
	 * @return
	 */
	public List<ProjectEntity> checkStatusList(){
		return  hibernateUtils.findlistByHsql("from ProjectEntity obj, ProjectStatusEntity obj1 where obj.id=obj1.projectEntity.id and obj1.status=2  or obj1.status=3");
	}
	/**
	 * 签字出图（系统更改项目状态为“出版5”）
	 * 查询状态为院长签发4
	 * @param project
	 * @return
	 */
	public List<ProjectEntity> signStatusList(){
		return  hibernateUtils.findlistByHsql("from ProjectEntity obj, ProjectStatusEntity obj1 where obj.id=obj1.projectEntity.id and obj1.status=4");
	}

	/**
	 *出版发行（项目状态改为“发行6，系统自动传送出图信息到档案室和经营室）
	 * 查询状态处于出版5
	 * @param project
	 * @return
	 */
	public List<ProjectEntity>  publicStatusList(){
		return  hibernateUtils.findlistByHsql("from ProjectEntity obj, ProjectStatusEntity obj1 where obj.id=obj1.projectEntity.id and obj1.status=5");
	}

	/**
	 *发行收费（项目状态改为“项目结束7“）
	 * 查询状态处于发行6
	 * @param project
	 * @return
	 */
	public List<ProjectEntity>  saleStatusList(){
		return  hibernateUtils.findlistByHsql("from ProjectEntity obj, ProjectStatusEntity obj1 where obj.id=obj1.projectEntity.id and obj1.status=6");
	}

	/**
	 *项目归档（将项目状态改为“项目归档8”）
	 * 查询状态处于结束7
	 * @param project
	 * @return(更改项目状态)
	 * 
	 */
	public List<ProjectEntity> fillStatusList(){
		return  hibernateUtils.findlistByHsql("from ProjectEntity obj, ProjectStatusEntity obj1 where obj.id=obj1.projectEntity.id and obj1.status=7");
	}
	
	
	public ProjectArrangementEntity arrangeDepart(ProjectArrangementEntity paentity){
		
		return  (ProjectArrangementEntity) hibernateUtils.saveorupdate(paentity);
          
	} 

	public  ProjectDepartArrangementEntity arrangeChargePerson(ProjectDepartArrangementEntity pdaentity){
		
		return  (ProjectDepartArrangementEntity) hibernateUtils.saveorupdate(pdaentity);
		      
		
	}
	
	
	
	
	public ProjectStatusEntity changeStatus(ProjectStatusEntity projectstatus){
		
		return  (ProjectStatusEntity) hibernateUtils.saveorupdate(projectstatus);
	}
	
	
}
