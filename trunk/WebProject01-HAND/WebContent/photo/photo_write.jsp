<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사진 업로드</title>
</head>
<body>
	<center>
		<h3>사진 올리기</h3>
		<table border=0 width=800 bgcolor=#ccccff>
			<tr>
				<td align=right width=20%>제목
				<td align=left width=80%><input type=text size=15>
			</tr>
			<tr>
				<td align=right width=20% valign=top>내용</td>
				<td align=left width=80%><textarea rows="15" cols="49"
						name=content></textarea></td>
			</tr>
			<tr>
				<td align=right width=20%>사진 업로드</td>
				<td align=left width=80%><input type=file name=upload size=30>
				</td>
			</tr>
		
			
         <tr>
    
          <td align=center colspan=2>
           <input type=button value=등록>&nbsp;&nbsp;
           <input type=button value=취소 >
          </td>
         </tr>
		</table>
	</center>

</body>
</html>