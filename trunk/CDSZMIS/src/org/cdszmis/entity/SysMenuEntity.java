package org.cdszmis.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 系统菜单项
 * 
 * @author WZQ
 * 
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "tb_sys_menu")
public class SysMenuEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int pid;// 菜单父id
	private String menuname;// 菜单名称
	private String url;// 菜单路径
	private String menuimg;// 菜单img

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMenuimg() {
		return menuimg;
	}

	public void setMenuimg(String menuimg) {
		this.menuimg = menuimg;
	}

}
