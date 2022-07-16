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
<body onload="removeCheck()">
<%
//request id pass 파라미터 값 가져오기 => 변수 저장
String id=request.getParameter("dID");
//MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
memberDAO.deleteMember(id);

%>
<script type="text/javascript">
	alert("삭제되었습니다!");
	location.href="memlist.jsp";
</script>
</body>
<script type="text/javascript">

// function removeCheck() {

// 	var result = confirm("정말 삭제하시겠습니까??");
// 	if(!result)	return false;
	
// 	location.href='memlist.jsp';
	
	
	
<%-- 	 <%-- if (confirm("정말 삭제하시겠습니까??") == true){    //확인 --%>

<%-- 		 <%memberDAO.deleteMember(id);%> --%>
<%-- 	     alert("삭제되었습니다!"); --%>
<%-- 		 location.href='memlist.jsp'; --%>

<%-- 	 }else {   										//취소 --%>
<%-- 	 	 location.href='memlist.jsp'; --%>
<%-- 	     return false; --%>
<%-- 	 } --%> --%>
// }
</script>
</html>