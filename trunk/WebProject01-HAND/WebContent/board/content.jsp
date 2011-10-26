<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.db.*"%>
<jsp:useBean id="dao" class="com.db.BoardDAO"/>
<%
   //게시물 번호
   String strNo=request.getParameter("no");
	int curNo = Integer.parseInt(strNo);
   //현재 보고 있던 페이지
   String strPage=request.getParameter("page");
   
   BoardVO vo=
		  dao.getContent(Integer.parseInt(strNo));
 //마지막글과 처음글일 경우를 처리하기 위해 최대 글번호와 최소 글번호를 추가로 얻어온다
 	int maxmin[] = dao.getMaxMin();	
 	int maxNo = maxmin[0];
 	int minNo = maxmin[1];	
 	//현재 글 번호를 기준으로 이전글과 다음글에 관련된 정보를 얻어온다
 	int prevNo = 0;
 	int nextNo = 0;
 	String prevSubject = "";
 	String nextSubject = "";
 	BoardVO prevVO = new BoardVO();
 	BoardVO nextVO = new BoardVO();
 	
 	//윗글(글번호+1)이 답글일때(GroupLevel이 0이 아닐때)
 	//답글이 아닐때까지 글번호를 증가시키며 찾는다	
 	for(int i=curNo+1; i<=maxNo; i++){				
 		prevVO = dao.getContent(i);
 	
 		if(prevVO.getNo() != 0 && prevVO.getGrouplevel()==0){
 			break;
 		}			
 	}		

 	//위와 마찬가지로 아래글(글번호-1)이 답글이면 제외시키고
 	//GroupLevel이 0일때만 아래글로 표시한다
 	for(int i=curNo-1; i>=minNo; i--){		
 		nextVO = dao.getContent(i);
 		
 		if(nextVO.getNo() !=0 && nextVO.getGrouplevel()==0){
 			break;
 		}		
 	}

 	//윗글과 아랫글의 번호와 제목을 별도로 저장
 	//답글의 경우엔 출력하지 않는다
 	prevNo = prevVO.getNo();
 	nextNo = nextVO.getNo();
 	prevSubject = prevVO.getSubject();
 	nextSubject = nextVO.getSubject();
 	;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<p>
<p>
<p>

	<table border=10 width=800>
	
     <tr>
     <td width=20%></td>
	<td width=80% align=left>

     <%
			//윗글이 존재한다면  출력
			if(prevNo != 0){
	%>
     <img src="../image/board/prev1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=prevNo%>&page=<%=strPage%>&maxno=<%=maxNo%>&minno=<%=minNo%>">
     <%=prevSubject%>
	</a>
	<%		
			}else{
	%>	
			마지막 글입니다		
	<%
			}
	%>								
	</td>
    
   </tr>
     
     <tr>
     <td width=20%></td>
	<td width=80% align=left>
     <%											
		if(nextNo != 0){
	%>
     <img src="../image/board/next1.jpg" border=0>
     <a href="board.jsp?type=3&no=<%=nextNo%>&page=<%=strPage%>&maxno=<%=maxNo%>&minno=<%=minNo%>">
								<%=nextSubject%>		
							</a>
	<%
			}else{
	%>	
		처음글 입니다		
	<%
	  		}
	%>			 
		</td>
	</tr>			
     
     </table>
     
	<table width=800 border=0 bordercolor=cccccc>
	
	
      <tr >
        <td width=15% bgcolor=cccccc height=25>제목</td>
            <td align=left colspan=3><%=vo.getSubject() %></td>
            <td align=right colspan=2 >	
            <a href="board.jsp?type=4&no=<%=strNo%>&page=<%=strPage%>">
   			<img src="../image/board/update.jpg" border=0>
   			</a>
   			<a href="board.jsp?type=5&no=<%=strNo%>&page=<%=strPage%>">
   			<img src="../image/board/delete.jpg" border=0>
   			</a>
   			<a href="board.jsp?type=2&no=<%=strNo%>&page=<%=strPage%>">
 			<img src="../image/board/write.jpg" border=0>
 			</a>
 			<a href="board.jsp?type=1&page=<%=strPage%>">
			<img src="../image/board/main.jpg" border=0>
			</a>	 
            </td>  
      </tr>
      
      
      <tr  >
        <td width=15% bgcolor=cccccc height=25>글쓴이</td>
        <td width=20%><%=vo.getName() %></td>
        <td width=15% bgcolor=cccccc>작성일</td>
        <td width=20%><%=vo.getRegdate().toString() %></td>
        <td width=15% bgcolor=cccccc>조회수</td>
        <td width=15%><%=vo.getReadnum() %></td>
      </tr>
        <tr>
        <td align=left colspan=4 valign=top height=200>
         <pre><%=vo.getContent() %></pre>
        </td>
      </tr>
      
     </table>
        <table width=800 border=5 bordercolor=cccccc height=100>
     	<tr >
     	<td width=15% bgcolor=cccccc >답글쓰기</td>
     	<td align=left colspan=4 valign=top >
         <pre></pre>
        </td>
       
        <td  width=15% align=right>
   
        <input type=button value=등록 size=20 >
    
          
        
        
     	</td>
     	</tr>
     	
     
     </table>

  
</center>
</body>
</html>