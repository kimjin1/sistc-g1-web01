<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<center>
	<table border=0 width=665 height=405 cellspacing="0" scrolling="no">
		<tr>
			<td>
				<div class=show style=text-align:center;width:450>
					<Img id=showimg src="image/bg1.png" border=0></div>
				<div class=show onClick=imgChange()>Click Here</div>
				
				<script>
				img_arr=new Array();
				img_arr[0]="image/bg1.png";
				img_arr[1]="image/bg2.png";
				img_arr[2]="image/bg3.png";
				img_arr[3]="image/bg4.png";
				img_arr[4]="image/bg5.png";
				img_num=0;
				
				function imgChange(){
					img_num++;
					if(img_num>4)img_num=0;
					showimg.src=img_arr[img_num];
					setTimeout(imgChange,3000);
				}
				</script>
			
			</td>			
		</tr>
	</table>
	
</center>

</body>
</html>