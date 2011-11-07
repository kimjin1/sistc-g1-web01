<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
				<script>
				var r= Math.floor(Math.random()*4)+1;
				
				img_array = new Array();
				img_array[0]="image/bg1.png";
				img_array[1]="image/bg2.png";
				img_array[2]="image/bg3.png";
				img_array[3]="image/bg4.png";
				img_array[4]="image/bg5.png";
				 
				</script>
</head>
<body>
<center>
	<table border=0 width=665 height=405 cellspacing="0" scrolling="no">
		<tr>
			<td>
				<script>document.write("<img src="+img_array[r]+" border=0 width=550 height=340>");</script>
			</td>			
		</tr>
	</table>
	
</center>

</body>
</html>