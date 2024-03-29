<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 가입</title>
<style type="text/css">
 td{font-family: 휴먼매직체;font-size: 10pt}
 h3{font-family: 휴먼매직체;font-size: 15pt}
</style>
<link rel="stylesheet" type="text/css" href="../shadowbox/shadowbox.css">
<script type="text/javascript" src="../shadowbox/shadowbox.js"></script>	
<script type="text/javascript">Shadowbox.init();</script>

<script type="text/javascript">
function login()
{
	var f=document.frm;
	if(f.id.value=="")
	{
		alert("ID를 입력하세요");
		f.id.focus();
		return;
	}
	Shadowbox.open(
	   {
		   content:"../login/idcheck.jsp?id="+f.id.value,
		   player:"iframe",
		   title:"ID중복체크",
		   width:300,
		   height:150
	   }
	);
}
</script>
<script type="text/javascript">
function pwdCheck(){
	var f = document.frm;		
	if(f.pw.value==f.pw2.value){
		f.pwdchk.style.color="blue";
		f.pwdchk.value="※비밀번호가 일치합니다";
		f.name.focus();
	}else{			
		f.pwdchk.style.color="red";
		f.pwdchk.value="※비밀번호가 일치하지 않습니다";
	}		
}
</script>
<script type="text/javascript">
function join_ok(){
	
	var f=document.frm;
	if(f.id.value=="")
	{
		alert("ID를 입력하세요");
		f.id.focus();
		return;
	} 
	if(f.pw.value=="")
	{
		alert("Password를 입력하세요");
		f.pw.focus();
		return;
	}
	if(f.name.value=="")
	{
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	if(f.path.value==""){
		alert("아바타를 선택하세요");
		return;
	}
	
	f.submit();
}
</script>
<script type="text/javascript">
function avatar()
{
	
	Shadowbox.open(
	   {
		   content:"../login/avatarcheck.jsp",
		   player:"iframe",
		   title:"아바타 선택",
		   width:750,
		   height:500,
	   }
	);
} 
</script>
</head>
<body>
	<center>
	<P>
		<h3>회원가입</h3>
		<form method=post action="../login/join_ok.jsp" name=frm >
		 <table border=1 bordercolor=black width=600
     cellpadding="0" cellspacing="0">
       <tr>
         <td>
          <table border=0 width=600>
           <tr>
            <td align=right width=20%>ID</td>
            <td align=left width=80%>
              <input type=text size=12 name=id maxlength=10>
              <input type=button 
              value="중복체크" onclick="login()">
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>비밀번호</td>
            <td align=left width=80%>
              <input type=password size=12 name=pw maxlength=10>
              &nbsp;&nbsp;&nbsp;
     			         비밀번호 확인
     		 <input type=password size=12 name=pw2 onkeyup="pwdCheck()" maxlength=10>
     	
     		 
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>이름</td>
            <td align=left width=80%>
              <input type=text size=12 name=name maxlength=10>
              <input type=text size=27 name=pwdchk readonly>
            </td>
           </tr>
           
              
           <tr>
            <td align=right width=20%>생일</td>
            <td align=left width=80%>
             <select name=year>
             <%
             int year =0;
             for(int i=1900;i<2050; i++){
            	 if(i==year){
            		 %>
            		 <option selected><%=i %></option>
            		 <%
            	 }else{
            		 %>
            		 <option ><%=i %></option>
            		 <%
            	 }
            	 %>
             <%
             }
             %>
          
             </select> 년 
            <select name=month>
             <%
             int month =0;
             for(int i=01;i<13; i++){
            	 if(i==month){
            		 %>
            		 <option selected><%=i %></option>
            		 <%
            	 }else{
            		 %>
            		 <option ><%=i %></option>
            		 <%
            	 }
            	 %>
             <%
             }
             %>
          
             </select> 월
            <select name=day>
             <%
             int day =0;
             for(int i=1;i<32; i++){
            	 if(i==day){
            		 %>
            		 <option selected><%=i %></option>
            		 <%
            	 }else{
            		 %>
            		 <option ><%=i %></option>
            		 <%
            	 }
            	 %>
             <%
             }
             %>
          
             </select> 일
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>별명</td>
            <td align=left width=80%>
              <input type=text size=12 name=nickname maxlength=15>
              <input type=button value="아바타 선택" onclick="avatar()">
              <input type="hidden" name=path>
             
              
            </td>        
           </tr>
           
           <tr>
            <td align=right width=20%>이메일</td>
            <td align=left width=80%>
             <input type=text size=50 name=email maxlength=50>
              <br>이메일 50글자 이하로 작성하세요
            </td>
           </tr>
           
          
           
           <tr>
            <td align=right width=20%>홈페이지</td>
            <td align=left width=80%>
             <input type=text size=50 name=homepage maxlength=50>
            </td>
           </tr>
           
           <tr>
             <td align=right width=20% valign=top>소개</td>
             <td align=left width=80%>
               <textarea rows="12" cols="50" name=memo maxlength=2000></textarea>
             </td>
           </tr>
     
           <tr>
             <td align=center colspan=2>
              <input type=button value="회원가입" onclick="join_ok()" >
              <input type="reset" value="취소" onclick="javascript:history.back()">
             </td>
           </tr>
           </table>
          </table> 
          </form>
	</center>
</body>
</html>