package com.db;
import java.sql.*;
import java.util.*;
import java.util.Date;
public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//����Ŭ ����
	private final String URL="jdbc:oracle:thin:@211.238.142.118:1521:ORCL";
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
				  sql="select pw,name,email from P_PERSON where id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1,id);
				  rs=ps.executeQuery();
				  rs.next();
				  String db_pw=rs.getString(1);
				  String db_name=rs.getString(2);
				  String db_email=rs.getString(3);
				  rs.close();
				  
				  if(db_pw.equals(pwd))
				  {
					 result=db_name+":"+db_email; 
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
	 //���̵� üũ
	   public boolean isIdCheck(String id){
		   boolean bCheck=false;
		   try{
			   getConnection();
			   String sql="select count(*) from p_person where id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, id);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  int count=rs.getInt(1);
			  rs.close();
			  
			  if(count==0){
				  bCheck=true;
			  }else
				  bCheck=false;
			  
		   }catch(Exception ex){
			   System.out.println(ex.getMessage());
		   }finally{
			   disConnection();
		   }
		   return bCheck;
	   }
	   //���̵� ����
	   public void insert(MemberVO vo){
		   try{
			   getConnection();
			   String sql="insert into p_person values(?,?,?,?,?,sysdate,?,?,?,?,2)";
			   ps=conn.prepareStatement(sql);
			   
			   
			   ps.setString(1, vo.getId());
			   ps.setString(2, vo.getPw());
			   ps.setString(3, vo.getName());
			   long time = vo.getBirth().getTime();
			   ps.setDate(4, new java.sql.Date(time));
			   ps.setString(5, vo.getNickname());
			   ps.setString(6, vo.getMemo());		   
			   ps.setString(7, vo.getEmail());
			   ps.setString(8, vo.getPhoto());
			   ps.setString(9, vo.getHomepage());
			   
			   
			 
			   ps.executeUpdate();
			   ps.close();
			   
			   
		   }catch(Exception ex){
			   System.out.println(ex.getMessage());
		   }finally{
			   disConnection();
		   }
	   }
	  
}
	   

