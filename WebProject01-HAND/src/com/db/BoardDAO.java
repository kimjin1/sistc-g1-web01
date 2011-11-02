package com.db;

import java.util.*;
import java.sql.*;

import org.apache.catalina.Session;

public class BoardDAO {

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
	private static BoardDAO dao;

	// ���
	// ����̹� ��� (����Ŭ���� ������ Ŭ������ ���ؼ� ������ �� �ְ� ����� �ش�)
	public BoardDAO() {
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
	
	   //�Խù� ��ü ���
	   public ArrayList<BoardVO> getBoardData(int page)
	   {
		   ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		   try
		   {
			   //����
			   getConnection();
			   //��������
			   String sql="select no,name,subject,email,regdate,readnum,grouplevel from p_board order by no desc";
			   //��������=����� : ����Ŭ���� ������ 10����(PL/SQL)
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   
			   //�������� ���
			   int pagestart=(page*10)-10;//������
			   int i=0;//10�� �����ִ� ���� 
			   int j=0;//while�� Ƚ�� 
			   while(rs.next())
			   {
				   if(i<10 && j>=pagestart)
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
					   
					   list.add(vo);
					   
					   i++;
				   }
				   j++;
			   }
			  
			   //������� ArrayList��Ƶд�
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   
		   return list;
	   }
	   
	 //�������� ���ϱ�
	   public int getTotalPage()
	   {
		   int total=0;
		   try
		   {
			   getConnection();
			   String sql="select count(*) from p_board";
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
	   //���뺸��
	   public BoardVO getContent(int no)
	   {
		   BoardVO vo=new BoardVO();
		   try
		   {
			   //����
			   getConnection();
			   //�������� ����
			   //��ȸ�� ����
			   String sql="update p_board set "
					   +"readnum=readnum+1 where no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1,no);
			   ps.executeUpdate();
			   ps.close();
			   
			   sql="select subject,name,regdate,readnum,content,id from p_board where no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   //����
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   //BoardVO�� �� �Է�
			   vo.setNo(no);
			   vo.setSubject(rs.getString(1));
			   vo.setName(rs.getString(2));
			   vo.setRegdate(rs.getDate(3));
			   vo.setReadnum(rs.getInt(4));
			   vo.setContent(rs.getString(5));
			   vo.setId(rs.getString(6));
			   
			   rs.close();
			   
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			  disConnection();  
		   }
		   return vo;
	   }
	   public int getFindCount(String fs,String ss)
	   {
		   int count=0;
		   
		   try
		   {
			  //����
			  getConnection();
			  //�������� where name like '%?%'
			  String sql="select count(*) from p_board "
					 +"where "+fs+" like '%'||?||'%'";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1,ss);
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
	   //ã��
	   public ArrayList<BoardVO> getFindData(String fs,String ss)
	   {
		   ArrayList<BoardVO> list=
				      new ArrayList<BoardVO>();
		   try
		   {
			  //����
			  getConnection();
			  //�������� where name like '%?%'
			  String sql="select no,subject,name,"
					 +"regdate,readnum,homepage,content from p_board "
					 +"where "+fs+" like '%'||?||'%'";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1,ss);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				   BoardVO vo=new BoardVO();
				   vo.setNo(rs.getInt(1));
				   vo.setSubject(rs.getString(2));
				   vo.setName(rs.getString(3));
				   vo.setRegdate(rs.getDate(4));
				   vo.setReadnum(rs.getInt(5));
				   vo.setHomepage(rs.getString(6));
				   vo.setContent(rs.getString(7));
				   list.add(vo); 
			  }
			  rs.close();
		   }catch(Exception ex)
		   {
			  System.out.println(ex.getMessage());
		   }
		   finally
		   {
			  disConnection();
		   }
		   return list;
	   }
	  
	   //�� ���
	   public void insert(BoardVO vo)
	   {
		   try
		   {
			   //����
			   getConnection();
			   //�׷��ȣ�� ����� �ش�
			   String sql="select max(groupid) from p_board";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int gid=rs.getInt(1);
			   rs.close();
			   //�߰�
			   sql="insert into p_board values(p_board_no_seq.nextVal,?,?,?,?,?,?,SYSDATE,?,0,0,0,0,0)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1,vo.getName());
			   ps.setString(2,vo.getEmail());
			   ps.setString(3,vo.getHomepage());
			   ps.setString(4,vo.getSubject());
			   ps.setString(5,vo.getContent());
			   ps.setString(6,vo.getId());
			 
			   ps.setInt(7,gid+1);
			   
			   ps.executeUpdate();
			   
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
	   }
	   
	   
	   
	   //�Խ��� ��ȣ ������ ���
	   public int getBoardCount()
	   {
		   int count=0;
		   try
		   {
			   getConnection();
			   String sql="select count(*) from p_board";
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
	   
	 //�� ���� data
	   public BoardVO getUpdateData( int no)
	   {
		   BoardVO vo=new BoardVO();
		   try
		   {
			  getConnection();
			  String sql="select name,nvl(email,' '),nvl(homepage,' '),subject,content from p_board where no=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, no);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  vo.setName(rs.getString(1));
			  vo.setEmail(rs.getString(2));
			  vo.setHomepage(rs.getString(3));
			  vo.setSubject(rs.getString(4));
			  vo.setContent(rs.getString(5));
			  rs.close();
			  
		   }catch(Exception ex)
		   {
			  System.out.println(ex.getMessage());   
		   }
		   finally
		   {
			  disConnection();
		   }
		   return vo;
	   }
	   
	   //���� ����
	   public boolean update(BoardVO vo,String pw)
	   {
		  boolean bCheck=false;
		   try
		   {
			 
			  getConnection();
			  String sql="select pw from p_person "
					  +"where id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, vo.getId());
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  String db_pw=rs.getString(1);
			  rs.close();
			  if(db_pw.equals(pw))
			  {
				  bCheck=true;
				 
			 
			 
				 sql="update p_board set "
					+"name=?,email=?,homepage=?,"
				    +"subject=?,content=?,"
					+"regdate=sysdate "
				    +"where no=?";
				 ps=conn.prepareStatement(sql);
				 ps.setString(1, vo.getName());
				 ps.setString(2, vo.getEmail());
				 ps.setString(3, vo.getHomepage());
				 ps.setString(4, vo.getSubject());
				 ps.setString(5, vo.getContent());
				 ps.setInt(6,vo.getNo());
				 ps.executeUpdate();
			  }
			  else{
				  bCheck=false;
			  }
			  
		   }catch(Exception ex)
		   {
			  System.out.println(ex.getMessage());
		   }
		   finally
		   {
			  disConnection(); 
		   }
		   return bCheck;
	   }
	   //�� ����
	   public boolean delete(BoardVO vo,String pw)
	   {
		   boolean bCheck=false;
		   try
		   {
			  
			   getConnection();
				  String sql="select pw from p_person "
						  +"where id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1, vo.getId());
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  String db_pw=rs.getString(1);
				  rs.close();
				  ps.close();
				  if(db_pw.equals(pw))
				  {
					  bCheck=true;
				  sql="delete from p_board where no=?";
				  ps=conn.prepareStatement(sql);
				  ps.setInt(1, vo.getNo());
				  ps.executeUpdate();	
				  ps.close();
			   }
			   else
			   {
				   bCheck=false;
			   }
		   }catch(Exception ex)
		   {
			  System.out.println(ex.getMessage());
		   }
		   finally
		   {
			  disConnection();
		   }
		   return bCheck;
	   }
	  
	   
	  
	// ���� ��ȣ �Ʒ��� ��ȣ
		public int[] getMaxMin(int no){
			int[] maxmin = new int[2];
			try {
				getConnection();
				String sql = "select min(no) from p_board where no>?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				ResultSet rs = ps.executeQuery();
				rs.next();
				maxmin[0] = rs.getInt(1);
				rs.close();
				
				
				sql = "select max(no) from p_board where no<?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				rs = ps.executeQuery();
				rs.next();
				maxmin[1] = rs.getInt(1);
				rs.close();
				
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				disConnection();
			}
			return maxmin;
		}
		
		public boolean isPwCheck(String id,String pw)
		   {
			   boolean bCheck=false;
			   try
			   {
				  getConnection();
				  String sql="select pw from p_person "
						  +"where id=?";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1, id);
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  String db_pw=rs.getString(1);
				  rs.close();
				  
				  if(db_pw.equals(pw))
					  bCheck=true;
				  else
					  bCheck=false;
				  
			   }catch(Exception ex)
			   {
				  System.out.println(ex.getMessage()); 
			   }
			   finally
			   {
				  disConnection();  
			   }
			   return bCheck;
		   }
		// ���� �ִ��ȣ �ּ� ��ȣ
		public int[] getMaxnum(){
			int[] count = new int[2];;
			
			try {
				getConnection();
				String sql = "select min(no) from p_board";
				ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				count[0] = rs.getInt(1);
				rs.close();
				
				
				sql = "select max(no) from p_board";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				rs.next();
				count[1] = rs.getInt(1);
				rs.close();
				
			} catch (Exception ex) {
				System.out.println(ex.getMessage());	
			} finally {
				disConnection();
			}
			
			return count;
		}
		
		
		
		// ���� ����
		public String maxSubject(int no){
			
			String maxSubject="";
			try {
				
				getConnection();
				
				String sql = "select subject from p_board where no=?";
				
				ps=conn.prepareStatement(sql);
				 ps.setInt(1, no);
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  maxSubject=rs.getString(1);
				  rs.close();
				
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();
			}
			return maxSubject;
		}
		
		//�Ʒ��� ����
		
	public String minSubject(int no){
			
			String minSubject="";
			try {
				
				getConnection();
				
				String sql = "select subject from p_board where no=?";
				
				ps=conn.prepareStatement(sql);
				 ps.setInt(1, no);
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  minSubject=rs.getString(1);
				  rs.close();
				
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			} finally {
				disConnection();
			}
			return minSubject;
		}

	
}
