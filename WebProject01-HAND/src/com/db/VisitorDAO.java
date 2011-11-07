package com.db;

import java.util.*;
import java.sql.*;

public class VisitorDAO {
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
	private static VisitorDAO dao;

	// 기능
	// 드라이버 등록 (오라클에서 제작한 클래스를 통해서 연결할 수 있게 만들어 준다)
	public VisitorDAO() {
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
	public static VisitorDAO newInstance() {
		if (dao == null)
			dao = new VisitorDAO();
		return dao;
	}

	public VisitorVO getContent(int no) {
		VisitorVO vo = new VisitorVO();
		try {
			// 연결
			getConnection();
			// 쿼리문장 생성
			// 조회수 증가

			String sql = "select * from p_visitor";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			// 실행
			ResultSet rs = ps.executeQuery();
			rs.next();
			// VisitorVO에 값 입력
			vo.setName(rs.getString(1));
			vo.setHomepage(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setRegdate(rs.getDate(4));
			vo.setpw(rs.getString(5));
			

			rs.close();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}

	public ArrayList<VisitorVO> getVisitorData(int page) {
		ArrayList<VisitorVO> list = new ArrayList<VisitorVO>();
		try {
			// 연결
			getConnection();
			// 쿼리문장 전송
			String sql = "select * from p_visitor order by no desc";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			// 결과값
			//페이지별
			int pagestart=(page*10)-10;//시작점
			   int i=0;//10씩 나눠주는 변수 
			   int j=0;//while의 횟수 
			while (rs.next()) {
				 if(i<10 && j>=pagestart)
				   {
				VisitorVO vo = new VisitorVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setHomepage(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setRegdate(rs.getDate(5));
				vo.setpw(rs.getString(6));
				list.add(vo);
				
				i++;
			}
			
			   j++;
			}
			rs.close();
			// ArrayList에 첨부
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	// 글 등록

	// 글 등록하기
	public void insert(VisitorVO vo) {
		try {
			// 연결
			getConnection();

			// 추가
			String sql = "insert into p_visitor values(p_visitor_no_seq.nextVal,?,?,?,sysdate,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getHomepage());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getpw());

			ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}

	}
	
	//총페이지
	 public int getTotalPage()
	   {
		   int total=0;
		   try
		   {
			   getConnection();
			   String sql="select count(*) from p_visitor";
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
	//페이지별
	 public int getBoardCount()
	   {
		   int count=0;
		   try
		   {
			   getConnection();
			   String sql="select count(*) from p_visitor";
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

	 //삭제
	 
	  public boolean delete(VisitorVO vo)
	   {
		   boolean bCheck=false;
		   try
		   {
			  System.out.println("dao:"+vo.getName()+"|"+vo.getNo()+"|"+vo.getpw());
			   getConnection();
				  String sql="select pw from p_visitor "
						  +"where name=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1, vo.getName()); 
				  ResultSet rs=ps.executeQuery(); 
				  rs.next();
				  String db_pw=rs.getString(1);
				  rs.close();
				  ps.close();
				  if(db_pw.equals(vo.getpw())) 
				  {
					  bCheck=true;
				  sql="delete from p_visitor where no=?";
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
	 
}


