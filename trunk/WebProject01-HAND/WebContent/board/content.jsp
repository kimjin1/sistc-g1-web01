<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<%	
	int flag=(Integer.parseInt((String)session.getAttribute("flag")));
	
	String id=(String)session.getAttribute("id");
   //�Խù� ��ȣ
   String strNo=request.getParameter("no");
	int curNo = Integer.parseInt(strNo);
	//System.out.println(curNo);
   //���� ���� �ִ� ������
   String strPage=request.getParameter("page");
   
   BoardVO vo=
		  dao.getContent(Integer.parseInt(strNo));
 //�������۰� ó������ ��츦 ó���ϱ� ���� �ִ� �۹�ȣ�� �ּ� �۹�ȣ�� �߰��� ���´�
 	int maxmin[] = dao.getMaxMin(Integer.parseInt(strNo));	
 	int maxNo = maxmin[0]; 
 	int minNo = maxmin[1];
 	
 // �Խ��� ����� �ְ�� ���� ��ȣ �ְ� ���� ��ȣ ��������
	int countMaxMin[] = dao.getMaxnum();
 	int min = countMaxMin[0];
 	int max = countMaxMin[1];
 	
 	String maxSubject = dao.maxSubject(maxNo);
 	String minSubject = dao.minSubject(minNo);
 	String jsp="../common/reply.jsp?flag="+flag+"&rootno="+curNo; 	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	a{
		text-decoration:none;
		color:black;
	}
	a:hover{
		text-decoration:underline;
		color:orange;
	}	
</style>
<script type="text/javascript">
function Login(no,page,type){
	var id = "<%=id%>";		
	if(id=="null"){
		alert("�α��� �ϼ���");
		return;
		      
	}   else{
		//������������ġ�̵�
		  self.location.href="../board/board.jsp?type="+type+"&no="+no+"&page="+page;
	}    		
	
	
}
</script>
</head>
<body>
<center>


	<table border=0 width="600" >
	
     <tr>
     <td width=20%></td>
	<td width=80% align=left>

     <%
			//������ �����Ѵٸ�  ���
			if(Integer.parseInt(strNo) < max){
	%>
     <img src="../image/board/prev1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=maxNo%>&page=<%=strPage%>">
     <%=maxSubject%>
	</a>
	<%		
			}else{
	%>		
			<img src="../image/board/prev1.jpg" border=0>
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
		if(Integer.parseInt(strNo) > min){
	%>
     <img src="../image/board/next1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=minNo%>&page=<%=strPage%>">
		<%=minSubject%>		
	 </a> 
	<%
			}else{
	%>	
		<img src="../image/board/next1.jpg" border=0>
		ó���� �Դϴ�		
	<%
	  		}
	%>			 
		</td>
	</tr>			
     
     </table>
     
	<table width=600 border=0 bordercolor=cccccc>
	
	
      <tr >
        <td width=15% bgcolor=cccccc height=25>����</td>
            <td align=left colspan=3><%=vo.getSubject() %></td>
            <td align=right colspan=2 >	
           
            <a href="javascript:Login(<%=strNo%>,<%=strPage%>,4)">
   			<img src="../image/board/update.jpg" border=0>
   			</a>
   			<a href="javascript:Login(<%=strNo%>,<%=strPage%>,5)">
   			<img src="../image/board/delete.jpg" border=0>
   			</a>
   			<a href="javascript:Login(<%=strNo%>,<%=strPage%>,2)">
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
     <table border="0">
     <tr>      
		<td width="200"valign="top">
         <% System.out.println(flag+":"+curNo);%>
		<jsp:include page="<%=jsp %>"/>
        </td>
      </tr>
     </table>
        

  
</center>
</body>
</html>