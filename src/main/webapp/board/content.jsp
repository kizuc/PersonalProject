<%@page import="board.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/sub.css" rel="stylesheet">
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
 <!-- top-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- Page content-->
<section class="bg-light py-2">
<div class="container px-5">
<!-- Contact form-->
<div class="bg-light rounded-3 py-4 px-4 px-md-5 mb-5">
<div class="text-center mb-5">
<div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
<h1 class="fw-bolder">게시판</h1>
<!--<p class="lead fw-normal text-muted mb-0">We'd love to hear from you</p> -->
</div>
	<%
	// int num 파라미터 가져오기
	int num=Integer.parseInt(request.getParameter("num"));
	// BoardDAO 객체생성
	BoardDAO boardDAO=new BoardDAO();
	// BoardDTO boardDTO = getBoard(num)메서드 호출
	BoardDTO boardDTO=boardDAO.getBoard(num);
	%>
	<article>
	<h1>Notice Content</h1>
	<table>
	<tr>
		<td>글번호</td>
		<td id="t2"><%=boardDTO.getNum() %></td>
	    <td>작성일</td>
	    <td><%=boardDTO.getDate() %></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td id="t2"><%=boardDTO.getName() %></td>
	    <td>조회 수</td>
	    <td><%=boardDTO.getReadcount() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3"><%=boardDTO.getSubject() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3"><%=boardDTO.getContent() %></td>
	</tr>
	</table>
	<div id="table_search">
	<%
	// 글수정 글삭제 => 로그인(세션값), 글쓴이 일치하면 글수정, 글삭제 버튼이 보이게
	String id=(String)session.getAttribute("id");
	if(id!=null){
		if(id.equals(boardDTO.getName()) || id.equals("admin")){
			%>
			<input type="button" value="글수정" class="btn btn-primary btn-sm" onclick="location.href='update.jsp?num=<%=boardDTO.getNum()%>'">
			<input type="button" value="글삭제" class="btn btn-outline-primary btn-sm" onclick="location.href='delete.jsp?num=<%=boardDTO.getNum()%>'">
			<%
		}
	}
	%>
<input type="button" value="글목록" class="btn btn-outline-primary btn-sm" onclick="location.href='board.jsp'">
</div>
<div class="clear"></div>
<div id="page_control"></div>
</article>
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
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>