package org.cdszmis.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

/**
 * 项目，合同信息
 * 
 * @author WZQ
 * 
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "tb_project")
@Proxy(lazy = false)
public class ProjectEntity implements Serializable{

	 
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String serialnumbers;// 项目（合同）编号，手工填写
	private String prijectname;// 项目(合同)名称
	private String commissionedname;// 委托单位
	private String contactperson;// 联系人
	private String contactphone;// 联系电话
	private String rate;// 费率
	private Float money;// 合同金额（万元）
	private String important;// 重要性
	private Date contractdate;// 合同签订时间
	private Date startdate;// 项目启动时间(提交总工办时间)
	private Date enddate;// 项目/合同结束时间
	private String detail ;//合同项目情况
	private Date createdate;// 填报时间
	private String subperson;// 填报人
//	@OneToOne //(mappedBy="projectEntity")
//	private ProjectSubmitEntity projectSubmitEntity;//项目提交信息(包含总工审查信息)
//	@OneToOne //(mappedBy="tb_projectarrangement")
//	private ProjectArrangementEntity projectArrangementEntity;//项目安排
//	@OneToMany(targetEntity = ProjectStatusEntity.class,//mappedBy="tb_projectarrangement",
//			   cascade = {CascadeType.PERSIST, CascadeType.MERGE},
//			    fetch=FetchType.EAGER)
//	private Set<ProjectStatusEntity> projectStatusEntity;//状态
//	@OneToOne // (targetEntity = ProjectDepartArrangementEntity.class)
//	private ProjectDepartArrangementEntity projectDepartArrangementEntity;//所级安排
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSerialnumbers() {
		return serialnumbers;
	}
	public void setSerialnumbers(String serialnumbers) {
		this.serialnumbers = serialnumbers;
	}
	public String getPrijectname() {
		return prijectname;
	}
	public void setPrijectname(String prijectname) {
		this.prijectname = prijectname;
	}
	public String getCommissionedname() {
		return commissionedname;
	}
	public void setCommissionedname(String commissionedname) {
		this.commissionedname = commissionedname;
	}
	public String getContactperson() {
		return contactperson;
	}
	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}
	public String getContactphone() {
		return contactphone;
	}
	public void setContactphone(String contactphone) {
		this.contactphone = contactphone;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	public String getImportant() {
		return important;
	}
	public void setImportant(String important) {
		this.important = important;
	}
	public Date getContractdate() {
		return contractdate;
	}
	public void setContractdate(Date contractdate) {
		this.contractdate = contractdate;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getSubperson() {
		return subperson;
	}
	public void setSubperson(String subperson) {
		this.subperson = subperson;
	}
//	public ProjectSubmitEntity getProjectSubmitEntity() {
//		return projectSubmitEntity;
//	}
//	public void setProjectSubmitEntity(ProjectSubmitEntity projectSubmitEntity) {
//		this.projectSubmitEntity = projectSubmitEntity;
//	}
//	public ProjectArrangementEntity getProjectArrangementEntity() {
//		return projectArrangementEntity;
//	}
//	public void setProjectArrangementEntity(
//			ProjectArrangementEntity projectArrangementEntity) {
//		this.projectArrangementEntity = projectArrangementEntity;
//	}
//	public Set<ProjectStatusEntity> getProjectStatusEntity() {
//		return projectStatusEntity;
//	}
//	public void setProjectStatusEntity(Set<ProjectStatusEntity> projectStatusEntity) {
//		this.projectStatusEntity = projectStatusEntity;
//	}
//	public ProjectDepartArrangementEntity getProjectDepartArrangementEntity() {
//		return projectDepartArrangementEntity;
//	}
//	public void setProjectDepartArrangementEntity(
//			ProjectDepartArrangementEntity projectDepartArrangementEntity) {
//		this.projectDepartArrangementEntity = projectDepartArrangementEntity;
//	}
//	 
 
}
