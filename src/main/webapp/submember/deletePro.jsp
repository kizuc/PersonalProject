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
<title>member/deletePro.jsp</title>
</head>
<body>
<%
//request id pass 파라미터 값 가져오기 => 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
//MemberDTO memberDTO = userCheck 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id,pass);

if(memberDTO!=null){	// id,pass가 일치하다
	
	memberDAO.deleteMember(id);
	%>
	<script type="text/javascript">
		alert("탈퇴하셨습니다!");
	</script>
	<%
	//세션값 초기화
	session.invalidate();
	// main.jsp 이동
	response.sendRedirect("../main/main.jsp");
}else{
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다!");
		history.back();
	</script>
	<%
}
%>
</body>
</html>