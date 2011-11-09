<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*,java.net.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
    String fn=request.getParameter("fn");

    
    response.setHeader("Content-Disposition",
    		"attachment;filename="
            +URLEncoder.encode(fn, "UTF-8"));
    //파일에 쓰기
    String path="c:\\upload";
    try
    { 
    	//파일을 정보를 얻어 온다 File
    	File f=new File(path+"\\"+fn);
    	//파일 읽기 FileInputStream
    	FileInputStream fis=new FileInputStream(f);
    	//byte스트림 ==> 문자스트림으로 전환 
        BufferedInputStream bis=
             new BufferedInputStream(fis);
    	//읽어온 byte를 저장 
    	int i=0;
    	//f.length():실제 읽어야 되는 파일의 크기
    	byte buffer[]=new byte[(int)f.length()];
    	int j=0;
    	//-1은 EOF(파일의 끝)
    	/*
    	    int a=read() : char를 한개 읽어온것
    	    int a=read(byte array,offset,max)
    	    ==>읽은 byte의 크기
    	*/
    	while((i=bis.read())!=-1)
    	{
    		buffer[j]=(byte)i;
    		j++;
    	}
    	//버퍼의 내용을 한번 지워준다 out.clear()
    	out.clear();
    	//새로운 버퍼의 정보 수집 pushBody
    	out=pageContext.pushBody();
    	
    	//읽은 파일 쓰기 시작 FileOutputStream
    	BufferedOutputStream bos=
    	   new BufferedOutputStream(
    			   response.getOutputStream());
    	bos.write(buffer);
    	
    	bis.close();
    	bos.close();
    }catch(Exception ex){}
    /*
    String path="c:\\upload";
    try
    {
    	File f=new File(path+"\\"+fn);
    	FileInputStream fis=
    			 new FileInputStream(f);
    	BufferedInputStream bis=
    			 new BufferedInputStream(fis);
    	BufferedOutputStream bos=
    			new BufferedOutputStream(
    					response.getOutputStream());
    	int i=0;
    	byte b[]=new byte[1024];
    	
    	while((i=bis.read(b, 0, 1024))!=-1)
    	{
    		bos.write(b,0,i);
    	}
    	bis.close();
    	bos.close();
    }catch(Exception ex){}
    */
%>






