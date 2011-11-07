package com.db;

import java.sql.*;
import java.util.*;
import com.db.*;

public class HomeDAO {

	private Connection conn;
	private PreparedStatement ps;

	//객체를 한번 생성
	//오라클 연결
	private final String URL="jdbc:oracle:thin:@211.238.142.118:1521:ORCL";
	private final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private final String USERNAME="scott";
	private final String PWD="tiger";
	
	public HomeVO vo(String id){
		
			HomeVO vo=new HomeVO();
		try 
		{
			getConnection();
			String sql="select nickname, memo, photo from p_person where id=?";
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
}
