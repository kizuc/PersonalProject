<%@page import="board.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet">
        <link href="../css/sub.css" rel="stylesheet">
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
         <!-- Navigation-->
           <jsp:include page="../inc/top.jsp"></jsp:include>
            <!-- Page content-->
            <section class="bg-light py-2">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-4 px-3 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">게시판</h1>
                            <p class="lead fw-normal text-muted mb-0">자유롭게 적어주세요</p>
                        </div>
<%
String id=(String)session.getAttribute("id");
//세션값이 없으면 login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();
// getBoard()
BoardDTO boardDTO=boardDAO.getBoard(num);
%>
<article>
<h1>Notice Update</h1>
<form action="updatePro.jsp" method="post">

<input type="hidden" name="num" value="<%=boardDTO.getNum()%>">
<table>
<tr>
	<td>글쓴이</td>
	<td><input type="text" name="name" value="<%=id %>" readonly></td>
</tr>
<tr>
	<td>제목</td>
	<td><input type="text" name="subject" value="<%=boardDTO.getSubject()%>"></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea name="content" rows="8" cols="100"><%=boardDTO.getContent()%></textarea></td>
</tr>	
</table>
<div id="table_search">
<input type="submit" value="글수정" class="btn btn-primary btn-lg" id="submit">
<input type="button" value="글목록" class="btn btn-outline-primary btn-lg" onclick="location.href='board.jsp'">
</div>
</form>
<div class="clear"></div>
<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
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
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
