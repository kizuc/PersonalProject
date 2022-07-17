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
<title>한끼가치 - 문의</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/sub.css" rel="stylesheet">
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
<!-- Navigation-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 이미지 -->
<div class="py-4 bg-light bg-pic2">
<div class="container px-5 my-5">
<div class="row gx-5 justify-content-center">
<div class="col-lg-10 col-xl-7">
</div>
</div>
</div>
</div>
<!-- Page Content-->
<section class="py-3">
<div class="container px-5 my-3">
<div class="row gx-5">
<jsp:include page="../inc/contactMenu.jsp"></jsp:include>
<div class="col-lg-9">
<div class="text-start mb-3"><br>
<h1 class="fw-bolder">문의 게시판</h1>
<p class="lead fw-normal text-muted mb-0">자유롭게 적어주세요</p>
</div>
<%
String id=(String)session.getAttribute("id");
// 세션값이 없으면(회원이 아니면) 로그인 페이지로 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>
<article>
<form action="writePro.jsp" method="post">
<!-- 로그인 하지 않은 사람은 비밀번호가 필요하니까 임의로 1234 -->
<input type="hidden" name="pass" value="1234">
<table>
<tr>
	<td>글쓴이</td>
	<td><input type="text" name="name" value="<%=id %>" readonly></td>
</tr>
<tr>
	<td>제목</td>
	<td><input type="text" name="subject"></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea name="content" rows="5" cols="110"></textarea></td>

</tr>
<tr>
	<td colspan="2"><input type="file" value="첨부파일"></td>
</tr>
</table>
<div id="table_search">
<div class="text-end mb-3">
<input type="submit" class="btn btn-primary btn-lg" value="등록">
<input type="button" class="btn btn-outline-primary btn-lg" value="글목록" onclick="location.href='board.jsp'">
</div>
</div>
</form>
<div class="clear"></div>
<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
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
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
