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
<title>한끼가치 - 마이페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/sub.css" rel="stylesheet" />
</head>
<%	// 데이터 없으면 로그인 페이지로 이동
String id=(String)session.getAttribute("id");
if(id==null)	response.sendRedirect("../member/login.jsp");
%>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
<!-- top-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- Page Content-->
<section class="py-4">
<div class="container px-5 my-5">
<div class="row gx-5">
<jsp:include page="../inc/menumem.jsp"></jsp:include>
<div class="col-lg-9">
<article>
<!-- Post header-->
<header class="mb-4">
<h1 class="fw-bolder mb-1">마이페이지</h1>
<!-- Post content-->
	<%
	//MemberDAO 객체생성
	MemberDAO memberDAO=new MemberDAO();
	// MemberDTO memberDTO = getMember(id) 메서드 호출
	MemberDTO memberDTO=memberDAO.getMember(id);
	SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY.MM.dd");
	%>
	<div class="text-muted fst-italic mb-2">
	<%=id%>님 어서오세요!
	</div>
	</header>
	<!-- Preview image figure-->
	<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
	<figure class="mb-4"><img class="img-fluid rounded" name="profile" id="profile" src="https://dummyimage.com/300x300/ced4da/6c757d.jpg" alt="..." /></figure>
	<input type="file" class="btn btn-outline-primary btn-sm" name="file" value="첨부파일">
	</form>
	<br>
	<!-- Post content-->
	<section class="mb-5">
	<table>
		<tr>
			<th colspan="4">개인 정보</th>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=memberDTO.getName()%></td>
			<td>닉네임</td>
			<td><%=memberDTO.getNickname()%> &nbsp;
			<input type="button" class="btn btn-outline-primary btn-sm" value="닉네임 바꾸기">
			</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><%=memberDTO.getPhone()%></td>
			<td>모바일</td>
			<td><%=memberDTO.getMobile()%></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=memberDTO.getAddress()%><%=memberDTO.getAddress2()%></td>
			<td>가입일</td>
			<td><%=dateFormat.format(memberDTO.getDate())%></td>
		</tr>
	</table>
</section>
</article>
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
