<%@page import="javax.imageio.ImageIO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.*,com.db.*" %>
<%@ page import="java.util.*, java.awt.*, java.awt.image.*, java.io.*" %>
<%
     //String path="c:\\upload";
	 String path = application.getRealPath("/photo/upload");
     int size=1024*1024*100;
     String enctype="euc-kr";
     MultipartRequest mr=
    	new MultipartRequest(request,path,
    			size,enctype,
    			new DefaultFileRenamePolicy());
     //a.jpg , a1.jpg ,a2.jpg
     String id=mr.getParameter("id"); 
  
     String content=mr.getParameter("content");
   
     
     String filename=mr.getFilesystemName("upload"); 
    
     File f=new File(path+"\\"+filename);
     
     PhotoVO vo=new PhotoVO();
     vo.setPath(path+"\\"+filename);
     vo.setId(id);
     vo.setContent(content);	     
   	
     
     if(filename==null)
     {
    	 vo.setFilename("");
    	 vo.setFilesize(0);
    	 vo.setFiletype("");
     }
     // aaa.jpg  3
     else
     {
    	 vo.setFilename(filename);
    	 vo.setFilesize((int)f.length());
    	 vo.setFiletype(filename.substring(
    			 filename.lastIndexOf('.')+1));    	 
     }
     
     //DB연동
     PhotoDAO dao=new PhotoDAO();
     dao.insert(vo);
     
     //썸네일 생성
     int tn_width = 170;
     int tn_height = 100;
     try{
    	 File file = new File(vo.getPath());    	 
    	 String fileName = vo.getPath();
    	 //fileName = fileName.substring(0, fileName.lastIndexOf('.'));
    	
    	 BufferedImage image = ImageIO.read(file);
    	 BufferedImage img = new BufferedImage(tn_width, tn_height, BufferedImage.TYPE_3BYTE_BGR);
    	 Graphics2D g = img.createGraphics();
    	 g.drawImage(image, 0, 0, tn_width, tn_height, null);
    	 File thumb = new File(fileName+"_tn.jpg");
    	 ImageIO.write(img, "jpeg", thumb);
     }catch(Exception e){
    	 System.out.println("making thumbnail:"+e.getMessage());
     }
     
     //중간 이미지 생성 (원본의 50%정도)
     int md_width = 0;
     int md_height = 0;
     try {
    	 File file = new File(vo.getPath());
    	 String fileName = vo.getPath();
    	 //fileName = fileName.substring(0, fileName.lastIndexOf('.'));
    	 BufferedImage image = ImageIO.read(file);
    	 int ori_width = image.getWidth();
    	 int ori_height = image.getHeight();
    	 md_width = (int)ori_width/2;
    	 md_height = (int)ori_height/2;
    	 BufferedImage img = new BufferedImage(md_width, md_height, BufferedImage.TYPE_3BYTE_BGR);
    	 Graphics2D g = img.createGraphics();
    	 g.drawImage(image, 0, 0, md_width, md_height, null);
    	 File middle = new File(fileName+"_md.jpg");
    	 ImageIO.write(img, "jpeg", middle);
     } catch(Exception e){
    	 System.out.println("making middle:"+e.getMessage());
     }
     
     //이동
     response.sendRedirect("photo.jsp");
     
%>









