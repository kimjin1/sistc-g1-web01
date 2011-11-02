package com.db;
import java.util.*;
import java.util.Date;
import java.sql.*;


public class ReplyDAO {

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
	private static BoardDAO dao;

	// 기능
	// 드라이버 등록 (오라클에서 제작한 클래스를 통해서 연결할 수 있게 만들어 준다)
	public ReplyDAO() {
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
	public static BoardDAO newInstance() {
		if (dao == null)
			dao = new BoardDAO();
		return dao;
	}
	//출력
	   //게시물 전체 출력
	
	   public ArrayList<ReplyVO> getReplyData(int flag, int rootno)
	   {
		   
		   ArrayList<ReplyVO> list=new ArrayList<ReplyVO>();
		   try
		   {
			   //연결
			   getConnection();
			   //쿼리문장
			   String sql="select no,id,rootno,content,regdate,flag from p_reply where flag=? and rootno=? order by no desc";
			   //쿼리실행=결과값 : 오라클에서 데이터 10개씩(PL/SQL)
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, flag);
			   ps.setInt(2, rootno);
			   ResultSet rs=ps.executeQuery();
   		 			 
			   while(rs.next())
			   {
				  
					   //값을 가지고 온다 
					   ReplyVO vo=new ReplyVO();
					   vo.setNo(rs.getInt(1));
					   vo.setId(rs.getString(2));
					   vo.setRootno(rs.getInt(3));
					   vo.setContent(rs.getString(4));
					   vo.setRegdate(rs.getDate(5));
					   vo.setFlag(rs.getInt(6));
									   
					   list.add(vo);
			   }
					   
				rs.close();
		   }
			   
		   //결과값을 ArrayList담아둔다
		  catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   
		   return list;
		   
		   }
	//등록 : 로그인해야 쓴다
	// 글 등록하기
	
		public void replyinsert(ReplyVO vo) {
			try {
				// 연결
				getConnection();
				// 추가
				String sql = "insert into p_reply values(p_reply_no_seq.nextVal,?,?,?,sysdate,?)";
			
				ps = conn.prepareStatement(sql);
			
				ps.setString(1, vo.getId());
				ps.setInt(2, vo.getRootno());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getFlag());
			
				ps.executeUpdate();

				ps.close();
				
				sql = "update p_board set depth=depth+1 where no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, vo.getRootno());
				ps.executeUpdate();
				
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();
			}

		}
	//삭제 : 로그인해야 지운다,게시판주인은 지우게
	//총덥굴 갯수:글번호,게시판 번호

}
