<%@page import="comment.CommentDAO"%>
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
int commentID=Integer.parseInt(request.getParameter("commentID"));
int boardID=Integer.parseInt(request.getParameter("boardID"));
// CommentDAO 객체생성
CommentDAO commentDAO = new CommentDAO();
// 댓글 삭제 메서드 호출
commentDAO.deleteComment(commentID);

%>
<script type="text/javascript">
location.href='content.jsp?num=' + boardID ;
</script>
</body>
</html>