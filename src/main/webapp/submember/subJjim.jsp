<%@page import="java.util.List"%>
<%@page import="oboard.JjimDAO"%>
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
	
	int pageNumber = 1; //기본페이지
	if (request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
	}
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
	<%
		JjimDAO jjimDAO = new JjimDAO();
		List jjimList = jjimDAO.getBoardList(id, pageNumber);
		for(int i=0; i<jjimList.size(); i++){	
	%>
	<tr>
		<td><%= jjimList.get(i).getBbsID() %></td>
		<td><a href="view.jsp?boardID=<%=jjimList.get(i).getBoardID()%>&bbsID=<%= jjimList.get(i).getBbsID() %>"><%= jjimList.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
		<td><%= jjimList.get(i).getUserID() %></td>
		<td><%= jjimList.get(i).getBbsDate().substring(0,11) + jjimList.get(i).getBbsDate().substring(11,13) + "시" + jjimList.get(i).getBbsDate().substring(14,16) + "분" %></td>
	</tr>
	<%
		}
	%>
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
<script type="text/javascript">

function modNick(nickname){
	alert("hi");
// 	var result = confirm("댓글을 삭제하시겠습니까?");
// 	if(!result) return false;

// 	location.href='deleteComment.jsp?commentID=' + commentID;
}
	
</script>
</body>
</html>
