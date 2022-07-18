<%@page import="board2.Board2DTO"%>
<%@page import="board2.Board2DAO"%>
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
// 한글처리
int maxSize=10*1024*1024;
// 실제경로 담기
String uploadPath=request.getRealPath("/upload");
MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// 파라미터 가져오기
int num=Integer.parseInt(multi.getParameter("num"));
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");

// file 파라미터 가져오기
String file=multi.getFilesystemName("file");

// file 없을 때 이전 파일 나오게
if(file==null) {
	file=multi.getParameter("oldfile");
}
// board2DTO 객체생성
Board2DTO board2DTO=new Board2DTO();
// set메서드 호출 - 파라미터값 저장
board2DTO.setNum(num);
board2DTO.setSubject(subject);
board2DTO.setContent(content);
// 파일 저장
board2DTO.setFile(file);

//board2DAO 객체생성
Board2DAO board2DAO=new Board2DAO();
// 글 수정 메서드 호출
board2DAO.updateBoard2(board2DTO);
// 자료실로 이동
response.sendRedirect("reference.jsp");
%>
</body>
</html>