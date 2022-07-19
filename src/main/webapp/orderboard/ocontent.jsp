<%@page import="oboard.OboardDTO"%>
<%@page import="oboard.OboardDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>한끼가치 - 주문</title>
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
<!-- top -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 이미지 -->
<div class="py-4 bg-light bg-pic2">
<div class="container px-6 my-5">
<div class="row gx-5 justify-content-center">
<div class="col-lg-10 col-xl-7">
</div>
</div>
</div>
</div>
<!-- Page Content-->
<section class="py-3">
<div class="container px-6 my-3">
<div class="text-start mb-5"><br>
<h1 class="fw-bolder">갤러리</h1>
<div class="text-muted mb-2">후기와 함께 같이 한 순간을 나눠보세요</div><br>
	<%
	//int num 파라미터 가져오기
	int num=Integer.parseInt(request.getParameter("num"));
	//BoardDAO 객체생성 
	OboardDAO oboardDAO=new OboardDAO();
	//BoardDTO boardDTO = getBoard(num)메서드 호출
	OboardDTO oboardDTO=oboardDAO.getOboard(num);
	%>
	<article>
	<table>
	 <tr>
		<th colspan="4"><h5 class="pt-2 fw-bolder"><%=oboardDTO.getWfood() %></h5></th>
	 </tr>
	 <tr>
		<td id="gtitle"><%=oboardDTO.getNickname() %></td>
		<td><%=oboardDTO.getDate() %></td>
		<td><%=oboardDTO.getFaddress() %></td>
	 </tr>
	 <tr>
		<td colspan="3"><%=oboardDTO.getNickname() %>"></td>
	 </tr>
	 <tr>
		<td colspan="3"><%=oboardDTO.getOoption() %></td>
	 </tr>
	</table>
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