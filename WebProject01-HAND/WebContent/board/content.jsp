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
 	String gid = "";
 	String jsp="../common/reply.jsp?flag="+flag+"&rootno="+curNo; 	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../shadowbox/shadowbox.css">
<script type="text/javascript" src="../shadowbox/shadowbox.js"></script>	
<script type="text/javascript">Shadowbox.init();</script>
<style type="text/css">
	th{font-family: �޸ո���ü; font-size:10pt;}
	td{font-family: �޸ո���ü; font-size:10pt;}
	a{
		text-decoration:none;
		color:black;
	}
	a:hover{
		text-decoration:underline;
		color:orange;
	}
	
 table{
  table-layout: fixed;
  word-wrap: break-word;
 }
	
</style>
<script type="text/javascript">
function Login(no,page,type){
	var id = "<%=id%>";
	var gid = document.getElementById("gid").getAttribute("value");	
	if(id=="null"){
		alert("�α��� �ϼ���");
		return;		      
	}   else{
		//������������ġ�̵�
		if(type==4 || type==5){
			if(id != gid){
				alert("���� �۸� ������ �� �ֽ��ϴ�");
				return;
			}else{
				self.location.href="../board/board.jsp?type="+type+"&no="+no+"&page="+page;
			}			
		}else{
			self.location.href="../board/board.jsp?type="+type+"&no="+no+"&page="+page;
		}
	}    	
}
	function info(id){
		Shadowbox.open({		
			content:"../common/userinfo.jsp?id="+id,
			player:"iframe",
			title:"���� ������",
			width:"300",
			height:"100",
	      
		}); 	
		
	}

</script>
</head>
<body>
<center>


	<table border=0 width="600" >
	
     <tr>

	<td  align=left>

     <%
			//������ �����Ѵٸ�  ���
			if(Integer.parseInt(strNo) < max){
				
				 String subject=vo.getSubject();
			 	 if(subject.length()>=30){
			 		subject=subject.substring(0,30);
			 		subject=subject+"...";
			 	 }
				
	%>
     <img src="../image/board/prev1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=maxNo%>&page=<%=strPage%>">
     <%=subject%> 
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
 
	<td align=left>
     <%											
		if(Integer.parseInt(strNo) > min){
			
			 String suject=vo.getSubject();
		 	 if(suject.length()>=30){
		 		suject=suject.substring(0,30);
		 		suject=suject+"...";
		 	 }
			
			
	%>
     <img src="../image/board/next1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=minNo%>&page=<%=strPage%>">
		<%=suject%>		
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
	
	<tr>
        <td width=15% bgcolor=cccccc height=25>����</td>
            <td align=left colspan=2 width="50%"><%=vo.getSubject() %></td>
            <td align=right colspan=4 >	
           
            <a href="javascript:Login(<%=strNo%>,<%=strPage%>,4)">
   			<img src="../image/board/update.jpg" border=0></a>
   			<a href="javascript:Login(<%=strNo%>,<%=strPage%>,5)">
   			<input type="hidden" id="gid" value="<%=vo.getId()%>">
   			<img src="../image/board/delete.jpg" border=0></a>
   			<a href="javascript:Login(<%=strNo%>,<%=strPage%>,2)">
   			<input type="hidden" id="gid" value="<%=vo.getId()%>">
 			<img src="../image/board/write.jpg" border=0></a>
 			<a href="board.jsp?type=1&page=<%=strPage%>">
			<img src="../image/board/main.jpg" border=0></a>	 
            </td>  
      </tr>
      
      
      <tr >
        <td width=10% bgcolor=cccccc height=25>�۾���</td>
        <td width=15%>
            <a href="javascript:info('<%=vo.getId()%>')">
	            <%=vo.getName() %></a>
	            </td>
        <td width=10% bgcolor=cccccc>�ۼ���</td>
        <td width=35%><%=vo.getRegdate().toString() %></td>
        <td width=15% bgcolor=cccccc>��ȸ��</td>
        <td width=15%><%=vo.getReadnum() %></td>
      </tr>
      <%
      String Content=vo.getContent();
 	 if(Content.length()>=1950){
 		Content=Content.substring(0,1950);
 		Content=Content+"!!!!!!!!!!!!!!The End...";
 	 }
      %>
        <tr>
        <td align=left colspan=6 valign=top height=200>
         <pre><%=Content %></pre>
        </td>
      </tr>
      
     </table>
     <table border="0" bgcolor="cccccc">
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