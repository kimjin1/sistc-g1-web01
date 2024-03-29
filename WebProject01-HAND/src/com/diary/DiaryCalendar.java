package com.diary;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

public class DiaryCalendar {

	private static DiaryCalendar instance;
	
	private DiaryCalendar() {}
	private Calendar currentDay = Calendar.getInstance();
	private Calendar stDay = Calendar.getInstance();
	private Calendar edDay = Calendar.getInstance();	
	
	public static DiaryCalendar getInstance(){
		if(instance==null){
			instance = new DiaryCalendar();
		}
		return instance;
	}
	
	public int[] getTodayCalendar(int year, int month){
		int[] result = new int[2];		
		stDay.set(year, month-1, 1);
		edDay.set(year, month-1, stDay.getActualMaximum(Calendar.DATE));
		result[0] = edDay.get(Calendar.DATE);
		result[1] = stDay.get(Calendar.DAY_OF_WEEK);
		return result;
	}
	
	public int getLastDayOfMonth(int year, int month){
		int[] result = getTodayCalendar(year, month);
		return result[0];
	}
		
	public int getCurrentYear(){
		int year = 0;
		year = currentDay.get(Calendar.YEAR);
		return year;
	}
	
	public int getCurrentMonth(){
		int month = 0;
		month = currentDay.get(Calendar.MONTH)+1;
		return month;
	}
	
	public int getCurrentDay(){
		int day = 0;
		day = currentDay.get(Calendar.DAY_OF_MONTH);
		return day;
	}
	
	public Date valueToDate(int[] ymdhm){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, ymdhm[0]);
		cal.set(Calendar.MONTH, ymdhm[1]-1);
		cal.set(Calendar.DATE, ymdhm[2]);
		cal.set(Calendar.HOUR_OF_DAY, ymdhm[3]);
		cal.set(Calendar.MINUTE, ymdhm[4]);
		Date event = new Date(cal.getTimeInMillis());
		return event;
	}
	
	public Date valueToDate(String strYear, String strMonth, String strDay){
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth)-1;
		int day = Integer.parseInt(strDay);
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month);
		cal.set(Calendar.DATE, day);
		Date event = new Date(cal.getTimeInMillis());
		return event;
	}
	
	public String[] dateToValue(Date dt){		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ymd = sdf.format(dt);
		String result[] = ymd.split("-");		
		return result;
	}
}
