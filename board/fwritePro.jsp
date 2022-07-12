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
// request 파라미터 가져오기 pass name subject content
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int readcount=0;
// board2DTO 객체생성
Board2DTO board2DTO=new Board2DTO();
// set메서드 파라미터값 저장
// readcount 0 저장
board2DTO.setPass(pass);
board2DTO.setSubject(subject);
board2DTO.setContent(content);
board2DTO.setReadcount(readcount);

// board2DAO 객체생성
Board2DAO board2DAO=new Board2DAO();

// 실제로 서버에 저장되는 path    
String path=request.getRealPath("file");
out.println("절대경로 : " + path);
int size=1024*1024*10;	// 10m
String fileName="";		// 업로드한 파일 이름
String orginalFileName="";	// 서버에 중복된 파일 이름 존재할 경우

try{
	// DefaultFileRenamePolicy 중복된 이름이 존재할 때 처리
	// request, 파일저장경로, 용량, 인코딩타입, 중복타입명
	MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
	
	// 전송한 전체 파일이름 가져오기
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	
	fileName = multi.getFilesystemName(str);
	orginalFileName = multi.getOriginalFileName(str);
	
}catch(Exception e){
	e.printStackTrace();
}

// 리턴값 없음 insertboard2(board2DTO board2DTO) 메서드 정의
// insertboard2(board2DTO) 메서드호출
board2DAO.insertboard2(board2DTO);
// notice.jsp 이동
response.sendRedirect("reference.jsp");
%>
</body>
</html>