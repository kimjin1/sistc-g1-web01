package com.db;
import java.sql.*;
import java.util.*;
import java.util.Date;
public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//오라클 연결
	private final String URL="jdbc:oracle:thin:@211.238.142.118:1521:ORCL";
	private final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private final String USERNAME="scott";
	private final String PWD="tiger";
	
	//객체를 한번 생성
	private static MemberDAO dao;
	
	//기능
	//드라이버 등록(오라클에서 제작한 클래스를 통해서 연결할 수 있게 만들어 준다.)
	public MemberDAO(){
		try{
			Class.forName(DRIVER);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	//오라클 연결
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL,USERNAME,PWD);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	//오라클 연결 해제
	public void disConnection(){
		try
		{
			if(ps!=null)
				ps.close(); //네트워크:out, in
			if(conn!=null)
				conn.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	//객체 메모리 생성
	public static MemberDAO newInstance(){
		if(dao==null)
			dao=new MemberDAO();
		return dao;
	}
	//로그인처리
	//로그인 처리
	   public String isLogin(String id,String pwd)
	   {
		   String result="";
		   try
		   {
			  getConnection();
			  String sql="select count(*)from P_PERSON where id=?";
			  ps=conn.prepareStatement(sql);//쿼리 연결
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
	   //관리자,일반 사용자
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
			   //admin=1(관리자) admin=2(일반)
		   }catch(Exception ex){
			   System.out.println(ex.getMessage());
		   }finally{
			   disConnection();
		   }
		   return admin;
	   }
	 //아이디 체크
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
	   //아이디 삽입
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
	  
	   // 개인정보 수정
	   // 정보 얻어오기
	   public MemberVO getMemberData(String id){
		   MemberVO vo = new MemberVO();
		   try {
			getConnection();
			String sql = "select pw, name, birth, nickname, memo, email, photo, homepage from p_person where id like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setPw(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getDate(3));
			vo.setNickname(rs.getString(4));
			vo.setMemo(rs.getString(5));
			vo.setEmail(rs.getString(6));
			vo.setPhoto(rs.getString(7));
			vo.setHomepage(rs.getString(8));						
		} catch (Exception e) {
			System.out.println("getMemberData():"+e.getMessage());
		} finally {
			disConnection();
		}
		   return vo;
	   }
	   // 정보 수정하기
	   public void updateMemberData(MemberVO vo){
		   try {
			getConnection();
			String sql = "update p_person set pw=?, nickname=?, memo=?, email=?, photo=?, homepage=? where id like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getPw());
			ps.setString(2, vo.getNickname());
			ps.setString(3, vo.getMemo());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhoto());
			ps.setString(6, vo.getHomepage());
			ps.setString(7, vo.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateMemberData():"+e.getMessage());
		} finally {
			disConnection();
		}
	   }
}
	   

