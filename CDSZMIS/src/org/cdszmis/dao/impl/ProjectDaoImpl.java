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
	
	public List<ProjectArrangementEntity> noarrangedProject(){
		return (List<ProjectArrangementEntity>) hibernateUtils.findobjByHsql("from ProjectArrangementEntity obj where obj.departids="+"");
	}
	/**
	 * 分派项目（确定项目承担的设计所，以及各个阶段相应的进度信息）
	 * @param project
	 * @return
	 */
	public String arrangeDepart(ProjectArrangementEntity paentity,String departids){
		ProjectArrangementEntity paentity2=null;
		paentity2=paentity;
		if(paentity2.getDepartids().equals("")){
			paentity2.setDepartids(departids);
		}
       return "success"	;
	} 
	/**
	 * 所级安排（设计所所长通过系统安排项目的负责人）
	 * @param project
	 * @return
	 */
	public  String ArrangeChargePerson(ProjectDepartArrangementEntity pdaentity, String chargeperson ){
		ProjectDepartArrangementEntity pdaentity2;
		pdaentity2=pdaentity;
		if(pdaentity2.getChargeperson().equals("")){
			pdaentity2.setChargeperson(chargeperson);
			
		}
		return "success";
		
	}
	
	/**
	 * 项目实施（项目负责人定期更新项目进度状态；提交完成的设计项目到总工办审核）
	 * （项目进度方案。初设。施工图）
	 * 
	 * @param project
	 * @return
	 */
	
	//状态更改
	public ProjectStatusEntity changeStatus(ProjectStatusEntity projectstatus){
		try {
			if ("0".equals(projectstatus.getStatus())) {//"方案"
				projectstatus.setStatus(0);
			} 			
			if("1".equals(projectstatus.getStatus())){
				projectstatus.setStatus(1);//将状态更改为"初设"
			}
			
			if("2".equals(projectstatus.getStatus())){
				projectstatus.setStatus(2);//将状态更改为"施工图"
			}
			if("3".equals(projectstatus.getStatus())){
				projectstatus.setStatus(3);//将状态更改为“院长签发”	
			}
			
		    if("4".equals(projectstatus.getStatus())){
				projectstatus.setStatus(4);//将状态更改为"出版"
			}
		    if("5".equals(projectstatus.getStatus())){
				projectstatus.setStatus(5);//将状态更改为"发行"
			}
		    if("6".equals(projectstatus.getStatus())){
				projectstatus.setStatus(6);//将状态更改为"项目结束"
			}
		    if("7".equals(projectstatus.getStatus())){
				projectstatus.setStatus(7);//将状态更改为"归档"
			}
		    
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return projectstatus;
	}
	
}
