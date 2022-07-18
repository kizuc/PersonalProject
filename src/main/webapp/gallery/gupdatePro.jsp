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
// 한글처리
int maxSize=10*1024*1024;
// 실제경로 담기
String uploadPath=request.getRealPath("/upload");
MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

//num name subject content 파라미터 가져오기
int num=Integer.parseInt(multi.getParameter("num"));
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
//file 파라미터 가져오기
String file=multi.getFilesystemName("file");

// file 없을 때 이전 파일로 대체되게
if(file==null) {
	file=multi.getParameter("oldfile");
}
// 파일 저장
//gboardDTO 객체생성
GboardDTO gboardDTO=new GboardDTO();
//set메서드 호출 파라미터값 저장
gboardDTO.setNum(num);
gboardDTO.setSubject(subject);
gboardDTO.setContent(content);
gboardDTO.setFile(file);

// gboardDAO 객체생성
GboardDAO gboardDAO=new GboardDAO();
// 글 수정 호출
gboardDAO.updateGboard(gboardDTO);
// 자료실로 이동
response.sendRedirect("gboard.jsp");
%>
</body>
</html>