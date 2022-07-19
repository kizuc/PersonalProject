<%@page import="oboard.OboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="oboard.OboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	// oboardDAO 객체생성
	OboardDAO oboardDAO=new OboardDAO();
	
	// 한 페이지에 보여줄 글 개수
	int pageSize=1;
	String pageNum=request.getParameter("pageNum");
	
	if(pageNum==null)	pageNum= "1";	// 페이지 번호 가져오기
	 
	int currentPage=Integer.parseInt(pageNum);	// 페이지 번호를 정수형으로 변경
	int startRow=(currentPage-1)*pageSize+1;	// 시작 행
	int endRow=startRow+pageSize-1;				// 끝나는 행
	 
	// List gboardList = getgboardList()메서드 호출
	List oBoardList=oboardDAO.getOboardList(startRow,pageSize);
	%>
	<table>
	<tr>
	   <%
	   //날짜 => 문자열 모양변경
	   for(int i=0; i<oBoardList.size(); i++){
		   OboardDTO oBoardDTO=(OboardDTO)oBoardList.get(i);
		   %>
		<td>
        <div class="card h-75 shadow border-0">
        <div class="card-body p-4">
        <div class="badge bg-primary bg-gradient rounded-pill mt-2 mb-2">
        <%=oBoardDTO.getOoption()%>
        </div>
        <a class="text-decoration-none link-dark stretched-link" href="#!">
         <%
		// 날짜시간 분해하기(mm월 dd일 hh)
         String dateData=oBoardDTO.getFdate();
         String mm=dateData.split("T")[0].split("-")[1].trim();
         
        // 월이 0부터 시작하면 0 지우기 
 		 String zero="0";
 		if(mm.substring(0,1).equals(zero)){
			 mm=mm.substring(1);
		 }
         
         String dd=dateData.split("T")[0].split("-")[2].trim();
         String hh=dateData.split("T")[1].trim();
        
      	// 시간이 0부터 시작하면 0 지우기 
  		if(hh.substring(0,1).equals(zero)){
  			hh=hh.substring(1);
		 }
         
         %>
         <h1 class="fw-bolder mb-3">
         <%=mm%>월 <%=dd%>일 <%=hh%> <br>
         <%=oBoardDTO.getFaddress()%>에서 <br>
         <%=oBoardDTO.getWfood()%> 먹을<br>
         <%=oBoardDTO.getPeople()%> 구합니다!</h1></a>
         <p class="lead fw-normal text-muted mb-5">
         <%=oBoardDTO.getNof()%><br>
		 <%=oBoardDTO.getEtc()%>
         </p>
         </div>
		</div>
		</td>   
		<%
		  if((i+1)%1==0) {
			  	%></tr><tr><%
		  }

	   }
	   %> 
	</tr>	 
	</table>
    <%
	int pageBlock=1;	// 한 페이지에 보여줄 페이지 개수 설정
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;	// 시작 페이지
	int endPage=startPage+pageBlock-1;						// 끝나는 페이지
		
	int count=oboardDAO.getOboardCount();		// 전체 글 개수
	int pageCount=count / pageSize+(count%pageSize==0?0:1);	// 전체 페이지 개수 구하기
	if(endPage > pageCount)		endPage = pageCount;	
	%>
	<div id="page_control">
	<%
	if(startPage > pageBlock) {
		%>
		<a href="oboard2.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
		<%
	}
	for(int i=startPage;i<=endPage;i++){
		%>
		<a href="oboard2.jsp?pageNum=<%=i%>"><%=i %></a> 
		<%
	}
	if(endPage < pageCount) {
		%>
		<a href="oboard2.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
		<%
	}
	%>