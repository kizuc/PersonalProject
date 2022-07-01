<%@page import="java.util.List"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/sub.css" rel="stylesheet" />
<%	// 데이터 있거나 admin계정 아니면 로그인 페이지로 이동
String id=(String)session.getAttribute("id");
if(id.equals("admin") && id != null){	
} else{
	response.sendRedirect("../main/main.jsp");
}
%>
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
 <!-- Navigation-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- Page Content-->
<section class="py-21">
<div class="container px-5 my-5">
<div class="row gx-5">
<div class="col-lg-12">
<!-- Post content-->
<h1 class="fw-bolder mb-1">관리자 페이지</h1>
                        
<jsp:include page="../inc/menuadmin.jsp"></jsp:include>
<section class="py-2">
<div class="container px-5 my-5">
<div class="row gx-5">
<div class="col-lg-12">
<!-- Post content-->
<h4 class="fw-bolder mb-1">회원 목록</h4>
<section>
<form name="li" method="post">
<table>
<tr>
	<th>ID</th>
	<th>이름</th>
	<th>phone</th>
	<th>mail</th>
	<th>주소</th>
	<th>상세주소</th>
	<th>가입날짜</th>
	<th>관리</th>
</tr>
<%
 MemberDAO boardDAO=new MemberDAO();
 List boardList=boardDAO.memList();
%>
<%
// SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY.MM.dd.");

for(int i=0;i<boardList.size();i++){
	MemberDTO memberDTO=(MemberDTO)boardList.get(i);
%>
<tr>
	<td><%=memberDTO.getId() %></td>
	<td><%=memberDTO.getName() %></td>
	<td><%=memberDTO.getMobile() %></td>
	<td><%=memberDTO.getEmail() %></td>
	<td><%=memberDTO.getAddress() %></td>
	<td><%=memberDTO.getAddress2() %></td>
    <td><%=memberDTO.getDate()%></td>
    <td><input type="button" name="del" type="button" value="<%=memberDTO.getId()%>"></td>
</tr>	
	<%
}
%>
</table>
</form>
</section>
</div>
</div>
</div>
</section>
</div>
</div>
</div>
</section>
</main>
<!-- Footer-->
 <jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script src="js/scripts.js"></script>
<script>
function check(li) {
 // li.target = "_blank";
 // li.action = "deletemem.jsp";
 // form.target = "result"; //타겟명
 // form.action = ""; //전송될 주소
 popup = window.open("deletemem.jsp?userid="+document.li.check.value,"","_blank", "width=400, height=300");
 popup.focus();
 li.submit();

}

</script>

</body>
</html>
