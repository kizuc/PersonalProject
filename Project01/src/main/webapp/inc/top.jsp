<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("id");
%>

<link href="css/styles.css" rel="stylesheet" />
<nav class="navbar navbar-expand-lg navbar-dark bg-pic1">
    <div class="container px-5">
        <a class="navbar-brand" href="../index.html"><img class="img1" src="../img/logo1.png" width=110px></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="../main/main.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="../orderboard/orderForm.jsp">가치 더하기+</a></li>
                <li class="nav-item"><a class="nav-link" href="../gallery/gboard.jsp">가치한 순간</a></li>
                <li class="nav-item"><a class="nav-link" href="../board/board.jsp">Contact</a></li>
            </ul>
        </div>
         <div class="col-auto">
	         <%if(id==null){
				%>
				<a class="link-light small" href="../member/login.jsp">로그인</a>
				 <span class="text-white mx-1">&middot;</span>
				 <a class="link-light small" href="../member/join.jsp">회원가입</a>
				<%
			}else if(id!=null){
				if(id.equals("admin")){
					%>
					<span class="text-whites samll mx-2"><%=id %> </span>
					<a class="link-light small" href="../submember/subadmin.jsp">관리자 페이지</a>
					<span class="text-white mx-1">&middot;</span>
					<a class="link-light small" href="../member/logout.jsp">로그아웃</a>
					<%
				}else{
				%>
				<span class="text-whites samll mx-2"><%=id %>님 환영합니다! </span>
				<a class="link-light small" href="../submember/submember.jsp">마이페이지</a>
				<span class="text-white mx-1">&middot;</span>
				<a class="link-light small" href="../member/logout.jsp">로그아웃</a>
			<%
				}
			}
			%>
        </div>
    </div>
</nav>