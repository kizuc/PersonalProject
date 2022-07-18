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
<link href="../css/sub.css" rel="stylesheet">
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
<h2 class="fw-bolder">From our blog</h2>
<p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eaque fugit ratione dicta mollitia. Officiis ad.</p>
</div>
</div>
</div>
<!-- 	<table> -->
<!-- 	<tr> -->
<%--   	 <% --%>
<!-- //   	 for(int i=0;i<oboardList.size();i++){ -->
<!-- // 		 OboardDTO oboardDTO=(OboardDTO)oboardList.get(i); -->
<%-- 		 %> --%>
<!-- 		<td> -->
<!-- 		      <div class="col-lg-4 mb-5"> -->
<!--                 <div class="card h-90 shadow border-0"> -->
<!--                     <div class="card-body p-4"> -->
<!--                         <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div> -->
<!--                         <a class="text-decoration-none link-dark stretched-link" href="#!"> -->
<!--                         <h1 class="fw-bolder mb-3"> -->
<!--                         몇월며칠 몇 시<br> -->
<!--                         어디에서 <br> -->
<!--                         뭐뭐 먹을<br> -->
<!--                         2명 구합니다!</h1></a> -->
<!--                         <p class="lead fw-normal text-muted mb-5">맛있게 드실 분 </p> -->
<!--                     </div> -->
<!--                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0"> -->
<!--                         <div class="d-flex align-items-end justify-content-between"> -->
<!--                             <div class="d-flex align-items-center"> -->
<!--                                 <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." /> -->
<!--                                 <div class="small"> -->
<!--                                     <div class="fw-bold">Kelly Rowan</div> -->
<!--                                     <div class="text-muted">March 12, 2022 &middot; 6 min read</div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<%-- 		<%=oboardDTO.getNum()%> --%>
<%-- 		<%=oboardDTO.getFdate()%> --%>
<%-- 		<%=oboardDTO.getFaddress()%> --%>
<%-- 		<%=oboardDTO.getWfood()%> --%>
<%-- 		<%=oboardDTO.getNof()%> --%>
<%-- 		<%=oboardDTO.getPeople()%> --%>
<%-- 		<%=oboardDTO.getOoption()%> --%>
<%-- 		<%=oboardDTO.getEtc()%> --%>
<!-- 		<h1 class="fw-bolder mb-3"> -->
<!-- 	    몇월며칠 몇 시<br> -->
<!-- 	    어디에서 <br> -->
<!-- 	    뭐뭐 먹을<br> -->
<!-- 	    2명 구합니다!</h1> -->
<!-- 		<p class="lead fw-normal text-muted mb-5">맛있게 드실 분 </p> -->
<!-- 			</td>    -->
<%-- 		<% --%>
<!-- // 		  if((i+1)%3==0) { -->
<%-- 		  	%></tr><tr><% --%>
<!-- // 		  } -->
<!-- // 	   } -->
<%-- 	   %>  --%>
<!-- 	</tr>	  -->
<!-- 	</table> -->
	<%
	// gboardDAO 객체생성
	OboardDAO oboardDAO=new OboardDAO();
	
	// 한 페이지에 보여줄 글 개수
	int pageSize=3;
	String pageNum=request.getParameter("pageNum");
	
	if(pageNum==null)	pageNum= "1";	// 페이지 번호 가져오기
	 
	int currentPage=Integer.parseInt(pageNum);	// 페이지 번호를 정수형으로 변경
	int startRow=(currentPage-1)*pageSize+1;	// 시작 행
	int endRow=startRow+pageSize-1;				// 끝나는 행
	 
	// List gboardList = getgboardList()메서드 호출
	List oboardList=oboardDAO.getOboardList(startRow,pageSize);
	%>
	<table id="notice">
	<tr>
	   <%
	   //날짜 => 문자열 모양변경
	   for(int i=0;i<oboardList.size();i++){
		   OboardDTO oBoardDTO=(OboardDTO)oboardList.get(i);
		   %>
		<td>
		<!-- 글 번호 출력 -->
		<%-- <%=i+1 %> --%>
		<span class="fw-bold6 pt-6"><%=oBoardDTO.getFdate() %></span>
		<span class="text-end ps-1"><%=oBoardDTO.getPeople() %></span>
		</td>   
		<%
		  if((i+1)%3==0) {
		  	%></tr><tr><%
		  }
	   }
	   %> 
	</tr>	 
	<!-- for문 안에 있던 tr을 for문 밖으로 뺌(수평으로 td를 여러 개 만들기 위함) -->
	</table>

<!--             <div class="col-lg-4 mb-5"> -->
<!--                 <div class="card h-90 shadow border-0"> -->
<!--                     <div class="card-body p-4"> -->
<!--                         <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div> -->
<!--                         <a class="text-decoration-none link-dark stretched-link" href="#!"> -->
<!--                         <h1 class="fw-bolder mb-3"> -->
<!--                         몇월며칠 몇 시<br> -->
<!--                         어디에서 <br> -->
<!--                         뭐뭐 먹을<br> -->
<!--                         2명 구합니다!</h1></a> -->
<!--                         <p class="lead fw-normal text-muted mb-5">맛있게 드실 분 </p> -->
<!--                     </div> -->
<!--                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0"> -->
<!--                         <div class="d-flex align-items-end justify-content-between"> -->
<!--                             <div class="d-flex align-items-center"> -->
<!--                                 <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." /> -->
<!--                                 <div class="small"> -->
<!--                                     <div class="fw-bold">Kelly Rowan</div> -->
<!--                                     <div class="text-muted">March 12, 2022 &middot; 6 min read</div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="col-lg-4 mb-5"> -->
<!--                 <div class="card h-90 shadow border-0"> -->
<!--                     <div class="card-body p-4"> -->
<!--                         <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div> -->
<!--                         <a class="text-decoration-none link-dark stretched-link" href="#!"> -->
<!--                         <h1 class="fw-bolder mb-3"> -->
<!--                         몇월며칠 몇 시<br> -->
<!--                         어디에서 <br> -->
<!--                         뭐뭐 먹을<br> -->
<!--                         2명 구합니다!</h1></a> -->
<!--                         <p class="lead fw-normal text-muted mb-5">맛있게 드실 분 </p> -->
<!--                     </div> -->
<!--                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0"> -->
<!--                         <div class="d-flex align-items-end justify-content-between"> -->
<!--                             <div class="d-flex align-items-center"> -->
<!--                                 <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." /> -->
<!--                                 <div class="small"> -->
<!--                                     <div class="fw-bold">Kelly Rowan</div> -->
<!--                                     <div class="text-muted">March 12, 2022 &middot; 6 min read</div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <!-- Call to action-->
        <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
            <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                <div class="mb-4 mb-xl-0">
                    <div class="fs-3 fw-bold text-white">New products, delivered to you.</div>
                    <div class="text-white-50">Sign up for our newsletter for the latest updates.</div>
                </div>
                <div class="ms-xl-4">
                    <div class="input-group mb-2">
                        <input class="form-control" type="text" placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" />
                        <button class="btn btn-outline-light" id="button-newsletter" type="button">Sign up</button>
                    </div>
                    <div class="small text-white-50">We care about privacy, and will never share your data.</div>
                </div>
            </div>
        </aside>
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
