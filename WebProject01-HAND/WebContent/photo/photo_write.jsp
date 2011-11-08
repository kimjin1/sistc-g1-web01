<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 th{font-family: 휴먼매직체;font-size: 11pt;color:white}
 td{font-family: 휴먼매직체;font-size: 10pt}
 a{text-decoration: none;color:black}
 a:hover{text-decoration: underline;color:green}
</style>
<script type="text/javascript">
function send()
{
	var f=document.frm;
	//전송 (데이터를 action에게 전송)
	f.submit();//<input type=submit>
	//<input type=image>:submit
}
</script>
</head>
<body>
   <center>

    <p>
    <!-- 데이터 전송 -->
    <form method=post action="photo_write_ok.jsp" 
    name=frm enctype="multipart/form-data">
    <table border=0 width=500>
     <tr>
      <td bgcolor=cccccc>
       <p>
        <table border=0 width=500>
         <tr>
          <td align=right width=20%>작성자</td>
          <td align=left width=80%>
           <input type=text name=name size=15 value="<%=session.getAttribute("name")%>">
           <input type="hidden" name=id value="<%=session.getAttribute("id")%>"> 
          </td>
         </tr>
         <tr>
          <td align=right width=20%>이메일</td>
          <td align=left width=80%>
           <input type=text name=email size=25 value="<%=session.getAttribute("email")%>">
           
          </td>
         </tr>
        
         <tr>
          <td align=right width=20% valign=top>내용</td>
          <td align=left width=80%>
           <textarea rows="15" cols="49" name=content></textarea>
          </td>
         </tr>
         <tr>
          <td align=right width=20%>첨부파일</td>
          <td align=left width=80%>
           <input type=file name=upload size=30>
          </td>
         </tr>
        
         <tr>
          <td align=center colspan=2>
           <input type=button value=글쓰기 onclick="send()">
           <input type=button value=취소 
             onclick="javascript:history.back()">
          </td>
         </tr>
        </table>
      </td>
     </tr>
    </table>
    </form>
   </center>
</body>
</html>

