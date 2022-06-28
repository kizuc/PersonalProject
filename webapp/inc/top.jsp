<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% --%>
<!-- String id=(String)session.getAttribute("id"); -->
<%-- %> --%>
        <link href="css/styles.css" rel="stylesheet" />
<nav class="navbar navbar-expand-lg navbar-dark bg-pic">
    <div class="container px-5">
        <a class="navbar-brand" href="main.jsp">Hello World!</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="main.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
<!--                 <li class="nav-item"><a class="nav-link" href="contact.jsp">회원가입</a></li> -->
                <li class="nav-item"><a class="nav-link" href="portfolio.jsp">Portfolio</a></li>
                <li class="nav-item"><a class="nav-link" href="faq.jsp">Contact</a></li>
            </ul>
        </div>
         <div class="col-auto">
            <a class="link-light small" href="join.jsp">회원가입</a>
            <span class="text-white mx-1">&middot;</span>
            <a class="link-light small" href="login.jsp">로그인</a>
        </div>
    </div>
</nav>