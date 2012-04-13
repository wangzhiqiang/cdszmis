package org.cdszmis.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 部门表
 * 
 * @author WZQ
 * 
 */

@SuppressWarnings("serial")
@Entity
@Table(name = "tb_depart")
public class DepartmentEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String departname;// 部门名称
	private String departnode;// 部门介绍
	private String responsibility;// 职责描述
	private String departowner;// 负责人
	private String departphonenumber;// 部门电话
	private Integer status;// 部门状态，1激活 、0注销
	private Date createdate;// 创建时间
//	@OneToMany
//	private Set<UserEntity> userEntity;
//	
//	 
//	public Set<UserEntity> getUserEntity() {
//		return userEntity;
//	}
//	public void setUserEntity(Set<UserEntity> userEntity) {
//		this.userEntity = userEntity;
//	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDepartname() {
		return departname;
	}
	public void setDepartname(String departname) {
		this.departname = departname;
	}
	public String getDepartnode() {
		return departnode;
	}
	public void setDepartnode(String departnode) {
		this.departnode = departnode;
	}
	public String getResponsibility() {
		return responsibility;
	}
	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}
	public String getDepartowner() {
		return departowner;
	}
	public void setDepartowner(String departowner) {
		this.departowner = departowner;
	}
	public String getDepartphonenumber() {
		return departphonenumber;
	}
	public void setDepartphonenumber(String departphonenumber) {
		this.departphonenumber = departphonenumber;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

  
}
