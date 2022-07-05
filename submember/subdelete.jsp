<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
	
	<%	// 데이터 없으면 로그인 페이지로 이동
	String id=(String)session.getAttribute("id");
	if(id==null)	response.sendRedirect("../member/login.jsp");
	%>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
          <jsp:include page="../inc/top.jsp"></jsp:include>
            <!-- Page Content-->
            <section class="bg-light py-4">
            <div class="container px-5 my-5">
            <div class="row gx-5">
            <jsp:include page="../inc/menumem.jsp"></jsp:include>
            <div class="col-lg-9">
            <!-- Post content-->
            <article>
            <!-- Post title-->
            <h3 class="fw-bolder mb-3">마이페이지</h3>
            <!-- Post meta content-->
 			<section class="bg-light py-4">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-7 px-2">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">회원 탈퇴</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-7">
                                <!-- * * SB Forms Contact Form * *-->
                                <form action="deletePro.jsp" id="join" method="post"id="contactForm" data-sb-form-api-token="API_TOKEN">
                                    <!-- id input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="id" id="id" type="text" value="<%=id %>" readonly>
                                        <label for="id">ID</label>
                                    </div>
                                     <!-- pass input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="password" name="pass" id="pass" type="text" placeholder="Enter your pass..." data-sb-validations="required" />
                                        <label for="pass">비밀번호</label>
                                    </div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button type="submit" class="btn btn-primary btn-lg" id="submit">정말 탈퇴하시겠습니까?</button></div><br>
                                    <div class="d-grid"><button type="reset" class="btn btn-outline-primary btn-lg" id="cancel" type="reset">아뇨!</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
            </section>
         </article></div></div></div>
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
