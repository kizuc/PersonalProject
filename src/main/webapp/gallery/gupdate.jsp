<%@page import="board2.Board2DTO"%>
<%@page import="board2.Board2DAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>한끼가치 - 자료실</title>
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
<div class="text-start mb-5"><br>
<h1 class="fw-bolder">자료실</h1>
<div class="text-muted mb-2">자료를 등록할 수 있습니다<br>
이 페이지는 관리자만 접근 가능합니다</div><br>
	<%
	String id=(String)session.getAttribute("id");
	MemberDAO memberDAO=new MemberDAO();
	MemberDTO memberDTO=memberDAO.getMember(id);
	//세션값이 없으면 login.jsp 이동
	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}
	int num=Integer.parseInt(request.getParameter("num"));
	// board2DAO 객체생성
	Board2DAO board2DAO=new Board2DAO();
	// getboard2()
	Board2DTO board2DTO=board2DAO.getboard2(num);
	%>
	<article>
	<form action="fupdatePro.jsp" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="num" value="<%=board2DTO.getNum()%>">
	<table>
	<tr>
		<td>글쓴이</td>
		<td><input type="hidden" name="name"><%=memberDTO.getName() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="<%=board2DTO.getSubject()%>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="2" cols="50"><%=board2DTO.getContent()%></textarea></td>
	</tr>	
	<tr>
		<td id="t2">첨부파일</td>
		<td><input type="file" class="btn btn-outline-primary btn-sm" name="file" value="첨부파일">
		    <input type="hidden" name="oldfile" value="<%=board2DTO.getFile()%>"> &ensp; <%=board2DTO.getFile()%>
		</td>
	</tr>
	</table>
	<div class="text-end mb-3">
	<input type="submit" value="글수정" class="btn btn-primary btn-lg" id="submit">
	<input type="button" value="글목록" class="btn btn-outline-primary btn-lg" onclick="location.href='reference.jsp'">
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
