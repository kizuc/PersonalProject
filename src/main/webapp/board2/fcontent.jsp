<%@page import="board2.Board2DTO"%>
<%@page import="board2.Board2DAO"%>
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
<div class="text-muted mb-2">한끼가치 이용에 도움되는 자료가 올라옵니다</div><br>
	<%
	//int num 파라미터 가져오기
	int num=Integer.parseInt(request.getParameter("num"));
	//BoardDAO 객체생성 
	Board2DAO board2DAO=new Board2DAO();
	// 조회수 1증가
	board2DAO.updateReadCount(num);
	//BoardDTO boardDTO = getBoard(num)메서드 호출
	Board2DTO board2DTO=board2DAO.getboard2(num);
	SimpleDateFormat dateFormat=new SimpleDateFormat("MM.dd");
	%>
	<article>
	<table>
	<tr>
		<th colspan="4"><h5 class="pt-2 fw-bolder"><%=board2DTO.getSubject() %></h5></th>
	</tr>
	<tr>
		<td>파일</td>
	    <td><a href="../upload/<%=board2DTO.getFile() %>" download><%=board2DTO.getFile() %> 📁 </a></td>
		<td>작성일</td>
		<td id="t2"><%=dateFormat.format(board2DTO.getDate()) %></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td id="t2">운영자</td>
		<td>조회 수</td>
	    <td><%=board2DTO.getReadcount() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3"><%=board2DTO.getContent() %></td>
	</tr>
	</table>
	<%
	// 글수정 글삭제 => 로그인(세션값), 글쓴이 일치하면 글수정, 글삭제 버튼이 보이게
	String id=(String)session.getAttribute("id");
	if(id!=null){
		if(id.equals("admin")){
			%>
			<div class="text-end mb-3">
			<input type="button" value="글수정" class="btn btn-primary btn-sm" onclick="location.href='fupdate.jsp?num=<%=board2DTO.getNum()%>'">
			<input type="button" value="글삭제" class="btn btn-outline-primary btn-sm" onclick="location.href='fdelete.jsp?num=<%=board2DTO.getNum()%>'">
			</div>
			<%
		}
	}
%>
</article>
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