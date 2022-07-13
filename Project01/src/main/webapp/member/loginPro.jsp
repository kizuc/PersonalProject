<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro.jsp</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// MemberDAO 객체 생성
MemberDAO memberDAO=new MemberDAO();
// userCheck 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id,pass);
if(memberDTO!=null){
	out.println("아이디 비밀번호 일치");
	session.setAttribute("id",id);
	response.sendRedirect("../main/main.jsp");
} else {
	%>
	<script type="text/javascript">
		alert("아이디, 비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html> 