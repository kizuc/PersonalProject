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
<!-- top-->
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
<!-- 본문-->
<section class="py-3">
<div class="container px-5 my-3">
<div class="row gx-5">
<jsp:include page="../inc/contactMenu.jsp"></jsp:include>
<div class="col-lg-9">
<div class="text-start mb-5"><br>
<h1 class="fw-bolder">문의 게시판</h1>
<div class="text-muted mb-2">보내주시는 문의 사항은 최대한 신속하게 답변해 드리겠습니다</div><br>
<!-- 게시판 -->
	<%
	String id=(String)session.getAttribute("id");
	//세션값이 없으면 login.jsp 이동
	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}
	int num=Integer.parseInt(request.getParameter("num"));
	// BoardDAO 객체생성
	BoardDAO boardDAO=new BoardDAO();
	// getBoard()
	BoardDTO boardDTO=boardDAO.getBoard(num);
	%>
	<article>
	<form action="updatePro.jsp" method="post">
	
	<input type="hidden" name="num" value="<%=boardDTO.getNum()%>">
	<table>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="name" value="<%=id %>" readonly></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="<%=boardDTO.getSubject()%>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="5" cols="50"><%=boardDTO.getContent()%></textarea></td>
	</tr>	
	</table>
	<div id="table_search">
	<div class="text-end mb-3">
	<input type="submit" value="글수정" class="btn btn-primary btn-lg" id="submit">
	<input type="button" value="글목록" class="btn btn-outline-primary btn-lg" onclick="location.href='board.jsp'">
	</div>
	</div>
	</form>
	<div class="clear"></div>
	<div id="page_control"></div>
	</article>
<div class="clear"></div>
</div>
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
