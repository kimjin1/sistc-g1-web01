package com.db;
import java.util.*;
import java.sql.*;

public class VisitorDAO {
   private Connection conn;//오라클 연결
   private PreparedStatement ps;//오라클에 쿼리 문장 전송
   
   //오라클 연결 (오라클주소)
   private final String URL="jdbc:oracle:thin:@211.238.142.117:1521:ORCL";//문자열 상수
   private final String DRIVER="oracle.jdbc.driver.OracleDriver";
   private final String USERNAME="scott";
   private final String PWD="tiger";
   //TCP를 이용해서 전송 : 전송프로토콜 (http:80,telnet:23,ftp:21,smtp:25)
   
   //객체를 한번 생성 (싱글턴)
   private static VisitorDAO dao;
   
   //기능
   //드라이버 등록 (오라클에서 제작한 클래스를 통해서 연결할 수 있게 만들어 준다)
   public VisitorDAO()
   {
	   try
	   {
		 Class.forName(DRIVER);   
	   }catch(Exception ex)
	   {
		 System.out.println(ex.getMessage());
	   }
   }
   //오라클 연결 
   public void getConnection()
   {
	  try
	  {
		 conn=DriverManager.getConnection(URL,USERNAME,PWD); 
	  }catch(Exception ex)
	  {
		 System.out.println(ex.getMessage()); 
	  }
   }
   //오라클 연결 해제
   public void disConnection()
   {
	   try
	   {
		  if(ps!=null)
			  ps.close();//네트워크:out,in
		  if(conn!=null)
			  conn.close();//socket
	   }catch(Exception ex)
	   {
		   
	   }
   }
   //객체 메모리 생성
   public static VisitorDAO newInstance()
   {
	   if(dao==null)
		   dao=new VisitorDAO();
	   return dao;
   }
}
