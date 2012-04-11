package org.cdszmis.utils;

import java.text.SimpleDateFormat;

import java.util.Calendar;

/**
 * 关于日期和时间的函数
 * 
 * @author WZQ
 * 
 */
public class DateAndTime {
 
	Calendar cal = Calendar.getInstance();

	/**
	 * 得到某年某月的第一天
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public String getFirstDayOfMonth(int year, int month) {
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DAY_OF_MONTH, cal.getMinimum(Calendar.DATE));
		return new SimpleDateFormat("yyyy/MM/dd").format(cal.getTime());
	}

	/**
	 * 得到某年某月的最后一天
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public String getLastDayOfMonth(int year, int month) {
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int value = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, value);
		return new SimpleDateFormat("yyyy/MM/dd").format(cal.getTime());
	}
}
