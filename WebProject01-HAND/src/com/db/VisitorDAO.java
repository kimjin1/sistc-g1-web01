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

	public ArrayList<VisitorVO> getVisitorData() {
		ArrayList<VisitorVO> list = new ArrayList<VisitorVO>();
		try {
			// ����
			getConnection();
			// �������� ����
			String sql = "select * from p_visitor order by no desc";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			// �����
			while (rs.next()) {
				VisitorVO vo = new VisitorVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setHomepage(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setRegdate(rs.getDate(5));
				list.add(vo);
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

}
