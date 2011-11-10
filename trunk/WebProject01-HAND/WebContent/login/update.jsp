<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*, com.diary.*"%>
<%
	String id = (String)session.getAttribute("id");

	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.getMemberData(id);
	
	DiaryCalendar dc = DiaryCalendar.getInstance();
	String ymd[] = dc.dateToValue(vo.getBirth());
	String strYear = ymd[0];
	String strMonth = ymd[1];
	String strDay = ymd[2];
	int bYear = Integer.parseInt(strYear);
	int bMonth = Integer.parseInt(strMonth);
	int bDay = Integer.parseInt(strDay);
%>    
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
function pwdCheck(){
	var f = document.frm;		
	if(f.pw.value==f.pw2.value){
		f.pwdchk.style.color="blue";
		f.pwdchk.value="※비밀번호가 일치합니다";
		f.nickname.focus();
	}else{			
		f.pwdchk.style.color="red";
		f.pwdchk.value="※비밀번호가 일치하지 않습니다";
	}		
}

function update_ok(){
	
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
	
	f.submit();
}

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
<script type="text/javascript">
function delete_ok(){
	
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
		<h3>개인정보 수정</h3>
		<form method=post action="../login/update_ok.jsp" name=frm >
		 <table border=1 bordercolor=black width=600
     cellpadding="0" cellspacing="0">
       <tr>
         <td>
          <table border=0 width=600>
           <tr>
            <td align=right width=20%>ID</td>
            <td align=left width=80%>
              <input type=text size=12 name=id readonly="readonly" value="<%=id%>" onfocus="javascript:document.password.focus()">
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>비밀번호</td>
            <td align=left width=80%>
              <input type=password size=12 name=pw maxlength="10">
              &nbsp;&nbsp;&nbsp;
     			         비밀번호 확인
     		 <input type=password size=12 name=pw2 onkeyup="pwdCheck()" maxlength="10">
     	
     		 
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>이름</td>
            <td align=left width=80%>
              <input type=text size=12 name=name readonly="readonly" value="<%=vo.getName()%>">
              <input type=text size=27 name=pwdchk readonly>
            </td>
           </tr>
           
              
           <tr>
            <td align=right width=20%>생일</td>
            <td align=left width=80%>
             <select name=year disabled="disabled">
             <%
             int year =0;
             for(int i=1900;i<2050; i++){
            	 if(i==bYear){
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
            <select name=month disabled="disabled">
             <%
             int month =0;
             for(int i=01;i<13; i++){
            	 if(i==bMonth){
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
            <select name=day disabled="disabled">
             <%
             int day =0;
             for(int i=1;i<32; i++){
            	 if(i==bDay){
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
              <input type=text size=12 name=nickname value="<%=vo.getNickname()%>" maxlength="15">
              <input type=button value="아바타 선택" onclick="avatar()">
              <input type="hidden" name=path>
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>이메일</td>
            <td align=left width=80%>
             <input type=text size=50 name=email value="<%=vo.getEmail()%>" maxlength="50">
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>홈페이지</td>
            <td align=left width=80%>
             <input type=text size=50 name=homepage value="<%=vo.getHomepage()%>" maxlength="50">
            </td>
           </tr>
           
           <tr>
             <td align=right width=20% valign=top>소개</td>
             <td align=left width=80%>
               <textarea rows="12" cols="50" name=memo><%=vo.getMemo()%></textarea>
             </td>
           </tr>
     
           <tr>
             <td align=center colspan=2>
              <input type=button value="수정" onclick="update_ok()" >
              <input type="reset" value="취소" onclick="javascript:history.back()">
              <input type="button" value="회원탈퇴" onclick="delete_ok()">
             </td>
           </tr>
           </table>
          </table> 
          </form>
	</center>
</body>
</html>