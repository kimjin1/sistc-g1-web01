<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
    <jsp:useBean id="dao" class="com.db.ReplyDAO"/>

<% 
try{
	String strNum[]=request.getParameterValues("delnum");
	
	//삭제
	for(int i=0;i<strNum.length;i++)
	{
		dao.delete(Integer.parseInt(strNum[i]));
	}
	//이동
	response.sendRedirect("../board/board.jsp?type=3");
}catch(Exception ex){
%>
<script type="text/javascript">

	alert("삭제할 대상을 선택");
	history.back();
</script>

<%}%>