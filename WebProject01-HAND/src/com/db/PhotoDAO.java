package com.db;
import java.sql.*;
import java.util.*;//Connection,PreparedStatement

import javax.sql.*;//DataSource(DB��������)
import javax.naming.*;//Context

import java.util.*;

public class PhotoDAO {
	
	private Connection conn;// ����Ŭ ����
	private PreparedStatement ps;// ����Ŭ�� ���� ���� ����

	// ����Ŭ ���� (����Ŭ�ּ�)
	private final String URL = "jdbc:oracle:thin:@211.238.142.118:1521:ORCL";// ���ڿ�
																				// ���
	private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String USERNAME = "scott";
	private final String PWD = "tiger";
	// TCP�� �̿��ؼ� ���� : ������������ (http:80,telnet:23,ftp:21,smtp:25)

	// ��ü�� �ѹ� ���� (�̱���)
	private static PhotoDAO dao;

	// ���
	// ����̹� ��� (����Ŭ���� ������ Ŭ������ ���ؼ� ������ �� �ְ� ����� �ش�)
	public PhotoDAO() {
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
		
		  //�Խù� ��ü ���
		   public ArrayList<PhotoVO> getPhotoData(String id,int page)
		   {
			   ArrayList<PhotoVO> list=new ArrayList<PhotoVO>();
			   try
			   {
	   
		 if(id!=null){
				   //����
				   getConnection();
				   //��������
				   String sql="select no,id,content,regdate,filename,filesize,filetype,path from p_file where id like ? order by no desc";
				   //��������=����� : ����Ŭ���� ������ 10����(PL/SQL)
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, id);
				   ResultSet rs=ps.executeQuery();
				   
				   //�������� ���
				   int pagestart=(page*6)-6;//������
				   int i=0;//10�� �����ִ� ���� 
				   int j=0;//while�� Ƚ�� 
				   while(rs.next())
				   {
					   if(i<6 && j>=pagestart)
					   {
						   //���� ������ �´� 
						   PhotoVO vo=new PhotoVO();
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
					   j++;
				   }
		 }else{
			   getConnection();
			   //��������
			   String sql="select no,id,content,regdate,filename,filesize,filetype,path from p_file  order by no desc";
			   //��������=����� : ����Ŭ���� ������ 10����(PL/SQL)
			   ps=conn.prepareStatement(sql);
			
			   ResultSet rs=ps.executeQuery();
			   
			   //�������� ���
			   int pagestart=(page*6)-6;//������
			   int i=0;//10�� �����ִ� ���� 
			   int j=0;//while�� Ƚ�� 
			   while(rs.next())
			   {
				   if(i<6 && j>=pagestart)
				   {
					   //���� ������ �´� 
					   PhotoVO vo=new PhotoVO();
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
				   j++;
			   }
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
				   String sql="select count(*) from p_file";
				   ps=conn.prepareStatement(sql);
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   int count=rs.getInt(1);
				   rs.close();
				   
				   total=count/6;//19/10 2
				   if(count%6>0)
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
		   
		  
		   //�Խ��� ��ȣ ������ ���
		   public int getPhotoCount()
		   {
			   int count=0;
			   try
			   {
				   getConnection();
				   String sql="select count(*) from p_file";
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
		   
	
		 //���뺸��
		   public PhotoVO getContent(int no)
		   {
			   PhotoVO vo=new PhotoVO();
			   try
			   {
				   //����
				   getConnection();
				   //�������� ����
				   
				
				  String sql="select id,content,path,filename,filesize,regdate,flag,filetype from p_file where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   //����
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   
				   //PhotoVO�� �� �Է�
				   vo.setId(rs.getString(1));
				  vo.setContent(rs.getString(2));
				   vo.setPath(rs.getString(3));
				  vo.setFilename(rs.getString(4));
				  vo.setFilesize(rs.getInt(5));
				  vo.setRegdate(rs.getDate(6));
				  vo.setFlag(rs.getInt(7));
				  vo.setFiletype(rs.getString(8));
				  vo.setNo(no);
				   
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
		   
		   
		   
		   //ã��
		   public int getFindCount(String fs,String ss)
		   {
			   int count=0;
			   
			   try
			   {
				  //����
				  getConnection();
				  //�������� where name like '%?%'
				  String sql="select count(*) from p_file "
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
		   
		   public ArrayList<PhotoVO> getFindData(String fs,String ss)
		   {
			   ArrayList<PhotoVO> list=
					      new ArrayList<PhotoVO>();
			   try
			   {
				  //����
				  getConnection();
				  //�������� where name like '%?%'
				  String sql="select no,id,content,path,filename,filesize,regdate,flag,filetype from p_file "
						 +"where "+fs+" like '%'||?||'%'";
				  ps=conn.prepareStatement(sql);
				  ps.setString(1,ss);
				  ResultSet rs=ps.executeQuery();
				  while(rs.next())
				  {
					   PhotoVO vo=new PhotoVO();
					   vo.setNo(rs.getInt(1));
					   vo.setId(rs.getString(2));
						  vo.setContent(rs.getString(3));
						   vo.setPath(rs.getString(4));
						  vo.setFilename(rs.getString(5));
						  vo.setFilesize(rs.getInt(6));
						  vo.setRegdate(rs.getDate(7));
						  vo.setFlag(rs.getInt(8));
						  vo.setFiletype(rs.getString(9));
						  
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
		   
		   
		   //���
		   public void insert(PhotoVO vo) 
		   {
			   try
			   {
				   //����
				   getConnection();
		
				 
				   //�߰�
				  String sql="insert into p_file values(p_file_no_seq.nextVal,?,?,?,SYSDATE,?,?,?,1)";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, vo.getId());
				   ps.setString(2, vo.getContent());
				   ps.setString(3, vo.getPath());
				   ps.setString(4, vo.getFilename());
				   ps.setInt(5, vo.getFilesize()); 
				   ps.setString(6, vo.getFiletype());
				   
				 
				  
				   
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
		 

		  
		   //����
		   public boolean delete(PhotoVO vo,String pw)
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
					  sql="delete from p_file where no=?";
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
		  
		   
		   //����
		   
		 //�� ���� data
		   public PhotoVO getUpdateData( int no)
		   {
			   PhotoVO vo=new PhotoVO();
			   try
			   {
				  getConnection();
				  String sql="select id,content from p_file where no=?";
				 
				  ps=conn.prepareStatement(sql);
				  ps.setInt(1, no);
				  ResultSet rs=ps.executeQuery();
				  rs.next();
				  vo.setNo(no);
				  vo.setId(rs.getString(1));
				  vo.setContent(rs.getString(2));
				 
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
		   public boolean update(PhotoVO vo,String pw)
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
					 
					
				 sql="update p_file set content=? where no=?";
					 
					 ps=conn.prepareStatement(sql);
				
					 ps.setString(1, vo.getContent());
					
					 ps.setInt(2,vo.getNo());
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
		   
}


