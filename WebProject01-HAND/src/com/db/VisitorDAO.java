package com.db;
import java.util.*;
import java.sql.*;

public class VisitorDAO {
   private Connection conn;//����Ŭ ����
   private PreparedStatement ps;//����Ŭ�� ���� ���� ����
   
   //����Ŭ ���� (����Ŭ�ּ�)
   private final String URL="jdbc:oracle:thin:@211.238.142.117:1521:ORCL";//���ڿ� ���
   private final String DRIVER="oracle.jdbc.driver.OracleDriver";
   private final String USERNAME="scott";
   private final String PWD="tiger";
   //TCP�� �̿��ؼ� ���� : ������������ (http:80,telnet:23,ftp:21,smtp:25)
   
   //��ü�� �ѹ� ���� (�̱���)
   private static VisitorDAO dao;
   
   //���
   //����̹� ��� (����Ŭ���� ������ Ŭ������ ���ؼ� ������ �� �ְ� ����� �ش�)
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
   //����Ŭ ���� 
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
   //����Ŭ ���� ����
   public void disConnection()
   {
	   try
	   {
		  if(ps!=null)
			  ps.close();//��Ʈ��ũ:out,in
		  if(conn!=null)
			  conn.close();//socket
	   }catch(Exception ex)
	   {
		   
	   }
   }
   //��ü �޸� ����
   public static VisitorDAO newInstance()
   {
	   if(dao==null)
		   dao=new VisitorDAO();
	   return dao;
   }
}
