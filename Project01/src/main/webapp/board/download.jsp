<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String fileName1 = request.getParameter("filename1");
String fileName2 = request.getParameter("filename1");
String downloadPath = "D:\\workspace_jsp1\\Project01\\src\\main\\webapp\\img";

File file = new File(downloadPath);
FileInputStream in = new FileInputStream(downloadPath);

// fileName = new String(fileName.getBytes("utf-8"), "8859_1");
%>
</body>
</html>