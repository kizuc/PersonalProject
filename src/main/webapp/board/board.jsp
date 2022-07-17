<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>한끼가치 - 자료실</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/sub.css" rel="stylesheet">
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
<!-- top-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 이미지 -->
<div class="py-4 bg-light bg-pic2">
<div class="container px-5 my-5">
<div class="row gx-5 justify-content-center">
<div class="col-lg-10 col-xl-7">
</div>
</div>
</div>
</div>
<!-- 본문-->
<section class="py-3">
<div class="container px-5 my-3">
<div class="row gx-5">
<jsp:include page="../inc/contactMenu.jsp"></jsp:include>
<div class="col-lg-9">
<div class="text-start mb-5"><br>
<h1 class="fw-bolder">문의 게시판</h1>
<div class="text-muted mb-2">보내주시는 문의 사항은 최대한 신속하게 답변해 드리겠습니다</div><br>
<!-- Post content-->
	<%
	// BoardDAO 객체생성
	BoardDAO boardDAO=new BoardDAO();
	   
	int pageSize=5;	// 한 페이지에 보여줄 글 개수
	String pageNum=request.getParameter("pageNum");
		
	if(pageNum==null)	pageNum= "1";	// 페이지 번호 가져오기
	
	int currentPage=Integer.parseInt(pageNum);	// 페이지 번호를 정수형으로 변경
	int startRow=(currentPage-1)*pageSize+1;	// 시작 행
	int endRow=startRow+pageSize-1;				// 끝나는 행
	
	// List boardList = getBoardList()메서드 호출
	List boardList=boardDAO.getBoardList(startRow,pageSize);
	%>
	<article>
	<table>
	<tr>
		<th id="tnum">No.</th>
	    <th id="ttitle">제목</th>
	    <th id="twrite">작성자</th>
	    <th id="tdate">작성일</th>
	    <th id="tnum">조회</th>
	</tr>
	<%
	//날짜 => 문자열 모양변경
	SimpleDateFormat dateFormat=new SimpleDateFormat("M.d.YYYY");
	for(int i=0;i<boardList.size();i++){
	BoardDTO boardDTO=(BoardDTO)boardList.get(i);
	%>
	<tr onclick="location.href='content.jsp?num=<%=boardDTO.getNum()%>'" style='cursor:pointer'>
		<td id="tnum"><%=boardDTO.getNum() %></td>
	    <td id="ttitle"><%=boardDTO.getSubject() %></td>
	    <td id="twrite"><%=boardDTO.getName() %></td>
	    <td id="tdate"><%=dateFormat.format(boardDTO.getDate()) %></td>
	    <td id="tnum"><%=boardDTO.getReadcount() %></td>
	</tr>	   
	<%
	}
	%> 
	</table>
	<div>
	<%
	// 세션값 가져오기(로그인한 사람만 보이게)
	String id=(String)session.getAttribute("id");
	// 세션값이 있으면 글쓰기 버튼 보이기
	if(id!=null){
		%>
		<div class="text-end mb-3">
		<input type="button" class="btn btn-primary btn-lg" value="글쓰기" onclick="location.href='write.jsp'">
		</div>
		<%
	}
	%>
	<input type="text" name="search" class="input_box">
	<input type="button" value="search">
	</div>
	<%
	int pageBlock=5;	// 한 페이지에 보여줄 페이지 개수 설정
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;	// 시작 페이지
	int endPage=startPage+pageBlock-1;						// 끝나는 페이지
		
	int count=boardDAO.getBoardCount();		// 전체 글 개수
	int pageCount=count / pageSize+(count%pageSize==0?0:1);	// 전체 페이지 개수 구하기
	if(endPage > pageCount)		endPage = pageCount;	
	%>
<div id="page_control">
	<%
	if(startPage > pageBlock) {
		%>
		<a href="board.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
		<%
	}
	for(int i=startPage;i<=endPage;i++){
		%>
		<a href="board.jsp?pageNum=<%=i%>"><%=i %></a> 
		<%
	}
	if(endPage < pageCount) {
		%>
		<a href="board.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
		<%
	
	}
	%>
</div>
</article>
</div>
</div>
</div>
</div>
</section>
</main>
<!-- Footer-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
