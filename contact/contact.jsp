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
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
    </head>
   	<%	// 데이터 없으면 로그인 페이지로 이동
	String id=(String)session.getAttribute("id");
	if(id==null)	response.sendRedirect("../member/login.jsp");
	%>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
          <jsp:include page="../inc/top.jsp"></jsp:include>
            <!-- Page Content-->
            <section class="py-4">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                    <jsp:include page="../inc/contactMenu.jsp"></jsp:include>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">마이페이지</h1>
                                    <!-- Post meta content-->
									<%
									//MemberDAO 객체생성
									MemberDAO memberDAO=new MemberDAO();
									// MemberDTO memberDTO = getMember(id) 메서드 호출
									MemberDTO memberDTO=memberDAO.getMember(id);
									%>
                                    <div class="text-muted fst-italic mb-2">
                                    <%=id%>님 
	                                </div>
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/300x300/ced4da/6c757d.jpg" alt="..." /></figure>
                                <!-- Post content-->
                                <section class="mb-5">
                                <%=memberDTO.getName()%> <br>
                                <%=memberDTO.getDate()%> <br>
                                <%=memberDTO.getAddress()%>
                                <%=memberDTO.getAddress2()%> <br>
                                </section>
                            </article>
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
