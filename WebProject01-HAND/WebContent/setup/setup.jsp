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
			<th align=left bgcolor=#ededed><h2><b>&nbsp;&nbsp;ȯ�漳��</b></h2></th>
		</table>
	
		<!--�޴� ���� ��� ������  -->
		<table width=824>
			<tr>
				<td width=20% align=left>&nbsp;�޴� ���� ����</td>
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
				<font color=red><em>*���̰��� �ϴ� �޴� ȭ���� ���� �մϴ�.</em></font>		
				</td>
			</tr>
		</table>
		
		<!--���� ���� ���� ���� ǥ�� -->
		<table width=824>
			<tr>
				<td width=20% align=left>&nbsp;���� ���� ����</td>
				<td width=80% align=left>&nbsp;��������
					<select id=city>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">�뱸</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">�λ�</option>
						<option value="">��õ</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">�Ȼ�</option>
						<option value="">�Ⱦ�</option>
						<option value="">���</option>
						<option value="">����</option>
						<option value="">�ϵ�</option>
						<option value="">����</option>
						<option value="">���</option>
						<option value="">����</option>
						<option value="">�ͻ�</option>
						<option value="">��õ</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">â��</option>
						<option value="">õ��</option>
						<option value="">û��</option>
						<option value="">��õ</option>
						<option value="">�¾�</option>
						<option value="">����</option>
						<option value="">����</option>
						<option value="">����</option>
					</select>
					&nbsp;&nbsp;
					��������&nbsp;
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