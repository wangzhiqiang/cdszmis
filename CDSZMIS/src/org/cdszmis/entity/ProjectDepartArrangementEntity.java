package org.cdszmis.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
/**
 * 所级安排信息
 * @author WZQ
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "tb_prijectdepartarrangement")
public class ProjectDepartArrangementEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private Integer projectid;
	private String chargeperson;//项目负责人
	private String suggestion;//所长指导意见
	private Date reportdate;//填报时间
	private String reportperson;//填报人
	

	@OneToOne (targetEntity=ProjectEntity.class,cascade={CascadeType.ALL})
	@PrimaryKeyJoinColumn
	private ProjectEntity projectEntity;//项目信息


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getProjectid() {
		return projectid;
	}


	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
	}


	public String getChargeperson() {
		return chargeperson;
	}


	public void setChargeperson(String chargeperson) {
		this.chargeperson = chargeperson;
	}


	public String getSuggestion() {
		return suggestion;
	}


	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}


	public Date getReportdate() {
		return reportdate;
	}


	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}


	public String getReportperson() {
		return reportperson;
	}


	public void setReportperson(String reportperson) {
		this.reportperson = reportperson;
	}


	public ProjectEntity getProjectEntity() {
		return projectEntity;
	}


	public void setProjectEntity(ProjectEntity projectEntity) {
		this.projectEntity = projectEntity;
	}
	
	 
	
	
}
