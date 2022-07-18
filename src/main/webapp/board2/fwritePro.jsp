<%@page import="board2.Board2DAO"%>
<%@page import="board2.Board2DTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한끼가치 - 자료실</title>
</head>
<body>
<%
// 업로드 위치 지정(이 폴더의 물리적 경로, upload 폴더 생성)
String uploadPath=request.getRealPath("/upload");
out.println(uploadPath);
// 파일 업로드 크기(10M)
int maxSize=10*1024*1024;

// 파일업로드 파일 MultipartRequest.class
// MultipartRequest multi=
// new MultipartRequest(request,upload폴더 물리적경로,업로드할 파일크기,한글처리,파일이름 동일할경우 이름변경);
MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// request를 multi 안에 담았기 때문에 멀티로 전달~
// multi 파라미터 가져오기
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
int readcount=0;

//업로드된 파일 이름 가져오기 getParameter가 아니라~
String file=multi.getFilesystemName("file");

// board2DTO 객체생성
Board2DTO board2DTO=new Board2DTO();
// set메서드 파라미터값 저장
board2DTO.setPass(pass);
board2DTO.setSubject(subject);
board2DTO.setContent(content);
board2DTO.setReadcount(readcount);
// board2DTO file 멤버변수 만들고 set메서드 호출(저장되어지게)
board2DTO.setFile(file);
Board2DAO board2DAO=new Board2DAO();
// 글 등록 메서드 호출
board2DAO.insertboard2(board2DTO);
// 자료실로 이동
response.sendRedirect("reference.jsp");
%>
</body>
</html>