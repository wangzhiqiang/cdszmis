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
	
	
}
