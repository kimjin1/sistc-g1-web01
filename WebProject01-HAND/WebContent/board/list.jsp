<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*,java.util.*,java.text.*"%>
 
 
 <%!
     int totalpage=0;//��������(DB)
     int curpage=1;//����(���÷� ����)
     
     int back;//������
     int forward;//������
%> 
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<%
	session.setAttribute("flag", "1");
	String id=(String)session.getAttribute("id");
	String strPage=request.getParameter("page");
	String strNo=request.getParameter("no");
	if(strPage==null)
		strPage="1";
	
	try{
		curpage=Integer.parseInt(strPage);
	}catch(NumberFormatException e){
		curpage=1;
	}
	
	ArrayList<BoardVO> list=dao.getBoardData(curpage);
	totalpage=dao.getTotalPage();
	int count=dao.getBoardCount();
	count=count-((curpage*10)-10);

%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../shadowbox/shadowbox.css">
<script type="text/javascript" src="../shadowbox/shadowbox.js"></script>	
<script type="text/javascript">Shadowbox.init();</script>
<style type="text/css">
	table{
		background-repeat: no-repeat;
	}
	th{font-family: �޸ո���ü; font-size:10pt; color:white}
	td{font-family: �޸ո���ü; font-size:10pt;}
  a{text-decoration: none;color:black}
 a:hover{text-decoration: underline;color:green}
</style>
<script type="text/javascript">
function find()
{
	var f=document.frm;
	if(f.ss.value=="")
    {
		alert("�˻�� �Է��ϼ���");
		f.ss.focus();
		return;
    }
	f.submit();
}
function Login(no,page,type){
	var id = "<%=id%>";		
	if(id=="null"){
		alert("�α��� �ϼ���");
		return;
		      
	}   else{
		//������������ġ�̵�
		  self.location.href="../board/board.jsp?type="+type+"&no="+no+"&page="+page;
	}    		
	
	
}
function info(id){
	Shadowbox.open({		
		content:"../common/userinfo.jsp?id="+id,
		player:"iframe",
		title:"���� ������",
		width:"300",
		height:"100",
      
	}); 	
	
}
</script>
</head>
<body>
<center>
    
    <table border=0 width=600 height=12 cellpadding="3" cellspacing="3" background="../image/board/board_bg.png">
      <tr >
       <th width=10%>��ȣ</th>
       <th width=45%>����</th>
       <th width=15%>�̸�</th>
       <th width=15%>�ۼ���</th>
       <th width=15%>��ȸ��</th>
      </tr>
     <%
         for(BoardVO vo:list)
         {
      %>
      <tr height=25>
	        <td width=10%><%=vo.getNo() %></td>
	        <td width=45% align=left>
	        <%
	        	
	             if(vo.getGrouplevel()==0)//����
	             {
	            	 String Subject=vo.getSubject();
	            	 if(Subject.length()>=15){
	            		 Subject=Subject.substring(0,15);
	            		 Subject=Subject+"...";
	            	 }
	        %>
	               <a href="board.jsp?type=3&no=<%=vo.getNo()%>&page=<%=curpage%>"><%=Subject %></a>
	       
	                
	          <%
	             }
	          %>
	          <%if(vo.getDepth()!=0){ %>
	          <font color="996699">
	          	[<%=vo.getDepth() %>]
	          	</font>
	          	<%} %>
	          	
	          	
            <%
	              Date date=new Date();
	              SimpleDateFormat sdf=
	            		  new SimpleDateFormat("yyyy-MM-dd");
	              String today=sdf.format(date);
	              String db_day=vo.getRegdate().toString();
	              
	              if(today.equals(db_day))
	              {
	          %>
	                 &nbsp;&nbsp;
	                 <img src="../image/board/new.gif" border=0>
	          <%
	              }
	          %>
       </td>
	       
	         
	            <td width=15%>
	            <a href="javascript:info('<%=vo.getId()%>')">
	            <%=vo.getName() %></a>
	            </td>
	        <td width=20%><%=vo.getRegdate().toString() %></td>
	        <td width=10%><%=vo.getReadnum() %></td>
	       </tr> 
      
      <%} %>
           
	
    </table>
 

    <hr width=600>
    <form method=post name=frm action="find.jsp">
    <table border=0 width=600>
      <tr>
       <td align=center>
    	 <%
            if(curpage>1)
            {
            	back=curpage-1;
         %>
         <a href="board.jsp?type=1&page=<%=back%>">
         <img src="../image/board/prev.jpg" border=0>
         </a>
         <%
            }
         %>
       		&nbsp;
         <%
            for(int i=1;i<=totalpage;i++)
            {
         %>
               [<a href="board.jsp?type=1&page=<%=i%>"><%=i %></a>]
         <%
            }
         %> 	
       	 <%
             if(curpage<totalpage)
             {
            	 forward=curpage+1;
        %>
         <a href="board.jsp?type=1&page=<%=forward%>">	
         <img src="../image/board/next.jpg" border=0>
         </a>
        <%
             }
        %>
         &nbsp;&nbsp;&nbsp;
         <%=curpage %> page / <%=totalpage %> pages
       
        </td>
     
      <td align="right" >
      
       <a href="javascript:Login(<%=strNo%>,<%=strPage%>,2)">
         <img src="../image/board/write.jpg" border=0>
         </a>
        </td>
    
       </tr>
       <tr >
       <td align=center>
        <select name=fs>
         <option value=name>�̸�</option>
         <option value=subject>����</option>
         <option value=content>����</option>
        </select>
        <input type=text name=ss size=15>
        <input type=hidden name=page value=<%=curpage %>>
        <input type=button value=�˻� onclick=find()>
       </td>
        
        
      </tr>
    </table>
    
   </form>
   </center>
</body>
</html>















