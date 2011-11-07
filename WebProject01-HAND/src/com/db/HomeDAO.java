package com.db;

import java.sql.*;
import java.util.*;
import com.db.*;

public class HomeDAO {

	private Connection conn;
	private PreparedStatement ps;

	//��ü�� �ѹ� ����
	//����Ŭ ����
	private final String URL="jdbc:oracle:thin:@211.238.142.118:1521:ORCL";
	private final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private final String USERNAME="scott";
	private final String PWD="tiger";
	
	public HomeVO vo(String id){
		
			HomeVO vo=new HomeVO();
		try 
		{
			getConnection();
			String sql="select nickname, photo, memo from p_person where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			
			vo.setNickname(rs.getString(1));
			vo.setMemo(rs.getString(2));
			vo.setPhoto(rs.getString(3));
			rs.close();
			
		}
		catch (Exception ex) 
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			disConnection();
		}
		
		
		return vo;
		
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
}
