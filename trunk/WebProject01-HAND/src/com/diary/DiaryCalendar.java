package com.diary;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DiaryCalendar {
	Calendar stDay = Calendar.getInstance();
	Calendar edDay = Calendar.getInstance();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_hh:mm");	
	String today[] = sdf.format(new Date()).split("_");	
	String currentYMD = today[0];
	String currentHM = today[1];
	
	public int[] todayCalendar(int year, int month){
		int[] result = new int[2];		
		stDay.set(year, month-1, 1);
		edDay.set(year, month-1, stDay.getActualMaximum(Calendar.DATE));
		result[0] = edDay.get(Calendar.DATE);
		result[1] = stDay.get(Calendar.DAY_OF_WEEK);
		return result;
	}
	
	public int getCurrentYear(){
		int year = 0;
		year = stDay.get(Calendar.YEAR);
		return year;
	}
	
	public int getCurrentMonth(){
		int month = 0;
		month = stDay.get(Calendar.MONTH)+1;
		return month;
	}
}
