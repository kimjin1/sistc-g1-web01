package com.db;
import java.sql.*;//Connection,PreparedStatement

import javax.sql.*;//DataSource(DB관련정보)
import javax.naming.*;//Context

import java.util.*;

public class PhotoDAO {
	
	private Connection conn;// 오라클 연결
	private PreparedStatement ps;// 오라클에 쿼리 문장 전송

	// 오라클 연결 (오라클주소)
	private final String URL = "jdbc:oracle:thin:@211.238.142.117:1521:ORCL";// 문자열
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
				   String sql="select * from p_file order by no desc";
				   //쿼리실행=결과값 : 오라클에서 데이터 10개씩(PL/SQL)
				   ps=conn.prepareStatement(sql);
				   ResultSet rs=ps.executeQuery();
				   
				   //페이지별 출력
				   int pagestart=(page*10)-10;//시작점
				   int i=0;//10씩 나눠주는 변수 
				   int j=0;//while의 횟수 
				   while(rs.next())
				   {
					   if(i<10 && j>=pagestart)
					   {
						   //값을 가지고 온다 
						   PhotoVO vo=new PhotoVO();
						  
						   vo.setContent(rs.getString(3));
						  vo.setPath(rs.getString(4));
						   vo.setPlag(rs.getInt(5));
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
		   
		   public void insert(PhotoVO vo)
			 {
				 try
				 {
					//연결
					getConnection();
					//시퀀스
					String sql="select max(no)+1 from "
							+"p_file";
					ps=conn.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					rs.next();
					int no=rs.getInt(1);
					rs.close();
					ps.close();
					//추가
					
					
				 }catch(Exception ex)
				 {
					System.out.println(ex.getMessage());
				 }
				 finally
				 {
					disConnection();
				 }
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
				   
				   total=count/10;//19/10 2
				   if(count%10>0)
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
	
		 //내용보기
		   public PhotoVO getContent(int no)
		   {
			   PhotoVO vo=new PhotoVO();
			   try
			   {
				   //연결
				   getConnection();
				   //쿼리문장 생성
				   //조회수 증가
				   String sql="update p_file set "
						   +"readnum=readnum+1 where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1,no);
				   ps.executeUpdate();
				   ps.close();
				   
				   sql="select ... from p_file where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   //실행
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   //PhotoVO에 값 입력
				  
				   
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
		   //등록
		   //수정
		   //삭제
		   
		   
		   
}

