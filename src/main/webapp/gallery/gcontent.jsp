<%@page import="member.MemberDTO"%>
<%@page import="gboard.GboardDTO"%>
<%@page import="gboard.GboardDAO"%>
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
	GboardDAO gboardDAO=new GboardDAO();
	//BoardDTO boardDTO = getBoard(num)메서드 호출
	GboardDTO gboardDTO=gboardDAO.getGboard(num);
	%>
	<article>
	<table>
	 <tr>
		<th colspan="4"><h5 class="pt-2 fw-bolder"><%=gboardDTO.getSubject() %></h5></th>
	 </tr>
	 <tr>
		<td id="gtitle"><%=gboardDTO.getNickname() %></td>
		<td><%=gboardDTO.getDate() %></td>
		<td>조회수 : <%=gboardDTO.getReadcount() %></td>
	 </tr>
	 <tr>
		<td colspan="3"><img src="../upload2/<%=gboardDTO.getFile() %>"></td>
	 </tr>
	 <tr>
		<td colspan="3"><%=gboardDTO.getContent() %></td>
	 </tr>
	</table>
	<%
	// 글수정 글삭제 => 로그인(세션값), 글쓴이 일치하면 글수정, 글삭제 버튼이 보이게
	String id=(String)session.getAttribute("id");
	if(id!=null){
		// 글쓴이 일치하면 글 수정, 삭제 버튼 보임
		if(id.equals(gboardDTO.getId())){
			%>
			<div class="text-end mb-3">
			<input type="button" value="글수정" class="btn btn-primary btn-lg" onclick="location.href='gupdate.jsp?num=<%=gboardDTO.getNum()%>'">
			<input type="button" value="글삭제" class="btn btn-outline-primary btn-lg" onclick="location.href='gdelete.jsp?num=<%=gboardDTO.getNum()%>'">
			<input type="button" value="글목록" class="btn btn-outline-primary btn-lg" onclick="location.href='gboard.jsp'">
			</div>
			<%
		// 관리자면 글 삭제 버튼 보임
		}else if(id.equals("admin")){
			%>
			<div class="text-end mb-3">			
			<input type="button" value="글삭제" class="btn btn-outline-primary btn-lg" onclick="location.href='gdelete.jsp?num=<%=gboardDTO.getNum()%>'">
			<input type="button" value="글목록" class="btn btn-outline-primary btn-lg" onclick="location.href='gboard.jsp'">
			</div>
			<%
		// 나머진 글 목록만 보이게
		}else{
			%>
			<div class="text-end mb-3">			
			<input type="button" value="글목록" class="btn btn-outline-primary btn-lg" onclick="location.href='gboard.jsp'">
			</div>			
			<%
		}
	}
	%>
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