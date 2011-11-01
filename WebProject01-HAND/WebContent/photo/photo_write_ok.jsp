<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.io.*,com.db.*" %>
<%
    String path ="c:\\upload"; 
	//String path = application.getRealPath("/photo/upload");
	/*
	참고사이트, 경로구하기랑 썸네일 이미지 만들기
	http://e2xist.tistory.com/233
	*/
	
     int size=1024*1024*100;
     String enctype="euc-kr";
     MultipartRequest mr=
    	new MultipartRequest(request,path,
    			size,enctype,
    			new DefaultFileRenamePolicy());
     //a.jpg , a1.jpg ,a2.jpg
    
     
     String filename=mr.getFilesystemName("upload");
    
     File f=new File(path+"\\"+filename);
     
     PhotoVO vo=new PhotoVO();
     
     
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
     //이동
     response.sendRedirect("photo.jsp");
     
%>









