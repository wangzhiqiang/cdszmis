package org.cdszmis.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;

/**
 * 用户表
 * 
 * @author WZQ
 * 
 */ 
/**
 * @author Duke
 *
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "tb_user")
@Proxy(lazy=false)
public class UserEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String usname;
	private String gender;
	private String uspass;
	private String introduction;//简介
	private String loginname;//登录名
	private Date date;
	private String idcard;
	private String officenum;
	private String phone;
	private String email;
	private String condition;//调动情况
//	@ManyToMany(targetEntity=UserGroupEntity.class )
	


	@ManyToMany(  targetEntity=UserGroupEntity.class, cascade={CascadeType.REFRESH , CascadeType.MERGE},fetch=FetchType.EAGER )
	@JoinTable( name="tb_user_tb_usergroup",joinColumns=@JoinColumn(name="tb_user_id"),inverseJoinColumns=@JoinColumn(name="userGroupEntity_id") )
	private Set<UserGroupEntity> userGroupEntity;//用户组
	@ManyToOne(targetEntity=DepartmentEntity.class  )
	private DepartmentEntity departmentEntity;//用户部门
	
/*	private String usgroups;//用户组id 以':'隔开
	private String usdeparts;//用户部门id 以':'隔开
*/	private String ustitles;//职称id 以':'隔开
	private String uspositions;//职务id 以':'隔开
	private Date createdate;//创建时间
	private int status;// 激活  、注销
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsname() {
		return usname;
	}
	public void setUsname(String usname) {
		this.usname = usname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUspass() {
		return uspass;
	}
	public void setUspass(String uspass) {
		this.uspass = uspass;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getOfficenum() {
		return officenum;
	}
	public void setOfficenum(String officenum) {
		this.officenum = officenum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public Set<UserGroupEntity> getUserGroupEntity() {
		return userGroupEntity;
	}
	public void setUserGroupEntity(Set<UserGroupEntity> userGroupEntity) {
		this.userGroupEntity = userGroupEntity;
	}
	public DepartmentEntity getDepartmentEntity() {
		return departmentEntity;
	}
	public void setDepartmentEntity(DepartmentEntity departmentEntity) {
		this.departmentEntity = departmentEntity;
	}
	public String getUstitles() {
		return ustitles;
	}
	public void setUstitles(String ustitles) {
		this.ustitles = ustitles;
	}
	public String getUspositions() {
		return uspositions;
	}
	public void setUspositions(String uspositions) {
		this.uspositions = uspositions;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
/*	public String getUsgroups() {
		return usgroups;
	}
	public void setUsgroups(String usgroups) {
		this.usgroups = usgroups;
	}
	public String getUsdeparts() {
		return usdeparts;
	}
	public void setUsdeparts(String usdeparts) {
		this.usdeparts = usdeparts;
	}
 */
}
