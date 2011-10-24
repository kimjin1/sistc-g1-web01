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
	
	// 신규 일정 등록
	// 일정 수정
	// 1)수정할 정보 얻어오기
	// 2)실제수정
	// 일정 삭제
	// 일정 목록 출력
	//
}
