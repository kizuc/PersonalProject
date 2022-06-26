<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("id");
%>
<header>
<div id="login">
<%if(id==null){
	%>
	<a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a>
	<%
}else if(id!=null){
	%>
	<%=id %>님 환영합니다 | <a href="updateForm.jsp">회원정보수정</a> | <a href="../member/logout.jsp">로그아웃</a>
<%
}
%>
</div>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">소개</a></li>
	<li><a href="#">포트폴리오</a></li>
	<li><a href="../center/notice.jsp">CONTACT</a></li>
</ul>
</nav>
</header>