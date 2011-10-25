package com.db;

import java.sql.*;
import java.util.ArrayList;

public class DiaryDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@211.238.142.117:1521:ORCL";
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

	public static DiaryDAO getInstance() {
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
	public void insertEvent(DiaryVO dVO){
		try {
			getConnection();
			String sql = "insert into p_diary values(p_diary_no_seq.nextVal, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dVO.getId());
			ps.setString(2, dVO.getSubject());
			ps.setString(3, dVO.getContent());
			ps.setDate(4, (Date) dVO.getEvent_time());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
	}
	
	// ���� ����
	// 1)������ ���� ������ - getEventContent()�̿�
	// 2)��������
	public void updateEvent(DiaryVO dVO){
		try {
			getConnection();
			String sql = "update p_diary set subject=?, content=?, event_time=? where no=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dVO.getSubject());
			ps.setString(2, dVO.getContent());
			ps.setDate(3, (Date) dVO.getEvent_time());
			ps.setInt(4, dVO.getNo());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
	}
	
	// ���� ����
	public void deleteEvent(int no){
		try {
			getConnection();
			String sql = "delete from p_diary where no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
	}
	
	// ���� ��� ���
	public ArrayList<DiaryVO> getEventList(String id, String[] ymd){
		ArrayList<DiaryVO> eventList = new ArrayList<DiaryVO>();
		try {
			getConnection();
			//�ش� ID�� �ش��Ͻ��� �������� ���;� �Ѵ�
			String sql = "select no, id, subject, content, event_time from p_diary where id like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				DiaryVO dVO = new DiaryVO();
				dVO.setNo(rs.getInt(1));
				dVO.setId(rs.getString(2));
				dVO.setSubject(rs.getString(3));
				dVO.setContent(rs.getString(4));
				dVO.setEvent_time(rs.getDate(5));
				eventList.add(dVO);
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		return eventList;
	}
	
	// �����������
	public DiaryVO getEventContent(int no){
		DiaryVO dVO = new DiaryVO();
		try {
			getConnection();
			String sql = "select no, id, subject, content, event_time from p_diary where no=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			dVO.setNo(rs.getInt(1));
			dVO.setId(rs.getString(2));
			dVO.setSubject(rs.getString(3));
			dVO.setContent(rs.getString(4));
			dVO.setEvent_time(rs.getDate(5));
			rs.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		return dVO;
	}
}
