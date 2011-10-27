<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int c_home=1;
	int c_photo=1;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table width=824>
			<th align=left bgcolor=#ededed><h2><b>&nbsp;&nbsp;환경설정</b></h2></th>
		</table>
	
		<!--메뉴 보기 방법 디자인  -->
		<table width=824>
			<tr>
				<td width=20% align=left>&nbsp;메뉴 보기 선택</td>
				<td width=80% align=left>
				<input type=checkbox name=home checked disabled>HOME&nbsp;
				<input type=checkbox name=photo>PHOTO&nbsp;
				<input type=checkbox name=file>FILE&nbsp;
				<input type=checkbox name=board>BOARD&nbsp;
				<input type=checkbox name=visitor>VISITOR&nbsp;
				<input type=checkbox name=diary>DIARY&nbsp;
				<input type=checkbox name=menual>MENUAL&nbsp;
				</td>
			</tr>
			<tr>
				<td width=20%>&nbsp;</td>
				<td width=80% align=left>
				<font color=red><em>*보이고자 하는 메뉴 화면을 설정 합니다.</em></font>		
				</td>
			</tr>
		</table>
		
		<!--날씨 위젯 지역 정보 표시 -->
		<table width=824>
			<tr>
				<td width=20% align=left>&nbsp;날씨 도시 선택</td>
				<td width=80% align=left>&nbsp;도시정보
					<select id=city>
						<option value="">광주</option>
						<option value="">거제</option>
						<option value="">경주</option>
						<option value="">구미</option>
						<option value="">군산</option>
						<option value="">김해</option>
						<option value="">남원</option>
						<option value="">당진</option>
						<option value="">대구</option>
						<option value="">대전</option>
						<option value="">마산</option>
						<option value="">문경</option>
						<option value="">부산</option>
						<option value="">부천</option>
						<option value="">상주</option>
						<option value="">서울</option>
						<option value="">속초</option>
						<option value="">수원</option>
						<option value="">안산</option>
						<option value="">안양</option>
						<option value="">양산</option>
						<option value="">오산</option>
						<option value="">완도</option>
						<option value="">용인</option>
						<option value="">울산</option>
						<option value="">원주</option>
						<option value="">익산</option>
						<option value="">인천</option>
						<option value="">전주</option>
						<option value="">제주</option>
						<option value="">진주</option>
						<option value="">창원</option>
						<option value="">천안</option>
						<option value="">청주</option>
						<option value="">춘천</option>
						<option value="">태안</option>
						<option value="">파주</option>
						<option value="">평택</option>
						<option value="">포항</option>
					</select>
					&nbsp;&nbsp;
					색상정보&nbsp;
					<select id=color>
						<option value="">Aquamarine</option>
						<option value="">Black</option>
						<option value="">Brown</option>
						<option value="">Hotpink</option>
						<option value="">Huntergreen</option>
						<option value="">Gray</option>
						<option value="">Orchid</option>
						<option value="">Peacock</option>
						<option value="">Redwine</option>
						<option value="">Turquoise</option>
					</select>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>