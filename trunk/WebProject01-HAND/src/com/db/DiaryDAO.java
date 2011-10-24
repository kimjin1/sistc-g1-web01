package com.db;

import java.sql.*;

public class DiaryDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String USERNAME = "scott";
	private final String PASSWORD = "tiger";

	private static DiaryDAO instance;

	private DiaryDAO() {		
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}

	public DiaryDAO getInstance() {
		if (instance == null) {
			instance = new DiaryDAO();
		}
		return instance;
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void disConnection() {
		try {
			conn.close();
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// �ű� ���� ���
	// ���� ����
	// 1)������ ���� ������
	// 2)��������
	// ���� ����
	// ���� ��� ���
	//
}
