<%@page import="oboard.OboardDAO"%>
<%@page import="java.util.List"%>
<%@page import="oboard.OboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>한끼가치</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet">
</head>
  
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<!-- top-->
<jsp:include page="../inc/top.jsp"></jsp:include>
     <!-- Header-->
     <header class="bg-pic py-8">
      <div class="container px-5">
       <div class="row gx-5 align-items-center justify-content-center">
        <div class="col-lg-8 col-xl-7 col-xxl-6">
         <div class="my-5 text-center text-xl-start">
           <h1 class="display-2 fw-bolder text-white mb-2">즐거움을 나누면 <br>배가 됩니다</h1><br>
           <p class="lead fw-bold1 text-white-50 mb-4">가끔은 혼밥도 심심할 때! <br>다양하게 즐기고 싶을 때!<br>한 끼의 즐거움을 나눠보세요!</p>
           <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
              <a class="btn btn-primary btn-lg px-4 me-sm-3" href="../orderboard/oboard.jsp">식사메이트 찾아볼까?</a>
              <a class="btn btn-outline-light btn-lg px-4" href="../board/board.jsp">Contact</a>
           </div>
         </div>
        </div>
        <div class="col-xl-2 col-xxl-6 d-none d-xl-block">
    <%
	// oboardDAO 객체생성
	OboardDAO oboardDAO=new OboardDAO();
	
	// 한 페이지에 보여줄 글 개수
	int pageSize=1;
	String pageNum=request.getParameter("pageNum");
	
	if(pageNum==null)	pageNum= "1";	// 페이지 번호 가져오기
	 
	int currentPage=Integer.parseInt(pageNum);	// 페이지 번호를 정수형으로 변경
	int startRow=(currentPage-1)*pageSize+1;	// 시작 행
	int endRow=startRow+pageSize-1;				// 끝나는 행
	 
	// List gboardList = getgboardList()메서드 호출
	List oBoardList=oboardDAO.getOboardList(startRow,pageSize);
	%>
	<table>
	<tr>
	   <%
	   //날짜 => 문자열 모양변경
	   for(int i=0; i<oBoardList.size(); i++){
		   OboardDTO oBoardDTO=(OboardDTO)oBoardList.get(i);
		   %>
		<td>
        <div class="card h-75 shadow border-0">
        <div class="card-body p-4">
        <div class="badge bg-primary bg-gradient rounded-pill mt-2 mb-2">
        <%=oBoardDTO.getOoption()%>
        </div>
        <a class="text-decoration-none link-dark stretched-link" href="#!">
         <%
		// 날짜시간 분해하기(mm월 dd일 hh)
         String dateData=oBoardDTO.getFdate();
         String mm=dateData.split("T")[0].split("-")[1].trim();
         
        // 월이 0부터 시작하면 0 지우기 
 		 String zero="0";
 		if(mm.substring(0,1).equals(zero)){
			 mm=mm.substring(1);
		 }
         
         String dd=dateData.split("T")[0].split("-")[2].trim();
         String hh=dateData.split("T")[1].trim();
        
      	// 시간이 0부터 시작하면 0 지우기 
  		if(hh.substring(0,1).equals(zero)){
  			hh=hh.substring(1);
		 }
         
         %>
         <h1 class="fw-bolder mb-3">
         <%=mm%>월 <%=dd%>일 <%=hh%> <br>
         <%=oBoardDTO.getFaddress()%>에서 <br>
         <%=oBoardDTO.getWfood()%> 먹을<br>
         <%=oBoardDTO.getPeople()%> 구합니다!</h1></a>
         <p class="lead fw-normal text-muted mb-5">
         <%=oBoardDTO.getNof()%><br>
		 <%=oBoardDTO.getEtc()%>
         </p>
         </div>
		</div>
		</td>   
		<%
		  if((i+1)%1==0) {
			  	%></tr><tr><%
		  }

	   }
	   %> 
	</tr>	 
	</table>
    <%
	int pageBlock=1;	// 한 페이지에 보여줄 페이지 개수 설정
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;	// 시작 페이지
	int endPage=startPage+pageBlock-1;						// 끝나는 페이지
		
	int count=oboardDAO.getOboardCount();		// 전체 글 개수
	int pageCount=count / pageSize+(count%pageSize==0?0:1);	// 전체 페이지 개수 구하기
	if(endPage > pageCount)		endPage = pageCount;	
	%>
	<div id="page_control">
	<%
	if(startPage > pageBlock) {
		%>
		<a href="main.jsp?pageNum=<%=startPage-pageBlock%>"><</a>
		<%
	}
	for(int i=startPage;i<=endPage;i++){
		%>
		<a href="main.jsp?pageNum=<%=i%>"></a> 
		<%
	}
	if(endPage < pageCount) {
		%>
		<a href="main.jsp?pageNum=<%=startPage+pageBlock%>">></a>
		<%
	}
	%>
	</div>
        </div>
       </div>
      </div>
     </header>
</main>
<!-- Footer-->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
