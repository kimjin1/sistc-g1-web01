<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*,java.net.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
    String fn=request.getParameter("fn");
    System.out.println(fn);
    
    response.setHeader("Content-Disposition",
    		"attachment;filename="
            +URLEncoder.encode(fn, "UTF-8"));
    //���Ͽ� ����
    String path="c:\\upload";
    try
    { 
    	//������ ������ ��� �´� File
    	File f=new File(path+"\\"+fn);
    	//���� �б� FileInputStream
    	FileInputStream fis=new FileInputStream(f);
    	//byte��Ʈ�� ==> ���ڽ�Ʈ������ ��ȯ 
        BufferedInputStream bis=
             new BufferedInputStream(fis);
    	//�о�� byte�� ���� 
    	int i=0;
    	//f.length():���� �о�� �Ǵ� ������ ũ��
    	byte buffer[]=new byte[(int)f.length()];
    	int j=0;
    	//-1�� EOF(������ ��)
    	/*
    	    int a=read() : char�� �Ѱ� �о�°�
    	    int a=read(byte array,offset,max)
    	    ==>���� byte�� ũ��
    	*/
    	while((i=bis.read())!=-1)
    	{
    		buffer[j]=(byte)i;
    		j++;
    	}
    	//������ ������ �ѹ� �����ش� out.clear()
    	out.clear();
    	//���ο� ������ ���� ���� pushBody
    	out=pageContext.pushBody();
    	
    	//���� ���� ���� ���� FileOutputStream
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






