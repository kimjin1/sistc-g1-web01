package com.db;

import java.sql.*;
import java.util.ArrayList;

import com.diary.DiaryCalendar;

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
			System.out.println("DiaryDAO():"+e.getMessage());
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
			System.out.println("getConnection():"+e.getMessage());
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
			System.out.println("disConnection():"+e.getMessage());
		}
	}
	
	// 신규 일정 등록
	public void insertEvent(DiaryVO dVO){
		try {
			//System.out.println(dVO.getId()+":"+dVO.getSubject()+":"+dVO.getContent()+":"+dVO.getEvent_time());
			getConnection();
			String sql = "insert into p_diary values(p_diary_no_seq.nextVal, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dVO.getId());
			ps.setString(2, dVO.getSubject());
			ps.setString(3, dVO.getContent());

			long time = dVO.getEvent_time().getTime();			
			ps.setTimestamp(4, new java.sql.Timestamp(time));
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertEvent():"+e.getMessage());
		} finally {
			disConnection();
		}
	}
	
	// 일정 수정
	// 1)수정할 정보 얻어오기 - getEventContent()이용
	// 2)실제수정
	public void modifyEvent(DiaryVO dVO){
		try {
			getConnection();
			String sql = "update p_diary set subject=?, content=?, event_time=? where no=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dVO.getSubject());
			ps.setString(2, dVO.getContent());			
			long time = dVO.getEvent_time().getTime();			
			ps.setTimestamp(3, new java.sql.Timestamp(time));
			ps.setInt(4, dVO.getNo());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
	}
	
	// 일정 삭제
	public void deleteEvent(int no){
		try {
			getConnection();
			String sql = "delete from p_diary where no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteEvent():"+e.getMessage());
		} finally {
			disConnection();
		}
	}
	// 일괄 삭제
	public void deleteEvent(String strNo[]){		
		try {
			getConnection();
			String sql = "";
			for(int i=0; i<strNo.length; i++){
				int no = Integer.parseInt(strNo[i]);
				sql = "delete from p_diary where no=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				ps.close();
			}

		} catch (SQLException e) {
			System.out.println("deleteEvent([]):"+e.getMessage());
		} finally {
			disConnection();
		}
	}
	
	// 일정 목록 출력
	public ArrayList<DiaryVO> getEventList(String id, String ymd){
		ArrayList<DiaryVO> eventList = new ArrayList<DiaryVO>();
		try {
			//System.out.println(ymd);
			getConnection();
			String sql = "select no, id, subject, content, event_time from p_diary where id like ? and event_time like to_date(?, 'yyyy-MM-dd') order by event_time asc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, ymd);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				DiaryVO dVO = new DiaryVO();
				dVO.setNo(rs.getInt(1));
				dVO.setId(rs.getString(2));
				dVO.setSubject(rs.getString(3));
				dVO.setContent(rs.getString(4));
				long time = rs.getTimestamp(5).getTime();
				//System.out.println(time);
				dVO.setEvent_time(new Date(time));
				//System.out.println(dVO.getEvent_time());
				eventList.add(dVO);
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("getEventList():"+e.getMessage());
		} finally {
			disConnection();
		}
		return eventList;
	}
	
	// 세부일정출력
	public DiaryVO getEventContent(int no){
		DiaryVO dVO = new DiaryVO();
		try {
			getConnection();
			String sql = "select no, id, subject, content, event_time from p_diary where no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			dVO.setNo(rs.getInt(1));
			dVO.setId(rs.getString(2));
			dVO.setSubject(rs.getString(3));
			dVO.setContent(rs.getString(4));			
			//dVO.setEvent_time(rs.getDate(5));
			long time = rs.getTimestamp(5).getTime();
			//System.out.println(time);
			dVO.setEvent_time(new Date(time));
			//System.out.println(dVO.getEvent_time());
			rs.close();
		} catch (SQLException e) {
			System.out.println("getEventContent():"+e.getMessage());
		} finally {
			disConnection();
		}
		return dVO;
	}
	
	// 년월일을 입력받아 해당 날짜의 일정 갯수를 출력한다
	public int getEventCount(String id, String ymd){
		//System.out.println(ymd);
		int count = 0;
		try {
			getConnection();
			String sql = "select count(*) from p_diary where id like ? and event_time like to_date(?, 'yyyy-MM-dd')";			
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, ymd);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			System.out.println("getEventCount():"+e.getMessage());
		} finally {
			disConnection();
		}
		return count;
	}
	
	// 년월을 입력받아 해당월의 각 날짜별 일정 갯수를 배열에 저장해 반환한다
	public int[] getEventCount(String id, String year, String month){
		DiaryCalendar myCalendar = DiaryCalendar.getInstance();
		int endDate = myCalendar.getLastDayOfMonth(Integer.parseInt(year), Integer.parseInt(month));
		int monthlyEvent[] = new int[endDate];
		int count = 0;
		String sql = "";
		try {
			getConnection();
			for(int i=0; i<endDate; i++){
				sql = "select count(*) from p_diary where id like ? and event_time like to_date(?, 'yyyy-MM-dd')";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, year+"-"+month+"-"+(i+1));
				ResultSet rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1);
				if(count != 0){
					monthlyEvent[i] = count;
				}else{
					monthlyEvent[i] = 0;
				}
				rs.close();
				ps.close();
			}
		} catch (Exception e) {
			System.out.println("getEventCount():"+e.getMessage());
		} finally {
			disConnection();
		}		
		return monthlyEvent;
	}
}
