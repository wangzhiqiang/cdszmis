package org.cdszmis.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

/**
 * 项目状态信息
 * @author WZQ
 *
 */
@SuppressWarnings("serial")
@Entity
@Proxy(lazy = false)
@Table(name="tb_prijectstatus")
public class ProjectStatusEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	private Integer projectid;//项目id
	private Integer status;//项目状态
	private String history;//状态更新历史
	private Date createdate;//创建时间
	private Date reportdate;
	private String reportperson;
	
	@ManyToOne(targetEntity = ProjectEntity.class, 
			   cascade = {CascadeType.ALL, CascadeType.MERGE},
		    fetch=FetchType.EAGER)
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
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
