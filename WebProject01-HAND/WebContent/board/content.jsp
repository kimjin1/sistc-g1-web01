<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<%
   //�Խù� ��ȣ
   String strNo=request.getParameter("no");
	int curNo = Integer.parseInt(strNo);
   //���� ���� �ִ� ������
   String strPage=request.getParameter("page");
   
   BoardVO vo=
		  dao.getContent(Integer.parseInt(strNo));
 //�������۰� ó������ ��츦 ó���ϱ� ���� �ִ� �۹�ȣ�� �ּ� �۹�ȣ�� �߰��� ���´�
 	int maxmin[] = dao.getMaxMin();	
 	int maxNo = maxmin[0];
 	int minNo = maxmin[1];	
 	//���� �� ��ȣ�� �������� �����۰� �����ۿ� ���õ� ������ ���´�
 	int prevNo = 0;
 	int nextNo = 0;
 	String prevSubject = "";
 	String nextSubject = "";
 	BoardVO prevVO = new BoardVO();
 	BoardVO nextVO = new BoardVO();
 	
 	//����(�۹�ȣ+1)�� ����϶�(GroupLevel�� 0�� �ƴҶ�)
 	//����� �ƴҶ����� �۹�ȣ�� ������Ű�� ã�´�	
 	for(int i=curNo+1; i<=maxNo; i++){				
 		prevVO = dao.getContent(i);
 		System.out.println(i+":"+prevVO.getNo());
 		if(prevVO.getNo() != 0 && prevVO.getGrouplevel()==0){
 			break;
 		}			
 	}		

 	//���� ���������� �Ʒ���(�۹�ȣ-1)�� ����̸� ���ܽ�Ű��
 	//GroupLevel�� 0�϶��� �Ʒ��۷� ǥ���Ѵ�
 	for(int i=curNo-1; i>=minNo; i--){		
 		nextVO = dao.getContent(i);
 		System.out.println(i+":"+nextVO.getNo());
 		if(nextVO.getNo() !=0 && nextVO.getGrouplevel()==0){
 			break;
 		}		
 	}

 	//���۰� �Ʒ����� ��ȣ�� ������ ������ ����
 	//����� ��쿣 ������� �ʴ´�
 	prevNo = prevVO.getNo();
 	nextNo = nextVO.getNo();
 	prevSubject = prevVO.getSubject();
 	nextSubject = nextVO.getSubject();
 	System.out.println(prevNo+":"+nextNo+":"+prevSubject+":"+nextSubject);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<p>
<p>
<p>

	<table border=10 width=800>
	
     <tr>
     <td width=20%></td>
	<td width=80% align=left>

     <%
			//������ �����Ѵٸ�  ���
			if(prevNo != 0){
	%>
     <img src="../image/board/prev1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=prevNo%>&page=<%=strPage%>&maxno=<%=maxNo%>&minno=<%=minNo%>">
     <%=prevSubject%>
	</a>
	<%		
			}else{
	%>	
			������ ���Դϴ�		
	<%
			}
	%>								
	</td>
    
   </tr>
     
     <tr>
     <td width=20%></td>
	<td width=80% align=left>
     <%											
		if(nextNo != 0){
	%>
     <img src="../image/board/next1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=nextNo%>&page=<%=strPage%>&maxno=<%=maxNo%>&minno=<%=minNo%>">
								<%=nextSubject%>		
							</a>
	<%
			}else{
	%>	
		ó���� �Դϴ�		
	<%
	  		}
	%>			 
		</td>
	</tr>			
     
     </table>
     
	<table width=800 border=0 bordercolor=cccccc>
	
	
      <tr >
        <td width=15% bgcolor=cccccc height=25>����</td>
            <td align=left colspan=3><%=vo.getSubject() %></td>
            <td align=right colspan=2 >	
            <a href="board.jsp?type=4&no=<%=strNo%>&page=<%=strPage%>">
   			<img src="../image/board/update.jpg" border=0>
   			</a>
   			<a href="board.jsp?type=5&no=<%=strNo%>&page=<%=strPage%>">
   			<img src="../image/board/delete.jpg" border=0>
   			</a>
   			<a href="board.jsp?type=2&no=<%=strNo%>&page=<%=strPage%>">
 			<img src="../image/board/write.jpg" border=0>
 			</a>
 			<a href="board.jsp?type=1&page=<%=strPage%>">
			<img src="../image/board/main.jpg" border=0>
			</a>	 
            </td>  
      </tr>
      
      
      <tr  >
        <td width=15% bgcolor=cccccc height=25>�۾���</td>
        <td width=20%><%=vo.getName() %></td>
        <td width=15% bgcolor=cccccc>�ۼ���</td>
        <td width=20%><%=vo.getRegdate().toString() %></td>
        <td width=15% bgcolor=cccccc>��ȸ��</td>
        <td width=15%><%=vo.getReadnum() %></td>
      </tr>
        <tr>
        <td align=left colspan=4 valign=top height=200>
         <pre><%=vo.getContent() %></pre>
        </td>
      </tr>
      
     </table>
        <table width=800 border=5 bordercolor=cccccc height=100>
     	<tr >
     	<td width=15% bgcolor=cccccc >��۾���</td>
     	<td align=left colspan=4 valign=top >
         <pre></pre>
        </td>
       
        <td  width=15% align=right>
   
        <input type=button value=��� size=20 >
    
          
        
        
     	</td>
     	</tr>
     	
     
     </table>

  
</center>
</body>
</html>