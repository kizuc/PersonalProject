<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deleteAdminPro.jsp</title>
</head>
<body>
<%
//request id pass 파라미터 값 가져오기 => 변수 저장
String id=request.getParameter("dID");
//MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
//MemberDTO memberDTO = userCheck 메서드 호출

memberDAO.deleteMember(id);
	%>
<script type="text/javascript">
alert("회원을 삭제했습니다");
location.href='memlist.jsp';
</script>

</body>
</html>