<%@page import="gboard.GboardDTO"%>
<%@page import="gboard.GboardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>한끼가치 - 갤러리</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/sub2.css" rel="stylesheet">
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
<!-- Navigation-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 이미지 -->
<div class="py-4 bg-light bg-pic2">
<div class="container px-8 my-5">
<div class="row gx-5 justify-content-center">
<div class="col-lg-10 col-xl-7">
</div>
</div>
</div>
</div>
<!-- Page Content-->
<section class="py-3">
<div class="container px-8 my-3">
<div class="text-start mb-5"><br>
<h1 class="fw-bolder">갤러리</h1>
<div class="text-muted mb-2">후기와 함께 같이 한 순간을 나눠보세요</div><br>
<!-- Post content-->
	<%
	// gboardDAO 객체생성
	GboardDAO gBoardDAO=new GboardDAO();
	
	// 한 페이지에 보여줄 글 개수
	int pageSize=6;
	String pageNum=request.getParameter("pageNum");
	
	if(pageNum==null)	pageNum= "1";	// 페이지 번호 가져오기
	 
	int currentPage=Integer.parseInt(pageNum);	// 페이지 번호를 정수형으로 변경
	int startRow=(currentPage-1)*pageSize+1;	// 시작 행
	int endRow=startRow+pageSize-1;				// 끝나는 행
	 
	// List gboardList = getgboardList()메서드 호출
	List gBoardList=gBoardDAO.getGboardList(startRow,pageSize);
	%>
	<table id="notice">
	<tr>
	   <%
	   //날짜 => 문자열 모양변경
	   SimpleDateFormat dateFormat=new SimpleDateFormat("MM.dd");
	   for(int i=0;i<gBoardList.size();i++){
		   GboardDTO gBoardDTO=(GboardDTO)gBoardList.get(i);
		   %>
		<td>
<%-- 		<%=i+1 %> --%>
		<a href="gcontent.jsp?num=<%=gBoardDTO.getNum()%>" class="img1">
		<img src="../upload2/<%=gBoardDTO.getFile() %>" width="405px" height="280px"></a><br>
		<span class="fw-bold6 pt-6"><%=gBoardDTO.getSubject() %></span>
		<span class="text-end ps-1"><%=dateFormat.format(gBoardDTO.getDate()) %></span>
		</td>   
		<%
		  if((i+1)%3==0) {
		  	%></tr><tr><%
		  }
	   }
	   %> 
	</tr>	 
	<!-- for문 안에 있던 tr을 for문 밖으로 뺌(수평으로 td를 여러개 만들기 위함) -->
	</table>
	<div id="table_search">
	<%
	// 세션값 가져오기(로그인한 사람만 보이게)
	String id=(String)session.getAttribute("id");
	// 세션값이 있으면 글쓰기 버튼 보이기
	if(id!=null){
		%>
		<div class="text-end mb-3">
		<input type="button" class="btn btn-primary btn-lg" value="글쓰기" onclick="location.href='gwrite.jsp'">
		</div>
		<%
	}
	%>
	<input type="text" name="search" class="input_box">
	<input type="button" value="search">
	</div>
	<%
	int pageBlock=8;	// 한 페이지에 보여줄 페이지 개수 설정
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;	// 시작 페이지
	int endPage=startPage+pageBlock-1;						// 끝나는 페이지
		
	int count=gBoardDAO.getGboardCount();		// 전체 글 개수
	int pageCount=count / pageSize+(count%pageSize==0?0:1);	// 전체 페이지 개수 구하기
	if(endPage > pageCount)		endPage = pageCount;	
	%>
	<div id="page_control">
	<%
	if(startPage > pageBlock) {
		%>
		<a href="gboard.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
		<%
	}
	for(int i=startPage;i<=endPage;i++){
		%>
		<a href="gboard.jsp?pageNum=<%=i%>"><%=i %></a> 
		<%
	}
	if(endPage < pageCount) {
		%>
		<a href="gboard.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
		<%
	
	}
	%>
</div>
</div>
</div>
</section>
</main>
<!-- Footer-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
