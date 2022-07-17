<%@page import="board2.Board2DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2/fdelete.jsp</title>
</head>
<body>
<%
// num 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// board2DAO 객체생성
Board2DAO board2DAO = new Board2DAO();
// deleteboard2(num) 메서드 호출
board2DAO.deleteboard2(num);
response.sendRedirect("reference.jsp");
%>
</body>
</html>