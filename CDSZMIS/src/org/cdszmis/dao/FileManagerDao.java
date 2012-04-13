package org.cdszmis.dao;

import org.cdszmis.entity.FilesEntity;

public interface FileManagerDao {
	/**
	 * 问件登记
	 * 
	 * @param file
	 * @return
	 */
	public FilesEntity fileRegistration(FilesEntity file);

	/**
	 * 文件归档
	 * 
	 * @param file
	 * @return
	 */
	public FilesEntity filingUpFile(FilesEntity file);
	
	
}
