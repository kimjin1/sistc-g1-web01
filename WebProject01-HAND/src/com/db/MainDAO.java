package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MainDAO {
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
	public MainDAO() {
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

	// 게시물 전체 출력
	public ArrayList<PhotoVO> getPhotoData() {
		ArrayList<PhotoVO> list = new ArrayList<PhotoVO>();
		try {

			// 연결
			getConnection();
			// 쿼리문장
			String sql = "select no,id,content,regdate,filename,filesize,filetype,path from p_file order by no desc";
			// 쿼리실행=결과값 : 오라클에서 데이터 10개씩(PL/SQL)
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			int i = 0;

			while (rs.next()) {
				if (i < 3) {
					// 값을 가지고 온다
					PhotoVO vo = new PhotoVO();
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
			}

			// 결과값을 ArrayList담아둔다
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}

		return list;
	}
	
	 public ArrayList<BoardVO> getBoardData()
	   {
		   ArrayList<BoardVO> list2=new ArrayList<BoardVO>();
		   try
		   {
	 
			   //연결
			   getConnection();
			   //쿼리문장
			   String sql="select no,name,subject,email,regdate,readnum,grouplevel,depth from p_board  order by no desc";
			   //쿼리실행=결과값 : 오라클에서 데이터 10개씩(PL/SQL)
			   ps=conn.prepareStatement(sql);
	
			   ResultSet rs=ps.executeQuery();
			   
			   //페이지별 출력
			  int i=0;
			   while(rs.next())
			   {
				   if(i<3)
				   {
					   //값을 가지고 온다 
					   BoardVO vo=new BoardVO();
					   vo.setNo(rs.getInt(1));
					   vo.setName(rs.getString(2));
					   vo.setSubject(rs.getString(3));
					   vo.setEmail(rs.getString(4));
					   vo.setRegdate(rs.getDate(5));
					   vo.setReadnum(rs.getInt(6));
					   vo.setGrouplevel(rs.getInt(7));
					   vo.setDepth(rs.getInt(8));
					   
					   list2.add(vo);
					   
					   i++;
				   }
				
			   }
	
			  
			  
			   //결과값을 ArrayList담아둔다
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   
		   return list2;
	   }
}
