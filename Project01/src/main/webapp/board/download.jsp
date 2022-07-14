<%@page import="board2.Board2DTO"%>
<%@page import="board2.Board2DAO"%>
<%@page import="java.io.OutputStream"%>
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
//한글처리
request.setCharacterEncoding("utf-8");

String filename1=request.getParameter("file_name");
// 업로드 폴더 위치와 업로드 폴더의 이름을 알아내야함
String savePath = "upload";
ServletContext context = getServletContext();

// 갖고 온 위치에 연결해 파일 다운로드 받기
String downPath = context.getRealPath(savePath);
out.print("D:\\project1\\Project01\\src\\main\\webapp\\temp");
String filePath=downPath+"\\"+filename1;

File file=new File(filePath);
// 용량 처리
byte[] b = new byte[10*1024*1024];
FileInputStream fis = new FileInputStream(file);

%>
</body>
</html>