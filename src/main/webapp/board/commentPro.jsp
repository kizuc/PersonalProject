<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>commentPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String userID=(String)session.getAttribute("id");
String content = request.getParameter("comment");
int boardID = Integer.parseInt(request.getParameter("num"));

CommentDTO commentDTO = new CommentDTO();

commentDTO.setBoardID(boardID);
commentDTO.setUserID(userID);
commentDTO.setContent(content);

CommentDAO commentDAO = new CommentDAO();
commentDAO.insertComment(commentDTO);

out.println(commentDTO.getCommentID());
out.println(commentDTO.getBoardID());
out.println(commentDTO.getContent());

response.sendRedirect("content.jsp?num=" + boardID);
%>
</body>
</html>