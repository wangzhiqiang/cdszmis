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
 *项目提交信息(包含总工审查信息)
 * @author WZQ
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(name="tb_projectsubmit")
public class ProjectSubmitEntity implements Serializable{

	 
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int projectid;
	private Date enddate;//实际设计结束时间
	private String opinion ;//总工审查意见
	private String nopass;//未通过原因
	private String history;//历史记录
	private Date reportdate;//
	private String reportperson;
//	@OneToOne (mappedBy="tb_projectsubmit")
//	private ProjectEntity projectEntity;
//	
	
	@OneToOne (targetEntity=ProjectEntity.class,cascade={CascadeType.ALL})
	@PrimaryKeyJoinColumn
	private ProjectEntity projectEntity;//项目信息
	
	public ProjectEntity getProjectEntity() {
		return projectEntity;
	}
	public void setProjectEntity(ProjectEntity projectEntity) {
		this.projectEntity = projectEntity;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getNopass() {
		return nopass;
	}
	public void setNopass(String nopass) {
		this.nopass = nopass;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
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
//	public ProjectEntity getProjectEntity() {
//		return projectEntity;
//	}
//	public void setProjectEntity(ProjectEntity projectEntity) {
//		this.projectEntity = projectEntity;
//	}

}