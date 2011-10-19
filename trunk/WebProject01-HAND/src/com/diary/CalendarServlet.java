package com.diary;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");
		String[] week = {"일", "월", "화", "수", "목", "금", "토"}; 
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		
		DiaryCalendar myDC = new DiaryCalendar();
		int result[] = myDC.todayCalendar(year, month);
		int startDate = 1;
		int endDate = result[0];
		int offset = result[1];
		
		String output = "<table border=1 width=100% height=100%>";
		// 요일 표시
		for(int i=0; i<7; i++){
			output += "<th bgcolor=#ccccff>";
			if(i==0){
				output += "<font color=red>";
				output += week[i]; 
				output += "</font>";
			}else if(i==6){
				output += "<font color=blue>";
				output += week[i]; 
				output += "</font>";				
			}else{
				output += week[i];
			}
			output += "</th>";			
		}
		for(int i=0; i<6; i++){
			output += "<tr>";
			for(int j=0; j<7; j++){
				output += "<td valign=top>";
				if(i == 0 && j < offset-1){
					output += "&nbsp;";
				}else if(startDate <= endDate){
					output += startDate;
					startDate++;					
				}else{
					output += "&nbsp;";
				}
				output += "</td>";
			}
			output += "\n"+"</tr>";
		}
		output += "</table>";
		out.println(output);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
