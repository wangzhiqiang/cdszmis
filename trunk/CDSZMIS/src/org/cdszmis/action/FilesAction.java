package org.cdszmis.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class FilesAction extends ActionSupport {
	private File file;   
    private String fileName;   
    private String contentType;   
    private ServletContext context;
	public String addFiles(){
		return "add";
	}
	public String fileUpload(){
		String targetDirectory = context.getRealPath("/upload");   
        String targetFileName = generateFileName(fileName);   
        File target = new File(targetDirectory, targetFileName);   
           
        try
		{
			FileUtils.copyFile(file, target);
		} catch(IOException e)
		{
			e.printStackTrace();
		}  
		
		return SUCCESS;
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
