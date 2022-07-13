<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board2.Board2DAO"%>
<%@page import="board2.Board2DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2/wirtePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");

// 파일 사이즈 10M
int size = 10*1024*1024;
// 파일 저장 위치
String uploadPath = "D:\\workspace_jsp1\\Project01\\src\\main\\webapp\\img";

// MultiportRequest(request, 업로드파일, 파일사이즈, 인코딩, 동일 파일명일 경우)
MultipartRequest mpr = new MultipartRequest(
		request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());

Enumeration params = mpr.getParameterNames();
String name = mpr.getParameter("name");
String pass = mpr.getParameter("pass");
String subject = mpr.getParameter("subject");
String content = mpr.getParameter("content");
int readcount=0;
Enumeration files = mpr.getParameterNames();

String filename1 = mpr.getFilesystemName("filename1");
String filename2 = mpr.getFilesystemName("filename2");

// board2DTO 객체생성
Board2DTO board2DTO=new Board2DTO();
// set메서드 파라미터값 저장
// readcount 0 저장
board2DTO.setName(name);
board2DTO.setPass(pass);
board2DTO.setSubject(subject);
board2DTO.setContent(content);
board2DTO.setFilename1(filename1);
board2DTO.setFilename2(filename2);
board2DTO.setReadcount(readcount);

// board2DAO 객체생성
Board2DAO board2DAO=new Board2DAO();
// 리턴값 없음 insertboard2(board2DTO board2DTO) 메서드 정의
// insertboard2(board2DTO) 메서드호출
board2DAO.insertboard2(board2DTO);
// notice.jsp 이동
response.sendRedirect("reference.jsp");
%>
</body>
</html>