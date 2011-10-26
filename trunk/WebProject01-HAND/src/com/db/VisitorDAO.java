package com.db;

import java.util.*;
import java.sql.*;

public class VisitorDAO {
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
	private static VisitorDAO dao;

	// ���
	// ����̹� ��� (����Ŭ���� ������ Ŭ������ ���ؼ� ������ �� �ְ� ����� �ش�)
	public VisitorDAO() {
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
	public static VisitorDAO newInstance() {
		if (dao == null)
			dao = new VisitorDAO();
		return dao;
	}

	public VisitorVO getContent(int no) {
		VisitorVO vo = new VisitorVO();
		try {
			// ����
			getConnection();
			// �������� ����
			// ��ȸ�� ����

			String sql = "select * from p_visitor";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			// ����
			ResultSet rs = ps.executeQuery();
			rs.next();
			// VisitorVO�� �� �Է�
			vo.setName(rs.getString(1));
			vo.setHomepage(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setRegdate(rs.getDate(4));

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
			// ����
			getConnection();
			// �������� ����
			String sql = "select * from p_visitor order by no desc";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			// �����
			//��������
			int pagestart=(page*10)-10;//������
			   int i=0;//10�� �����ִ� ���� 
			   int j=0;//while�� Ƚ�� 
			while (rs.next()) {
				 if(i<10 && j>=pagestart)
				   {
				VisitorVO vo = new VisitorVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setHomepage(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setRegdate(rs.getDate(5));
				list.add(vo);
				
				i++;
			}
			
			   j++;
			}
			rs.close();
			// ArrayList�� ÷��
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	// �� ���

	// �� ����ϱ�
	public void insert(VisitorVO vo) {
		try {
			// ����
			getConnection();

			// �߰�
			String sql = "insert into p_visitor values(p_visitor_no_seq.nextVal,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getHomepage());
			ps.setString(3, vo.getContent());

			ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}

	}
	
	//��������
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
	//��������
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

}
