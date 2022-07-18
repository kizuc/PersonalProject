<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updatePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// BoardDTO 객체생성
BoardDTO boardDTO=new BoardDTO();
// set메서드 호출 - 파라미터값 저장
boardDTO.setNum(num);
boardDTO.setName(name);
boardDTO.setSubject(subject);
boardDTO.setContent(content);

//BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();
// 업데이트 메서드 호출
boardDAO.updateBoard(boardDTO);
// 문의 게시판으로 이동
response.sendRedirect("board.jsp");
%>
</body>
</html>