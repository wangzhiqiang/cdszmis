package org.cdszmis.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

/**
 * 用户组
 * @author WZQ
 *
 */ 
@SuppressWarnings("serial")
@Entity
@Table(name="tb_usergroup")
@Proxy(lazy=false)
public class UserGroupEntity implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String groupname;
	private Date createdate;
	private String namespace;//用户组可用命名空间
//	@ManyToMany(targetEntity=UserEntity.class,fetch=FetchType.EAGER)
//	private Set<UserEntity> userEntities;
	
	@ManyToMany(  targetEntity=SysMenuEntity.class, cascade={CascadeType.PERSIST, CascadeType.MERGE},fetch=FetchType.EAGER )
	@JoinTable( name="tb_usergroup_tb_sys_menu",joinColumns=@JoinColumn(name="tb_usergroup_id"),inverseJoinColumns=@JoinColumn(name="menSysMenuEntities_id") )
	private Set<SysMenuEntity> menSysMenuEntities;//用户组控制的菜单项
	 
	
	
//	public Set<UserEntity> getUserEntities() {
//		return userEntities;
//	}
//
//
//	public void setUserEntities(Set<UserEntity> userEntities) {
//		this.userEntities = userEntities;
//	}

 
	public String getGroupname() {
		return groupname;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getNamespace() {
		return namespace;
	}
	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}
	public Set<SysMenuEntity> getMenSysMenuEntities() {
		return menSysMenuEntities;
	}
	public void setMenSysMenuEntities(Set<SysMenuEntity> menSysMenuEntities) {
		this.menSysMenuEntities = menSysMenuEntities;
	}
	
}
