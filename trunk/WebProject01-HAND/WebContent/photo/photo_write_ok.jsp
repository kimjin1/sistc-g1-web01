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
    	 System.out.println(vo.getFiletype());
     }
     
     //DB연동
     PhotoDAO dao=new PhotoDAO();
     dao.insert(vo);
     
     //썸네일 생성
     int width = 100;
     int height = 100;
     try{
    	 File file = new File(vo.getPath());
    	 BufferedImage image = ImageIO.read(file);
    	 BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
    	 Graphics2D g = img.createGraphics();
    	 g.drawImage(image, 0, 0, width, height, null);
    	 File thumb = new File(vo.getPath()+"_tn");
    	 ImageIO.write(img, "jpeg", thumb);
     }catch(Exception e){
    	 System.out.println("making thumbnail:"+e.getMessage());
     }
     
     //이동
     response.sendRedirect("photo.jsp");
     
%>









