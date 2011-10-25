package com.db;
import java.sql.*;
import java.util.*;
public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//����Ŭ ����
	private final String URL="jdbc:oracle:thin:@211.238.142.117:1521:ORCL";
	private final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private final String USERNAME="scott";
	private final String PWD="tiger";
	
	//��ü�� �ѹ� ����
	private static MemberDAO dao;
	
	//���
	//����̹� ���(����Ŭ���� ������ Ŭ������ ���ؼ� ������ �� �ְ� ����� �ش�.)
	public MemberDAO(){
		try{
			Class.forName(DRIVER);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	//����Ŭ ����
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL,USERNAME,PWD);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	//����Ŭ ���� ����
	public void disConnection(){
		try
		{
			if(ps!=null)
				ps.close(); //��Ʈ��ũ:out, in
			if(conn!=null)
				conn.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	//��ü �޸� ����
	public static MemberDAO newInstance(){
		if(dao==null)
			dao=new MemberDAO();
		return dao;
	}
	//�α���ó��
	//�α��� ó��
	   public String isLogin(String id,String pwd)
	   {
		   String result="";
		   try
		   {
			  getConnection();
			  String sql="select count(*)from P_PERSON where id=?";
			  ps=conn.prepareStatement(sql);//���� ����
			  ps.setString(1,id);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  int count=rs.getInt(1);
			  rs.close();
			  
			  if(count==0)
			  {
				  result="NOID";
			  }
			  else
			  {
				  sql="select pw,name from P_PERSON where id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1,id);
				  rs=ps.executeQuery();
				  rs.next();
				  String db_pw=rs.getString(1);
				  String db_name=rs.getString(2);
				  rs.close();
				  
				  if(db_pw.equals(pwd))
				  {
					 result=db_name; 
				  }
				  else
				  {
					  result="NOPWD";
				  }
			  }
		   }catch(Exception ex)
		   {
			  System.out.println(ex.getMessage());
		   }
		   finally
		   {
			  disConnection();
		   }
		   return result;
	   }
	   //������,�Ϲ� �����
	   public int isAdmin(String id){
		   int admin=0;
		   try{
			   getConnection();
			   String sql="select admin from p_person where id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   admin=rs.getInt(1);
			   rs.close();
			   //admin=1(������) admin=2(�Ϲ�)
		   }catch(Exception ex){
			   System.out.println(ex.getMessage());
		   }finally{
			   disConnection();
		   }
		   return admin;
	   }
	   
}
