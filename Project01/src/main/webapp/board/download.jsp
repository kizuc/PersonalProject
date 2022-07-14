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


String filename1 = request.getParameter("filename11");
String downLoadFile = "D:\\project1\\Project01\\src\\main\\webapp\\temp" + filename1; 
 
File file = new File(downLoadFile);
   FileInputStream in = new FileInputStream(downLoadFile);

   filename1 = new String(filename1.getBytes("utf-8"), "8859_1");   

   response.setContentType("application/octet-stream");							
   response.setHeader("Content-Disposition", "attachment; filename1=" + filename1 ); 

out.clear();					
out = pageContext.pushBody();
   
   OutputStream os = response.getOutputStream();
   
   int length;
   byte[] b = new byte[(int)file.length()];

   while ((length = in.read(b)) > 0) {
   	os.write(b,0,length);
   }
   
   os.flush();
   
   os.close();
   in.close();
%>
</body>
</html>