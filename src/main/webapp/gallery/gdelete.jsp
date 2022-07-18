<%@page import="gboard.GboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한끼가치 - 갤러리</title>
</head>
<body>
<%
// num 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// gboardDAO 객체생성
GboardDAO gboardDAO = new GboardDAO();
// 삭제 메서드 호출
gboardDAO.deleteGboard(num);
// 갤러리로 이동
response.sendRedirect("gboard.jsp");
%>
</body>
</html>