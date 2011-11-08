package com.db;
import java.sql.*;
import java.util.*;//Connection,PreparedStatement

import javax.sql.*;//DataSource(DB관련정보)
import javax.naming.*;//Context

import java.util.*;

public class PhotoDAO {
	
	private Connection conn;// 오라클 연결
	private PreparedStatement ps;// 오라클에 쿼리 문장 전송

	// 오라클 연결 (오라클주소)
	private final String URL = "jdbc:oracle:thin:@211.238.142.118:1521:ORCL";// 문자열
																				// 상수
	private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String USERNAME = "scott";
	private final String PWD = "tiger";
	// TCP를 이용해서 전송 : 전송프로토콜 (http:80,telnet:23,ftp:21,smtp:25)

	// 객체를 한번 생성 (싱글턴)
	private static PhotoDAO dao;

	// 기능
	// 드라이버 등록 (오라클에서 제작한 클래스를 통해서 연결할 수 있게 만들어 준다)
	public PhotoDAO() {
		try {
			Class.forName(DRIVER);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	} 

	// 오라클 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PWD);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// 오라클 연결 해제
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();// 네트워크:out,in
			if (conn != null)
				conn.close();// socket
		} catch (Exception ex) {

		}
	}
	
	// 객체 메모리 생성
		public static PhotoDAO newInstance() {
			if (dao == null)
				dao = new PhotoDAO();  
			return dao;
		}
		
		  //게시물 전체 출력
		   public ArrayList<PhotoVO> getPhotoData(int page)
		   {
			   ArrayList<PhotoVO> list=new ArrayList<PhotoVO>();
			   try
			   {
	   
		
				   //연결
				   getConnection();
				   //쿼리문장
				   String sql="select no,id,content,regdate,filename,filesize,filetype,path from p_file  order by no desc";
				   //쿼리실행=결과값 : 오라클에서 데이터 10개씩(PL/SQL)
				   ps=conn.prepareStatement(sql);
				
				   ResultSet rs=ps.executeQuery();
				   
				   //페이지별 출력
				   int pagestart=(page*6)-6;//시작점
				   int i=0;//10씩 나눠주는 변수 
				   int j=0;//while의 횟수 
				   while(rs.next())
				   {
					   if(i<6 && j>=pagestart)
					   {
						   //값을 가지고 온다 
						   PhotoVO vo=new PhotoVO();
						   vo.setNo(rs.getInt(1));
						   vo.setId(rs.getString(2));
						   vo.setContent(rs.getString(3));
						   vo.setRegdate(rs.getDate(4));
						   vo.setFilename(rs.getString(5));
						   vo.setFilesize(rs.getInt(6));
						   vo.setFiletype(rs.getString(7));
						   vo.setPath(rs.getString(8)); 
						   
						   list.add(vo);
						   
						   i++;
					   }
					   j++;
				   }
		 
		
	
		  
				  
				   //결과값을 ArrayList담아둔다
			   }catch(Exception ex)
			   {
				   System.out.println(ex.getMessage());
			   }
			   finally
			   {
				   disConnection();
			   }
			   
			   return list;
		   }
		   

		   
		 //총페이지 구하기
		   public int getTotalPage()
		   {
			   int total=0;
			   try
			   {
				   getConnection();
				   String sql="select count(*) from p_file";
				   ps=conn.prepareStatement(sql);
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   int count=rs.getInt(1);
				   rs.close();
				   
				   total=count/6;//19/10 2
				   if(count%6>0)
					   total++;
				   
			   }catch(Exception ex)
			   {
				   System.out.println(ex.getMessage());
			   }
			   finally
			   {
				   disConnection();
			   }
			   return total;
		   }
		   
		  
		   //게시판 번호 순차적 출력
		   public int getPhotoCount()
		   {
			   int count=0;
			   try
			   {
				   getConnection();
				   String sql="select count(*) from p_file";
				   ps=conn.prepareStatement(sql);
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   count=rs.getInt(1);
				   rs.close();
			   }catch(Exception ex)
			   {
				   System.out.println(ex.getMessage());
			   }
			   finally
			   {
				   disConnection();
			   }
			   return count;
		   }
		   
	
		 //내용보기
		   public PhotoVO getContent(int no)
		   {
			   PhotoVO vo=new PhotoVO();
			   try
			   {
				   //연결
				   getConnection();
				   //쿼리문장 생성
				   
				
				  String sql="select id,content,path,filename,filesize,regdate,flag,filetype from p_file where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   //실행
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   
				   //PhotoVO에 값 입력
				   vo.setId(rs.getString(1));
				  vo.setContent(rs.getString(2));
				   vo.setPath(rs.getString(3));
				  vo.setFilename(rs.getString(4));
				  vo.setFilesize(rs.getInt(5));
				  vo.setRegdate(rs.getDate(6));
				  vo.setFlag(rs.getInt(7));
				  vo.setFiletype(rs.getString(8));
				  vo.setNo(no);
				   
				   rs.close();
				   
			   }catch(Exception ex)
			   {
				   System.out.println(ex.getMessage());
			   }
			   finally
			   {
				  disConnection();  
			   }
			   return vo;
		   } 
		   
		   
		   
		   //찾기
		   public int getFindCount(String fs,String ss)
		   {
			   int count=0;
			   
			   try
			   {
				  //연결
				  getConnection();
				  //쿼리문장 where name like '%?%'
				  String sql="select count(*) from p_file "
						 +"where "+fs+" like '%'||?||'%'";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1,ss);
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  count=rs.getInt(1);
				  rs.close();
			   }catch(Exception ex)
			   {
				  System.out.println(ex.getMessage());
			   }
			   finally
			   {
				  disConnection();
			   }
			   return count;
		   }
		   
		   
		   //찾기
		   
		   public ArrayList<PhotoVO> getFindData(String fs,String ss)
		   {
			   ArrayList<PhotoVO> list=
					      new ArrayList<PhotoVO>();
			   try
			   {
				  //연결
				  getConnection();
				  //쿼리문장 where name like '%?%'
				  String sql="select no,id,content,path,filename,filesize,regdate,flag,filetype from p_file "
						 +"where "+fs+" like '%'||?||'%'";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1,ss);
				  ResultSet rs=ps.executeQuery();
				  while(rs.next())
				  {
					   PhotoVO vo=new PhotoVO();
					   vo.setNo(rs.getInt(1));
					   vo.setId(rs.getString(2));
						  vo.setContent(rs.getString(3));
						   vo.setPath(rs.getString(4));
						  vo.setFilename(rs.getString(5));
						  vo.setFilesize(rs.getInt(6));
						  vo.setRegdate(rs.getDate(7));
						  vo.setFlag(rs.getInt(8));
						  vo.setFiletype(rs.getString(9));
						  
					   list.add(vo); 
				  }
				  rs.close();
			   }catch(Exception ex)
			   {
				  System.out.println(ex.getMessage());
			   }
			   finally
			   {
				  disConnection();
			   }
			   return list;
		   }
		   
		   
		   //등록
		   public void insert(PhotoVO vo) 
		   {
			   try
			   {
				   //연결
				   getConnection();
		
				 
				   //추가
				  String sql="insert into p_file values(p_file_no_seq.nextVal,?,?,?,SYSDATE,?,?,?,1)";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, vo.getId());
				   ps.setString(2, vo.getContent());
				   ps.setString(3, vo.getPath());
				   ps.setString(4, vo.getFilename());
				   ps.setInt(5, vo.getFilesize()); 
				   ps.setString(6, vo.getFiletype());
				   
				 
				  
				   
				   ps.executeUpdate();
				   
			   }catch(Exception ex)
			   {
				   System.out.println(ex.getMessage());
			   }
			   finally
			   {
				   disConnection();
			   }
		   }
		 

		  
		   //삭제
		   public boolean delete(PhotoVO vo,String pw)
		   {
			   boolean bCheck=false;
			   try
			   {
				  
				   getConnection();
					  String sql="select pw from p_person "
							  +"where id=?";
					  ps=conn.prepareStatement(sql);
					  ps.setString(1, vo.getId());
					  ResultSet rs=ps.executeQuery();
					  rs.next();
					  String db_pw=rs.getString(1);
					  rs.close();
					  ps.close();
					  if(db_pw.equals(pw))
					  {
						  bCheck=true;
					  sql="delete from p_file where no=?";
					  ps=conn.prepareStatement(sql);
					  ps.setInt(1, vo.getNo());
					  ps.executeUpdate();	
					  ps.close();
				   }
				   else
				   {
					   bCheck=false;
				   }
			   }catch(Exception ex)
			   {
				  System.out.println(ex.getMessage());
			   }
			   finally
			   {
				  disConnection();
			   }
			   return bCheck;
		   }
		  
		   
		   //수정
		   
		 //글 수정 data
		   public PhotoVO getUpdateData( int no)
		   {
			   PhotoVO vo=new PhotoVO();
			   try
			   {
				  getConnection();
				  String sql="select id,content from p_file where no=?";
				 
				  ps=conn.prepareStatement(sql);
				  ps.setInt(1, no);
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  vo.setNo(no);
				  vo.setId(rs.getString(1));
				  vo.setContent(rs.getString(2));
				 
				  rs.close();
				  
			   }catch(Exception ex)
			   {
				  System.out.println(ex.getMessage());   
			   }
			   finally
			   {
				  disConnection();
			   }
			   return vo;
		   }
		   
		   //실제 수정
		   public boolean update(PhotoVO vo,String pw)
		   {
			  boolean bCheck=false;
			   try
			   {
				 
				  getConnection();
				  String sql="select pw from p_person "
						  +"where id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1, vo.getId());
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  String db_pw=rs.getString(1);
				  rs.close();
				  if(db_pw.equals(pw))
				  {
					  bCheck=true;
					 
					
				 sql="update p_file set content=? where no=?";
					 
					 ps=conn.prepareStatement(sql);
				
					 ps.setString(1, vo.getContent());
					
					 ps.setInt(2,vo.getNo());
					 ps.executeUpdate();
				  }
				  else{
					  bCheck=false;
				  }
				  
			   }catch(Exception ex)
			   {
				  System.out.println(ex.getMessage());
			   }
			   finally
			   {
				  disConnection(); 
			   }
			   return bCheck;
		   }
		   
		   public String getName(String id){
			   
			   String name = "";
			   try
			   {
				   getConnection();
				   String sql = "select name from p_person where id like ?";
				   
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, id);
				   ResultSet rs = ps.executeQuery();
				   rs.next();
				   name=rs.getString(1);
				   System.out.println("쭈"+id+"|"+name);
				   rs.close();
				   
			   }catch(Exception ex)
			   {
				   System.out.println(ex.getMessage());
			   }
			   finally
			   {
				   disConnection();
				   
			   }
			   return name;
		   }
}


