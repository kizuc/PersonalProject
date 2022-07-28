<%@page import="comment.CommentDTO"%>
<%@page import="comment.CommentDAO"%>
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
<title>한끼가치 - 문의</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/sub.css" rel="stylesheet">
<body class="d-flex flex-column">
<main class="flex-shrink-0">
<!-- Navigation-->
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
<!-- Page Content-->
<section class="py-3">
<div class="container px-5 my-3">
<div class="row gx-5">
<jsp:include page="../inc/contactMenu.jsp"></jsp:include>
<div class="col-lg-9">
<div class="text-start mb-5"><br>
<h1 class="fw-bolder">문의 게시판</h1>
<div class="text-muted mb-2">보내주시는 문의 사항은 최대한 신속하게 답변해 드리겠습니다</div><br>
	<%
	
	String id=(String)session.getAttribute("id");
	// int num 파라미터 가져오기
	int num=Integer.parseInt(request.getParameter("num"));
	// BoardDAO 객체생성
	BoardDAO boardDAO=new BoardDAO();
	// 조회수 1증가
	boardDAO.updateReadCount(num);
	// BoardDTO boardDTO = getBoard(num)메서드 호출
	BoardDTO boardDTO=boardDAO.getBoard(num);
	SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY.MM.dd");
	id=(String)session.getAttribute("id");
	if(id!=null){
		// 글쓴이 일치하면 글 수정, 삭제 버튼 보임
		if(id.equals(boardDTO.getName())){
			%>
			<div class="text-end mb-3">
			<input type="button" value="글수정" class="btn btn-primary btn-sm" onclick="location.href='update.jsp?num=<%=boardDTO.getNum()%>'">
			<input type="button" value="글삭제" class="btn btn-outline-primary btn-sm" onclick="location.href='delete.jsp?num=<%=boardDTO.getNum()%>'">
			</div>
			<%
		// 관리자면 글 삭제 버튼 보임
		
		}else if(id.equals("admin")){
			%>
			<div class="text-end mb-3">
			<input type="button" value="글삭제" class="btn btn-outline-primary btn-sm" onclick="location.href='delete.jsp?num=<%=boardDTO.getNum()%>'">
			</div>
			<%
		}
	}
	%>
	<article>
	<table>
	<tr>
		<th><h5 class="pt-2 fw-bolder"><%=boardDTO.getSubject() %></h5></th>
	</tr>
	<tr>
		<td id="t2"><%=boardDTO.getName() %> 
		<span class="span1"> <%=dateFormat.format(boardDTO.getDate()) %> | 조회 수 : <%=boardDTO.getReadcount() %></span></td>
	</tr>
	</table>
	<%=boardDTO.getContent() %>
	
	<%
	CommentDAO commentDAO = new CommentDAO();
	
	int pageSize=10;
	
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";	
	}
	
	int currentPage=Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	int endRow=startRow+pageSize-1;
	
	List commentList = commentDAO.getCommentList(startRow, pageSize, boardDTO.getNum());
	%>
	
	<hr>
	<table id="notice">
	<tr><th class="thcomment" colspan="2" align="center">댓글</th></tr>
	<%
	   //날짜 => 문자열 모양변경
	   dateFormat=new SimpleDateFormat("yyyy.M.dd");
	   for(int i=0;i<commentList.size();i++){
		   CommentDTO commentDTO=(CommentDTO)commentList.get(i);
		   %>
		<tr class="tcomment">
			<td class="tcomment">
			<input type="text" name="commentID" value="<%=commentDTO.getCommentID()%>" hidden>
			<input type="text" name="boardID" value="<%=boardDTO.getNum()%>" hidden>
			<%=commentDTO.getUserID()%> | <%=dateFormat.format(commentDTO.getCommetDate())%>
			<a href="deleteComment.jsp" onclick="window.open(this.href, '_blank', 'width=300, height=200'); return false;">M</a>
			<input value="삭제" type="button" onclick="checkConfirm('<%=commentDTO.getCommentID()%>')">
			<br>
			<%=commentDTO.getContent() %><br>
			</td>
		</tr>
		   <%
	   }
	   %> 
	</table>
	<form action="commentPro.jsp?num=<%=boardDTO.getNum() %>" id="comment_fr" name="fr" method="post" >
	<table>
	<tr>
		<th class="th2" align="left"><input type="text" value="댓글 작성자 : <%=id %>" name="id" readonly style="border:0"/>
	</tr>
	<tr>
		<td><textarea rows="2" cols="80" name="comment" id="comment" ></textarea>
		<input type="submit" value="등록" id="comment_click">
		</td>
	</tr>
	</table>
	</form>
	
<div class="clear"></div>
<div id="page_control"></div>
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
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
<<<<<<< HEAD
<script type="text/javascript">
function checkConfirm(commentID){
	var result = confirm("댓글을 삭제하시겠습니까?");
	if(!result) return false;

	location.href='deleteComment.jsp?commentID=' + commentID;
}
	
</script>
</html>
=======
</html>
>>>>>>> refs/remotes/origin/main
