package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MainDAO {
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
	private static PhotoDAO dao;

	// ���
	// ����̹� ��� (����Ŭ���� ������ Ŭ������ ���ؼ� ������ �� �ְ� ����� �ش�)
	public MainDAO() {
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
	public static PhotoDAO newInstance() {
		if (dao == null)
			dao = new PhotoDAO();
		return dao;
	}

	// �Խù� ��ü ���
	public ArrayList<PhotoVO> getPhotoData() {
		ArrayList<PhotoVO> list = new ArrayList<PhotoVO>();
		try {

			// ����
			getConnection();
			// ��������
			String sql = "select no,id,content,regdate,filename,filesize,filetype,path from p_file order by no desc";
			// ��������=����� : ����Ŭ���� ������ 10����(PL/SQL)
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			int i = 0;

			while (rs.next()) {
				if (i < 3) {
					// ���� ������ �´�
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

			// ������� ArrayList��Ƶд�
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
	 
			   //����
			   getConnection();
			   //��������
			   String sql="select no,name,subject,email,regdate,readnum,grouplevel,depth from p_board  order by no desc";
			   //��������=����� : ����Ŭ���� ������ 10����(PL/SQL)
			   ps=conn.prepareStatement(sql);
	
			   ResultSet rs=ps.executeQuery();
			   
			   //�������� ���
			  int i=0;
			   while(rs.next())
			   {
				   if(i<3)
				   {
					   //���� ������ �´� 
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
	
			  
			  
			   //������� ArrayList��Ƶд�
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
