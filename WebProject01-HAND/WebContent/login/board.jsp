<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����</title>
<style type="text/css">
 td{font-family: �޸ո���ü;font-size: 10pt}
 h3{font-family: �޸ո���ü;font-size: 15pt}
</style>
</head>
<body>
	<center>
	<P>
		<h3>ȸ������</h3>
		 <table border=1 bordercolor=black width=600
     cellpadding="0" cellspacing="0">
       <tr>
         <td>
          <table border=0 width=600>
           <tr>
            <td align=right width=20%>ID</td>
            <td align=left width=80%>
              <input type=text size=12 name=id>
              <input type=button 
              value="�ߺ�üũ" onclick="login()">
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>��й�ȣ</td>
            <td align=left width=80%>
              <input type=password size=12 name=pwd>
              &nbsp;&nbsp;&nbsp;
     			         ��й�ȣ Ȯ��
     		 <input type=password size=12 name=pwd2>
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>�̸�</td>
            <td align=left width=80%>
              <input type=text size=12 name=name>
            </td>
           </tr>
           
              
           <tr>
            <td align=right width=20%>����</td>
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
          
             </select> �� 
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
          
             </select> ��
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
          
             </select> ��
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>����</td>
            <td align=left width=80%>
              <input type=text size=12 name=nickname>
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>�̸���</td>
            <td align=left width=80%>
             <input type=text size=50 name=email>
            </td>
           </tr>
           
           <tr>
            <td align=right width=20%>Ȩ������</td>
            <td align=left width=80%>
             <input type=text size=50 name=homepage>
            </td>
           </tr>
           
           <tr>
             <td align=right width=20% valign=top>�Ұ�</td>
             <td align=left width=80%>
               <textarea rows="12" cols="50" name=content></textarea>
             </td>
           </tr>
           
            <tr>
            <td align=right width=20%>������ ����</td>
            <td align=left width=80%>
              <input type=text size=12 name=photo>
            </td>
           </tr>
           
           
           <tr>
             <td align=center colspan=2>
              <input type=submit value="ȸ������">
              <input type="reset" value="���">
             </td>
           </tr>
           
          </table> 
	</center>
</body>
</html>