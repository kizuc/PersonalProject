<%@page import="java.util.List"%>
<%@page import="oboard.JjimDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderboard/JjimPro.jsp</title>
</head>
<body>
<% 
JjimDAO jjimDAO = new JjimDAO();
List list = jjimDAO.getJjim(userID, bbsID);
int result = 0;
if (list.isEmpty()){
	result = jjimDAO.write(userID, bbsID);
}
else{
	result = jjimDAO.delete(userID, bbsID);
}
%>
</body>
</html>