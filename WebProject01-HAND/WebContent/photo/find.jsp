<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*,java.util.*"%>
    
    <%
    int curpage=1;
   request.setCharacterEncoding("EUC-KR");
   String fs=request.getParameter("fs");
   String ss=request.getParameter("ss");
   String strPage=request.getParameter("page");
	String id=(String)session.getAttribute("id"); 
   
   PhotoDAO dao=new PhotoDAO();
   int count=dao.getFindCount(fs, ss); 
   ArrayList<PhotoVO> list=null;
   
   if(count!=0)
   {
	   list=new ArrayList<PhotoVO>();
	   list=dao.getFindData(fs, ss);
   }
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 th{font-family: 휴먼매직체; font-size:14pt; color:white}
 td{font-family: 휴먼매직체; font-size:12pt;}

  a{text-decoration: none;color:black}
 a:hover{text-decoration: underline;color:green}
</style>
<script type="text/javascript">
var click=0; 
function open(id)
{
	var p=document.getElementById(id);
	if(click==0)
	{
		p.style.display='';
		click=1;
	}
	else
	{
		p.style.display='none';
		click=0;
	}
}
function content(no,page){
	var id = "<%=id%>";		 
	if(id=="null"){
		alert("로그인 하세요");
		return;		      
	}   else{
		//성공했을때위치이동
		  self.location.href="content.jsp?no="+no+"&page="+page;
	}    				
}
</script>
</head>
<body>
	<center>
    <p>
    <p>
    <p>
    <table border=0 width=550>
     <tr>
      <td align=left>
       <a href="javascript:history.back()">
      
       </a>
      </td>
     </tr>
    </table>
    <%
       if(count==0)
       {
    %>
          <table border=0 width=550>
           <tr>
            <td><font color=red><h2>검색결과가 없습니다</h2></font>
           </tr>
          </table>
           <% 
       }
       else
       {
    %>
    <table border=0width=550>
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

		<td width=200 height=150><a href="javascript:content(<%=vo.getNo()%>, <%=curpage%>)">
				<img src="../photo/upload/<%=vo.getFilename()+"_tn.jpg"%>" border=0>
		</a></td>
	</tr>
	<tr>
		<td width=100 height=20><%=vo.getContent() %></td>
	</tr>
	
	
	</table>
	</td>		
	<%
	i++;
	}
	%>	
	</tr>
	</table>
	
	
	<table width=450 border=0>
	<tr>
	
	

	<td align =right >
       <input type = button value=뒤로 onclick="javascript:history.back()">
       </td>
      
	
	
       </tr>
           <tr  >
       <td align=center colspan=2>
       
      
       
     
         
         <%
       }
         %>
       
       
       </tr>
	</table>
	
	
</center>
</body>
</html>
          