<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한끼가치 - 문의</title>
</head>
<body>
<%
// num 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO 객체생성
BoardDAO boardDAO = new BoardDAO();
// 글 삭제 메서드 호출
boardDAO.deleteBoard(num);
response.sendRedirect("board.jsp");
%>
</body>
</html>