package org.cdszmis.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.cdszmis.dao.PublicDao;
import org.cdszmis.entity.AttachmentEntity;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings ("serial")
public class FilesAction extends ActionSupport {
	@Resource PublicDao publicDao;
	private AttachmentEntity attachment;
	
	
	private File file;
	private String fileFileName;
	private String fileContentType;

	public String addFiles() {
		return "add";
	}

	/**
	 * @exception isPost upload file , isGet reach this page
	 * @return String
	 */
	public String fileUpload() {
		String method =org.apache.struts2.ServletActionContext.getRequest().getMethod();
		boolean isPostMethod = "POST".equalsIgnoreCase(method); 
		if(isPostMethod){
			String realpath = ServletActionContext.getServletContext().getRealPath("/uploadFile");
			if(file != null){
				attachment=new AttachmentEntity();
				attachment.setFilename(fileFileName);
				attachment.setFilesize(file.length());
				attachment.setFiletype(fileContentType);
				attachment.setFileurl("/uploadFile"+"/"+generateFileName(fileFileName));
				
				File savefile = new File(new File(realpath), generateFileName(fileFileName));
				try {
					FileUtils.copyFile(file, savefile);
					publicDao.saveOrupdateObject(attachment);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		List lsf=publicDao.findObjectListByHsql("from FilesEntity ");
		List lsa=publicDao.findObjectListByHsql("from AttachmentEntity");
		
		return "fileupload" ;
	}
	
	private String generateFileName(String fileName) {
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(10000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return formatDate + random + extension;
	}

	/**
	 * 抄送人员列表
	 * 
	 * @return
	 */
	public String listOfCopy() {
		return "copyuser";
	}

	/**
	 * 审批人员列表
	 * 
	 * @return
	 */
	public String listOfExamine() {
		return "examinuser";
	}

	/**
	 * 办理人员列表
	 * 
	 * @return
	 */
	public String listOfTransact() {
		return "transactuser";
	}

	/**
	 * 取消意见模板
	 */
	public String mouldCancel() {
		return "mouldcancel";
	}

	/**
	 * 审批意见模板
	 */
	public String mouldExamine() {
		return "mouldexamine";
	}

	/**
	 * 办理意模板
	 */
	public String mouldTransact() {
		return "mouldtransact";
	}

	/**
	 * 办理完成意见模板
	 */
	public String mouldTransactSuccess() {
		return "mouldTransactSuccess";
	}

	/**
	 * 抄送意见模板
	 * 
	 * @return
	 */
	public String mouodlCopy() {

		return "mouodlCopy";
	}
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	
	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void setServletContext(ServletContext arg0) {
		
	}

	public AttachmentEntity getAttachment() {
		return attachment;
	}

	public void setAttachment(AttachmentEntity attachment) {
		this.attachment = attachment;
	}

}
