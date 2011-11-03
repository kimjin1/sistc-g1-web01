<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*,java.util.*"%>
    
    <%
   request.setCharacterEncoding("EUC-KR");
   String fs=request.getParameter("fs");
   String ss=request.getParameter("ss");
   String strPage=request.getParameter("page");
   
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
    <table border=1	width=550>
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
	<table width=100% border=1>
	<tr>
		<td width=200 height=150><img src="../photo/upload/<%=vo.getFilename()+"_tn.jpg" %>"></td>
	</tr>
	<tr>
		<td width=100 height=20><a href="content.jsp?no=<%=vo.getNo()%>"><%=vo.getContent() %></a></td>
	</tr>
	
	
	</table>
	</td>		
	<%
	i++;
	}
	%>	
	</tr>
	</table>
	
	
	<table width=550 border=0>
	<tr>
	<td>
	<a href="photo_write.jsp"><img src="../image/board/write.jpg" align=left border=0></a>
	</td>
	
	 <td align=right>
        <select name=fs>
         <option value=name>내용</option>
         
        
        </select>
        <input type=text name=ss size=20>
        
        <input type=button value=찾기 >
       </td>
       </tr>
           <tr  >
       <td align=center colspan=2>
       
      
       
     
         
         <%
       }
         %>
       
       </td>
       </tr>
	</table>
	
	
</center>
</body>
</html>
          