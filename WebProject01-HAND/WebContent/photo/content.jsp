<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.PhotoDAO"/>

<%
   //게시물 번호
   	//String id=(String)session.getAttribute("id"); 
   String strNo=request.getParameter("no");
	String strPage = request.getParameter("page");
	String lid = (String)session.getAttribute("id");
   PhotoVO vo= 
		   dao.getContent(Integer.parseInt(strNo));
   String id = vo.getId();
   String name = dao.getName(id);
 
   
 
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
table{
  table-layout: fixed;
  word-wrap: break-word;
 }
 </style>

<script type="text/javascript">
function send(no,page){	
	var id = "<%=lid%>";
	var gid = document.getElementById("gid").getAttribute("value");
	if(id=="null"){
		alert("로그인 하세요");
		return;		      
	}   else{
		if(id != gid){
			alert("본인의 게시물만 변경할 수 있습니다");
			return;
		}else{
		//성공했을때위치이동
		  self.location.href="update.jsp?no="+no+"&page="+page;
		}
	}    		
}

function send2(no,page)
{
	var id = "<%=lid%>";
	var gid = document.getElementById("gid").getAttribute("value");
	if(id != gid){
		alert("본인의 게시물만 변경할 수 있습니다");
		return;
	}else{
	//성공했을때위치이동
	  self.location.href="delete.jsp?no="+no+"&page="+page;
	}
	}
function info(id){
	  Shadowbox.open({  
	   content:"../common/userinfo.jsp?id="+id,
	   player:"iframe",
	   title:"간이 프로필",
	   width:"300",
	   height:"100",
	       
	  });  
	  
	 }

</script>

</head>
<body>
    <center>
    
     <table width=600 border=0 bordercolor=#ccccff>
     
    
      <%
         if(vo.getFilesize()!=0)
         {
      %> 
      <%--<tr height=25>
        <td width=20% bgcolor=#ccccff>첨부파일</td>
        <td align=left colspan=3>
         <a href="../Photo/download.jsp?fn=<%=vo.getFilename()%>">
         <%=vo.getFilename() %>
         </a>
        (<%=vo.getFilesize() %>)Bytes
        </td>
      </tr>--%>
      <%
         }
      %>
      <tr>
      	<td>
      	
      	<%--
     	<a href="../photo/upload/<%=vo.getFilename()%>" target="_blank">
     	 --%>
     	 <a href="../photo/upload/<%=vo.getFilename()%>" target="_blank">
      	<img src="../photo/upload/<%=vo.getFilename()%>_md.jpg" border="0">
      	</a>
      	</td>
      </tr>
      </table>
       <table width=600 border=0 bordercolor=#ccccff>
      <tr>
      <td width=15% bgcolor="cccccc" >작성자
      </td>
      <td width=20%> <a href="javascript:info('<%=vo.getId()%>')">
             <%=name %></a> 
           
      </td>
      <td width=15% bgcolor="cccccc">작성일</td>
      <td width=40%><%=vo.getRegdate() %></td>
      </tr>
      <tr>
      	<td colspan=4  >
      	<hr>
      	</td>
      </tr>
      <tr>
        <td align=left colspan=4 valign=top height=50 >
         <pre> <%=vo.getContent() %></pre>
        </td>
      </tr>
      <tr>
      <td colspan=4>
      <hr>
      </td>
      </tr>
     </table>
     <table border=0 width=600>
      <tr>
       <td align=right>
       <a href = "javascript:send(<%=strNo %>,<%=strPage %>)">
      <img src="../image/board/update.jpg" border=0 ></a>
        <%-- <a href="update.jsp?no=<%=vo.getNo()%>&page=<%=strPage%>">
        <img src="../image/board/update.jpg" border=0 >
        </a> --%>
        <a href="javascript:send2(<%=strNo%>,<%=strPage%>)">
        <input type="hidden" value="<%=vo.getId() %>" id="gid">
        <img src="../image/board/delete.jpg" border=0></a>
        <a href="javascript:history.back()">
        <img src="../image/board/main.jpg" border=0>
        </a>
       </td>
      </tr>
     </table> 
    </center>
</body>
</html>
