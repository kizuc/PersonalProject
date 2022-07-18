<%@page import="gboard.GboardDAO"%>
<%@page import="gboard.GboardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

// 업로드 위치 지정(이 폴더의 물리적 경로, upload 폴더 생성)
String uploadPath=request.getRealPath("/upload2");
out.println(uploadPath);
// 파일 업로드 크기(10M)
int maxSize=10*1024*1024;

// 파일업로드 파일 MultipartRequest.class
// MultipartRequest multi=
// new MultipartRequest(request,upload폴더 물리적경로,업로드할 파일크기,한글처리,파일이름 동일할경우 이름변경);
MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// request를 multi 안에 담았기 때문에 멀티로 전달~
// multi 파라미터 가져오기 pass name subject content
String id=multi.getParameter("id");
String nickname=multi.getParameter("nickname");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
int readcount=0;

//업로드된 파일 이름 가져오기 getParameter가 아니라~
String file=multi.getFilesystemName("file");

//GboardDTO 객체생성
GboardDTO gBoardDTO=new GboardDTO();
//set메서드 파라미터값 저장
gBoardDTO.setId(id);
gBoardDTO.setNickname(nickname);
gBoardDTO.setPass(pass);
gBoardDTO.setSubject(subject);
gBoardDTO.setContent(content);
gBoardDTO.setReadcount(readcount);
// GboardDTO file 멤버변수 만들고 set메서드 호출(저장되어지게)
gBoardDTO.setFile(file);
GboardDAO gBoardDAO=new GboardDAO();
// 글 등록 메서드호출
gBoardDAO.insertGboard(gBoardDTO);
// 갤러리로 이동
response.sendRedirect("gboard.jsp");
%>
</body>
</html>