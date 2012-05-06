package org.cdszmis.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * 附件
 * @author WZQ
 *
 */
@SuppressWarnings ("serial")
@Entity
@Table(name="tb_attachment")
public class AttachmentEntity implements Serializable{
//附件
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String filename;
	private String filetype;
	private String filesize;
	private String fileurl;
	private String filestatus;
	@ManyToOne(targetEntity=FilesEntity.class  )
	private FilesEntity filesEntity;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getFilestatus() {
		return filestatus;
	}
	public void setFilestatus(String filestatus) {
		this.filestatus = filestatus;
	}
	public FilesEntity getFilesEntity() {
		return filesEntity;
	}
	public void setFilesEntity(FilesEntity filesEntity) {
		this.filesEntity = filesEntity;
	}
	
	
	
	
}
