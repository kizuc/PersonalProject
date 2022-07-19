<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="oboard.OboardDTO"%>
<%@page import="oboard.OboardDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<link href="../css/sub2.css" rel="stylesheet">
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body class="d-flex flex-column h-90">
<main class="flex-shrink-0">
<!-- Navigation-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<jsp:include page="../inc/orderForm.jsp"></jsp:include>
<!-- Blog preview section-->
<section class="py-2">
<div class="row gx-3 justify-content-center">
<div class="row gx-5 justify-content-center">
<div class="col-lg-8 col-xl-6">
<div class="text-center">
<h2 class="fw-bolder">당신의 식사 메이트를 찾아보세요!</h2>
<p class="lead fw-normal text-muted mb-5">같이 가치있는 시간을 보내세요</p>
<input class="form-control4" name="search" id="search" type="text" placeholder="키워드를 적어주세요" data-sb-validations="required" />
<input type="submit" class="btn btn-primary btn-lg px-3 mb-sm-1" value="찾아보자!"><br><br><br>
</div>
</div>
</div>
	<%
	// oboardDAO 객체생성
	OboardDAO oboardDAO=new OboardDAO();
	
	// 한 페이지에 보여줄 글 개수
	int pageSize=3;
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
        <h1 class="fw-bolder mb-3">
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
        String nofData=oBoardDTO.getNof(); 
  		String nof=nofData.replace(",", ", ");
      	
         %>
         <%=mm%>월 <%=dd%>일 <%=hh%> <br>
         <%=oBoardDTO.getFaddress()%>에서 <br>
         <%=oBoardDTO.getWfood()%> 먹을<br>
         <%=oBoardDTO.getPeople()%> 구합니다!</h1></a>
         <p class="lead fw-normal text-muted mb-5">
         <%if(nof==null){
         	nof="";
         }else{
         %><%=nof%><br>
         <%
         }
         %>
		 <%=oBoardDTO.getEtc()%>
         </p>
         </div>
		</div>
		</td>   
		<%
		  if((i+1)%3==0) {
			  	%></tr><tr><%
		  }

	   }
	   %> 
	</tr>	 
	</table>
    <%
	int pageBlock=5;	// 한 페이지에 보여줄 페이지 개수 설정
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
		<a href="oboard.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
		<%
	}
	for(int i=startPage;i<=endPage;i++){
		%>
		<a href="oboard.jsp?pageNum=<%=i%>"><%=i %></a> 
		<%
	}
	if(endPage < pageCount) {
		%>
		<a href="oboard.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
		<%
	}
	%>
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
