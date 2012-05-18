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
/*
 * 项目分排信息
 */
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "tb_projectarrangement")
public class ProjectArrangementEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private Integer projectid;// 项目（合同）id
	private String name;// 项目名称(别称如果没有可以是合同名称)
	private String  departids;// 部门ids.可能是多个部门
	private Date startdate;// 下达项目时间
	private Date designdate;// 计划设计结束时间
	private Date examinationedate;// 计划总工审查结束时间
	private Date signdate;// 计划院长签字时间
	private Date publicationdate;// 计划出版结束时间
	private String suggestion;// 总工指导意见
	private Date reportdate;//填报时间
	private String reportperson;//填报人
	

	
	@OneToOne ( cascade={CascadeType.ALL})
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDepartids() {
		return departids;
	}


	public void setDepartids(String departids) {
		this.departids = departids;
	}


	public Date getStartdate() {
		return startdate;
	}


	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}


	public Date getDesigndate() {
		return designdate;
	}


	public void setDesigndate(Date designdate) {
		this.designdate = designdate;
	}


	public Date getExaminationedate() {
		return examinationedate;
	}


	public void setExaminationedate(Date examinationedate) {
		this.examinationedate = examinationedate;
	}


	public Date getSigndate() {
		return signdate;
	}


	public void setSigndate(Date signdate) {
		this.signdate = signdate;
	}


	public Date getPublicationdate() {
		return publicationdate;
	}


	public void setPublicationdate(Date publicationdate) {
		this.publicationdate = publicationdate;
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
