package com.db;
import java.util.*;
import java.sql.*;

import org.apache.catalina.Session;

import com.sun.org.apache.regexp.internal.RE;
public class ReplyDAO {

	private Connection conn;// ����Ŭ ����
	private PreparedStatement ps;// ����Ŭ�� ���� ���� ����

	// ����Ŭ ���� (����Ŭ�ּ�)
	private final String URL = "jdbc:oracle:thin:@211.238.142.117:1521:ORCL";// ���ڿ�
																				// ���
	private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String USERNAME = "scott";
	private final String PWD = "tiger";
	// TCP�� �̿��ؼ� ���� : ������������ (http:80,telnet:23,ftp:21,smtp:25)

	// ��ü�� �ѹ� ���� (�̱���)
	private static BoardDAO dao;

	// ���
	// ����̹� ��� (����Ŭ���� ������ Ŭ������ ���ؼ� ������ �� �ְ� ����� �ش�)
	public ReplyDAO() {
		try {
			Class.forName(DRIVER);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// ����Ŭ ����
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PWD);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	// ����Ŭ ���� ����
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();// ��Ʈ��ũ:out,in
			if (conn != null)
				conn.close();// socket
		} catch (Exception ex) {

		}
	}

	// ��ü �޸� ����
	public static BoardDAO newInstance() {
		if (dao == null)
			dao = new BoardDAO();
		return dao;
	}
	//���
	   //�Խù� ��ü ���
	
	   public ArrayList<ReplyVO> getReplyData(int page)
	   {
		   
		   ArrayList<ReplyVO> list=new ArrayList<ReplyVO>();
		   try
		   {
			   //����
			   getConnection();
			   //��������
			   String sql="select no,id,rootno,content,regdate,flag from p_reply order by no desc";
			   //��������=����� : ����Ŭ���� ������ 10����(PL/SQL)
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   
			 
			  
			  
			   while(rs.next())
			   {
				  
					   //���� ������ �´� 
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
			   //������� ArrayList��Ƶд�
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
	//��� : �α����ؾ� ����
	// �� ����ϱ�
	
		public void replyinsert(int flag,int rootno, ReplyVO vo) {
			try {
				// ����
				getConnection();
				// �߰�
				String sql = "insert into p_reply values(p_reply_no_seq.nextVal,'?',?,?,sysdate,?)";
				ps = conn.prepareStatement(sql);
			
				ps.setString(1, vo.getContent());
			

				ps.executeUpdate();

			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();
			}

		}
	//���� : �α����ؾ� �����,�Խ��������� �����
	//�Ѵ��� ����:�۹�ȣ,�Խ��� ��ȣ

}
