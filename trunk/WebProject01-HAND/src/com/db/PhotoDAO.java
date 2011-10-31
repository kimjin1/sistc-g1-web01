package com.db;
import java.sql.*;//Connection,PreparedStatement

import javax.sql.*;//DataSource(DB��������)
import javax.naming.*;//Context

import java.util.*;

public class PhotoDAO {
	
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
		   public ArrayList<PhotoVO> getPhotoData(int page)
		   {
			   ArrayList<PhotoVO> list=new ArrayList<PhotoVO>();
			   try
			   {
				   //����
				   getConnection();
				   //��������
				   String sql="select * from p_file order by no desc";
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
						   PhotoVO vo=new PhotoVO();
						  
						   vo.setContent(rs.getString(3));
						  vo.setPath(rs.getString(4));
						   vo.setPlag(rs.getInt(5));
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
		   
		   public void insert(PhotoVO vo)
			 {
				 try
				 {
					//����
					getConnection();
					//������
					String sql="select max(no)+1 from "
							+"p_file";
					ps=conn.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					rs.next();
					int no=rs.getInt(1);
					rs.close();
					ps.close();
					//�߰�
					
					
				 }catch(Exception ex)
				 {
					System.out.println(ex.getMessage());
				 }
				 finally
				 {
					disConnection();
				 }
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
		   public PhotoVO getContent(int no)
		   {
			   PhotoVO vo=new PhotoVO();
			   try
			   {
				   //����
				   getConnection();
				   //�������� ����
				   //��ȸ�� ����
				   String sql="update p_file set "
						   +"readnum=readnum+1 where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1,no);
				   ps.executeUpdate();
				   ps.close();
				   
				   sql="select ... from p_file where no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   //����
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   //PhotoVO�� �� �Է�
				  
				   
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
		   //���
		   //����
		   //����
		   
		   
		   
}

