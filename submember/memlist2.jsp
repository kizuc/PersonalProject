<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
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
<title>memlist.jsp</title>
</head>
<body>
<h2>관리자 모드 - 회원 목록(관리자 제외)</h2>

<table border="1">
<tr><td>ID</td><td>이름</td>
	<td>phone</td><td>mail</td>
	<td>주소</td><td>상세주소</td>
	<td>가입날짜</td>
	<td>관리</td></tr>
<%
 MemberDAO boardDAO=new MemberDAO();
 List boardList=boardDAO.memList();
%>
<%
// SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY.MM.dd.");

for(int i=0;i<boardList.size();i++){
	MemberDTO memberDTO=(MemberDTO)boardList.get(i);
%>
<tr><td><%=memberDTO.getId() %></td><td><%=memberDTO.getName() %></td>
	<td><%=memberDTO.getMobile() %></td><td><%=memberDTO.getEmail() %></td>
	<td><%=memberDTO.getAddress() %></td><td><%=memberDTO.getAddress2() %></td>
    <td><%=memberDTO.getDate()%></td><td><button onclick="">회원삭제</button></td></tr>	
	<%
}
%>
</table>

</body>
</html>