<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.db.*,java.text.*"%> 
 <%!
     int totalpage=0;//��������(DB)
     int curpage=1;//����(���÷� ����)
     
     int back;//������
     int forward;//������
%> 
<jsp:useBean id="dao" class="com.db.PhotoDAO"/>
<%
	request.setCharacterEncoding("euc-kr");
	String id=(String)session.getAttribute("id"); 
	String strPage=request.getParameter("page");
	String strNo=request.getParameter("no"); 
	
	if(strPage==null)
		strPage="1"; 
	curpage=Integer.parseInt(strPage);
	ArrayList<PhotoVO> list=dao.getPhotoData(curpage);  
	totalpage=dao.getTotalPage(); 
	int count=dao.getPhotoCount();
	count=count-((curpage*10)-10); 
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<style type="text/css">
 th{font-family: �޸ո���ü; font-size:14pt; color:white}
 td{font-family: �޸ո���ü; font-size:12pt;}

  a{text-decoration: none;color:black}
 a:hover{text-decoration: underline;color:green}
</style>
<link rel="stylesheet" type="text/css" href="../shadowbox/shadowbox.css">
<script type="text/javascript" src="../shadowbox/shadowbox.js"></script>	
<script type="text/javascript">Shadowbox.init();</script>
<script type="text/javascript">
function find()
{
	var f=document.frm;
	if(f.ss.value=="")
    {
		alert("�˻�� �Է��ϼ���");
		f.ss.focus();
		return;
    }
	f.submit();
}
function Login(no,page){
	var id = "<%=id%>";		
	if(id=="null"){
		alert("�α��� �ϼ���");
		return;
		      
	}   else{
		//������������ġ�̵�
		  self.location.href="photo_write.jsp?no="+no+"&page="+page;
	}    				
}
function content(no,page){
	var id = "<%=id%>";		
	if(id=="null"){
		alert("�α��� �ϼ���");
		return;		      
	}   else{
		//������������ġ�̵�
		  self.location.href="content.jsp?no="+no+"&page="+page;
	}    				
}
function openPhoto(no){	
	
}
</script>
<style type="text/css">
	table {
		table-layout: fixed;
	}	
</style>

</head>
<body>
<center>	
		<form method=post name=frm action="find.jsp">
	<table border=0 	width=550 height=200 background="">
	<tr>		
	<%
	int i = 0;
	 for(PhotoVO vo:list){
	%>
	<%
	if(i%3==0 && i!=0){		
	%>
		</tr><tr>	
	<%
	}
	%>						
	<td>
	<table width=100% border=0>
	<tr>
		<td width=100 height=80>
		<%--
		<a href="content.jsp?no=<%=vo.getNo()%>&page=<%=curpage%>">
		 --%>
		 <a href="javascript:content(<%=vo.getNo()%>, <%=curpage%>)">
				<img src="../photo/upload/<%=vo.getFilename()+"_tn.jpg"%>" border=0>
		</a></td>
	</tr>
	<tr>
		<%
			String content = vo.getContent();
			if(content.length()>=8){
				content = content.substring(0, 8);
				content=content+"...";
			}
		%>
		<td width=100 height=10><%=content %></td>		
		
	</tr>
	</table>
	</td>		
	<%
	i++;
	}
	%>	
	</tr>
	</table>
	

	<table width=550 height=40>
	<tr>
	<td colspan=2>
	<hr>
	</td>
	</tr>
	
       
           <tr>
       <td align=center colspan=2>
       
        <%
            if(curpage>1)
            {
            	back=curpage-1;
         %>
       <a href="photo.jsp?page=<%=back%>">
     <img src="../image/board/prev.jpg" border=0>
    	</a>
    	<%
            }
         %>
       
     
         
         <%
            for(int j=1;j<=totalpage;j++)
            {
         %>
               [<a href="photo.jsp?page=<%=j%>"><%=j %></a>]
         <%
            }
         %>
         <%
             if(curpage<totalpage) 
             {
            	 forward=curpage+1;
         %>
      	<a href="photo.jsp?page=<%=forward %>">
         <img src="../image/board/next.jpg" border=0></a>
         <%
             }
         %>
      
         &nbsp;&nbsp;&nbsp;
  <%=curpage %> page / <%=totalpage %> pages
       
       </td>
       </tr>
       <tr>
	<td align=left>
	<a href="javascript:Login(<%=strNo%>,<%=strPage%>)">
         <img src="../image/board/write.jpg" border=0>
         </a>
	</td>
	
	 <td align=right>
        <select name=fs>
         <option value=content>����</option>
         <%--<option value=name>�ۼ���</option> --%>
        
        </select>
        <input type=text name=ss size=10>
        <input type=hidden name=page value=<%=curpage %>>
        <input type=hidden name=no value=<%=strNo %>>
       <input type=button value=�˻� onclick=find()>
       </td>
       </tr>
	</table>
	</form>
	
</center>
</body>
</html>