<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.ReplyDAO"/>
<jsp:useBean id="vo" class="com.db.ReplyVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<% 
try{
	String strNum[]=request.getParameterValues("delnum");
	
	//����
	for(int i=0;i<strNum.length;i++)
	{
		dao.delete(Integer.parseInt(strNum[i]));
	}
	//�̵�
	dao.delete(vo.getNo());
	response.sendRedirect("../board/board.jsp?type=3&no="+vo.getNo());
}catch(Exception ex){
%>
<script type="text/javascript">

	alert("������ ����� ����");
	history.back();
</script>

<%}%>