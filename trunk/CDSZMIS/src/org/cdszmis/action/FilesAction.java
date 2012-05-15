package org.cdszmis.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.cdszmis.entity.AttachmentEntity;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings ("serial")
public class FilesAction extends ActionSupport {
	private File file;
	private String fileName;
	private String contentType;
	private ServletContext context;

	public String addFiles() {
		return "add";
	}

	/**
	 * @author Impl 
	 * @exception isPost upload file , isGet reach this page
	 * @return String
	 */
	public String fileUpload() {
		/*
		 * String targetDirectory = context.getRealPath("/upload"); String
		 * targetFileName = generateFileName(fileName); File target = new
		 * File(targetDirectory, targetFileName); AttachmentEntity
		 * attachment=new AttachmentEntity(); attachment.setFilename(fileName);
		 * attachment.setFileurl(targetDirectory+"/"+targetFileName);
		 * attachment.setFilesize(
		 * String.valueOf(FileUtils.sizeOfDirectory(file)));
		 * attachment.setFiletype(fileName.substring(fileName.lastIndexOf("."))
		 * ); try { FileUtils.copyFile(file, target); } catch(IOException e) {
		 * e.printStackTrace(); }
		 */
		String method =org.apache.struts2.ServletActionContext.getRequest().getMethod();
		boolean isPostMethod = "POST".equalsIgnoreCase(method); 
		if(isPostMethod){
			String realpath = ServletActionContext.getServletContext().getRealPath("/uploadFile");
			if(file != null){
				File savefile = new File(new File(realpath), fileName);
				try {
					FileUtils.copyFile(file, savefile);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return "fileupload" ;
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

	private String generateFileName(String fileName) {
		DateFormat format = new SimpleDateFormat("yyMMddHHmmss");
		String formatDate = format.format(new Date());

		int random = new Random().nextInt(10000);

		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);

		return formatDate + random + extension;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public ServletContext getContext() {
		return context;
	}

	public void setContext(ServletContext context) {
		this.context = context;
	}

}
