<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>한끼가치 - 갤러리</title>
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
<div class="container px-6 my-3">
<div class="text-start mb-5"><br>
<h1 class="fw-bolder">후기</h1>
<div class="text-muted mb-2">같이 한 순간을 나눠보세요</div><br>
<!-- Post content-->
	<%
	String id=(String)session.getAttribute("id");
	MemberDAO memberDAO=new MemberDAO();
	MemberDTO memberDTO=memberDAO.getMember(id);
	// 세션값이 없으면(회원이 아니면) 로그인 페이지로 이동
	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}
	%>
	 <form action="gwritePro.jsp" id="contactForm" name="fr" data-sb-form-api-token="API_TOKEN" method="post" enctype="multipart/form-data">
        <!-- id input-->
        <div class="form-floating mb-3">
            <input type="hidden" name="id" id="id" value="<%=memberDTO.getId()%>">
            <input type="hidden" name="pass" value="1234">
            <input class="form-control" type="text" name="nickname" id="nickname" value="<%=memberDTO.getNickname()%>" placeholder="Enter your nickname...">
            <label for="nickname">닉네임</label>
        </div>
         <!-- subject input-->
        <div class="form-floating mb-4">
            <input class="form-control" type="text" name="subject" id="subject" placeholder="Enter subject" data-sb-validations="required">
            <label for="subject">제목</label>
        </div>
         <!-- content input-->
        <div class="form-floating mb-3">
            <textarea class="form-control" name="content" id="content" placeholder="Enter content..." data-sb-validations="required"/></textarea>
            <label for="content">내용</label>
        </div>
         <!-- file input-->
            <input class="form-control" type="file" name="file" id="file" placeholder="Enter file"><br>
        <!-- Submit Button-->
        <div class="d-grid"><input type="submit" class="btn btn-primary btn-lg" onclick="fun1()" value="글 올리기"></div><br>
        <div class="d-grid"><input type="reset" class="btn btn-outline-primary btn-lg" id="cancel" type="reset" value="다시 쓰기"></div>
    </form>
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
