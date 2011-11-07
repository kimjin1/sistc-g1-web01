package com.db;
import java.util.*;
import java.util.Date;
import java.sql.*;


public class ReplyDAO {

	private Connection conn;// ����Ŭ ����
	private PreparedStatement ps;// ����Ŭ�� ���� ���� ����

	// ����Ŭ ���� (����Ŭ�ּ�)
	private final String URL = "jdbc:oracle:thin:@211.238.142.118:1521:ORCL";// ���ڿ�
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
	
	   public ArrayList<ReplyVO> getReplyData( int flag, int rootno)
	   {
		   
		   ArrayList<ReplyVO> list=new ArrayList<ReplyVO>();
		   try
		   {
			   //����
			   getConnection();
			   //��������
			   String sql="select no,id,rootno,content,regdate,flag from p_reply where flag=? and rootno=?  order by no desc";
			   //��������=����� : ����Ŭ���� ������ 10����(PL/SQL)
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, flag);
			   ps.setInt(2, rootno);
			  
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
	
		public void replyinsert(ReplyVO vo) {
			try {
				// ����
				getConnection();
				// �߰�
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
	//���� : �α����ؾ� �����,�Խ��������� �����
		public void delete(int no, int rootno){
			   try {
				   getConnection();
				   String sql="delete from p_reply where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
				   ps.close();
				   sql = "update p_board set depth=depth-1 where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, rootno);
				   ps.executeUpdate();
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}finally{
				disConnection();
			}
		   }
	//�Ѵ��� ����:�۹�ȣ,�Խ��� ��ȣ

}
