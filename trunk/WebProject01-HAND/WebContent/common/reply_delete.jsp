<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.ReplyDAO"/>
<jsp:useBean id="vo" class="com.db.ReplyVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<% 
	String strRootno = request.getParameter("rootno");
	int rootno = Integer.parseInt(strRootno);
try{
	String strNum[]=request.getParameterValues("delnum");
	System.out.println(vo.toString());
	//����
	for(int i=0;i<strNum.length;i++)
	{
		System.out.println(strNum[i]);
		dao.delete(Integer.parseInt(strNum[i]), rootno);
	}
	//�̵�

	response.sendRedirect("../board/board.jsp?type=3&no="+rootno+"&page=1");

}catch(Exception ex){
%>
<script type="text/javascript">

	alert("������ ����� ����");
	history.back();
</script>

<%}%>