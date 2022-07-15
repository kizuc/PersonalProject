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
<!-- Navigation-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- Page content-->
<section class="bg-light py-2">
<div class="container px-5">
<div class="bg-light rounded-3 py-4 px-4 px-md-5 mb-5">
<div class="text-center mb-5">
<div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
<h1 class="fw-bolder">게시판</h1>
</div>
<%
request.setCharacterEncoding("utf-8");

// int num 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO 객체생성
Board2DAO board2DAO=new Board2DAO();
Board2DTO board2DTO=board2DAO.getboard2(num);

String name = request.getParameter("name");
String subject = request.getParameter("subject");
String filename1 = request.getParameter("filename1");
String filename2 = request.getParameter("filename2");
%>
<article>
<h1>Notice Content</h1>
<table>
<tr>
	<td>글번호</td>
	<td id="t2"><%=board2DTO.getNum() %></td>
    <td>작성일</td>
    <td><%=board2DTO.getDate() %></td>
</tr>
<tr>
	<td>글쓴이</td>
	<td id="t2">운영자</td>
    <td>조회 수</td>
    <td><%=board2DTO.getReadcount() %></td>
</tr>
<tr>
	<td>제목</td>
	<td colspan="3"><%=board2DTO.getSubject() %></td>
</tr>
<tr>
	<td>내용</td>
	<td colspan="3"><%=board2DTO.getContent() %></td>
</tr>
<tr>
	<td>파일</td>
<%-- 	<td><a href="gwritePro.jsp?filename=<%=filename%>"><%=board2DTO.getFilename()%></a></td> --%>
</tr>
</table>
<div id="table_search">
<%
// 글수정 글삭제 => 로그인(세션값), 글쓴이 일치하면 글수정, 글삭제 버튼이 보이게
String id=(String)session.getAttribute("id");
if(id!=null){
	if(id.equals("admin")){
		%>
		<input type="button" value="글수정" class="btn btn-primary btn-sm" onclick="location.href='gupdate.jsp?num=<%=board2DTO.getNum()%>'">
		<input type="button" value="글삭제" class="btn btn-outline-primary btn-sm" onclick="location.href='gdelete.jsp?num=<%=board2DTO.getNum()%>'">
		<%
	}
}
%>
<input type="button" value="글목록" class="btn btn-outline-primary btn-sm" onclick="location.href='gboard.jsp'">
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