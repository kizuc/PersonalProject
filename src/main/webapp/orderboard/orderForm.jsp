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
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body class="d-flex flex-column h-90">
<main class="flex-shrink-0">
<!-- Navigation-->
<jsp:include page="../inc/top.jsp"></jsp:include>
<div class="bg-primary py-4 px-4 px-md-5 mb-5">
<div class="text-center mb-5">
<!-- <h1 class="fw-bold2 py-3" >같이 드실 분!</h1> -->
</div>
<div class="row gx-5 justify-content-center">
<div class="col-lg-8 col-xl-6">
<%
// 세션값 가져오기(로그인한 사람만 보이게)
String id=(String)session.getAttribute("id");
MemberDAO memberDAO=new MemberDAO();
MemberDTO memberDTO=memberDAO.getMember(id);
%>
	<form action="joinPro.jsp" id="contactForm" name="fr" data-sb-form-api-token="API_TOKEN" method="post" onsubmit="return checkSubmit()">
     <!-- id input-->
     <div class="form-floating mb-3">
         <input type="hidden" name="id" id="id" value="<%=id %>">
         		<%
		// 아이디가 있으면 닉네임이 보이게(닉네임이 없으면 기본값으로 익명이 뜬다)
		if(id!=null){
			%>
        	<input class="form-control3" name="nickname" id="nickname" type="text" value="<%=memberDTO.getNickname() %>" data-sb-validations="required" />
			<%
		// 아이디가 없으면 닉네임이 적히지 않게
		}else if(id==null){
			%>
        	<input class="form-control3" name="nickname1" id="nickname1" type="text" placeholder="닉네임" data-sb-validations="required" />
			<%
		}
		%>
        <span class="lead fw-bold3 text-black-40 mb-3 pe-3">(이)랑 같이</span>
        <input class="form-control3" name="fdate" id="fdate" type="datetime-local" placeholder="언제" data-sb-validations="required,date" />
        <span class="lead fw-bold3 text-black-40 mb-3">에</span>
     </div>
     <div class="form-floating mb-4">
         <input class="form-control4" name="faddrees" id="faddrees" type="text" placeholder="어디 음식점" data-sb-validations="required,date" />
         <span class="lead fw-bold3 text-black-40 mb-3 pe-3">에서 </span>
         <input class="form-control3" name="wfood" id="wfood" type="text" placeholder="어떤 음식을" data-sb-validations="required,date" />
         <span class="lead fw-bold3 text-dark-40 mb-3">먹어요!</span>
     </div>
		<%
		// 아이디가 있으면 글 쓸 수 있게
		if(id!=null){
		%>
		<details>
			<summary class="lead fw-bold5 text-dark-40 mb-3">+ 조금 더 추가하자면</summary>
	     <hr>
	     <div class="form-floating mb-4">
	     <span class="lead fw-bold4 text-light-40 mb-3">
	      	<input class="form-check-input" type="checkbox" name="nof" value="해산물"> 해산물 
	      	<input class="form-check-input" type="checkbox" name="nof" value="술"> 술 
	      	<input class="form-check-input" type="checkbox" name="nof" value="매운음식"> 매운 음식 
	      	<input class="form-check-input" type="checkbox" name="nof" value="느끼한음식"> 느끼한 음식 
	      	<input class="form-check-input" type="checkbox" name="nof" value="딱딱한음식"> 딱딱한 음식 
	     </span>  
	     <span class="lead fw-bold2 text-dark-40 mb-3"> 은 힘들고</span>
	     </div>
	     <div class="form-floating mb-0">
	        <select class="form-control5" name="people">
				<option value="1명" selected>1명</option>
				<option value="2명">2명</option>
				<option value="3명">3명</option>
				<option value="인원은 조율">인원은 조율</option>
				<option value="몇 명이라도 OK!">몇 명이라도 OK!</option>
				</select> 
				<span class="lead fw-bold2 text-dark-40 mb-3"> 에 </span>
	     
	        <select class="form-control5" name="option">
				<option value="맛있게 먹으실 분" selected>맛있게 먹으실 분</option>
				<option value="조용히 밥만 먹으실 분">조용히 밥만 먹으실 분</option>
				<option value="이야기도 나누실 분">이야기도 나누실 분</option>
				<option value="2차도 가실 분">2차도 가실 분</option>
				</select> 
				<span class="lead fw-bold2 text-dark-40 mb-2">이면 좋겠어요!</span><br><br>
	     </div>
	     <div class="form-floating">
	         <input class="form-control" name="etc" id="etc" type="text" placeholder="기타사항" data-sb-validations="required" />
	         <label for="etc">기타 사항</label><br>
	     </div>
		</details>
			<div class="float-end"><input type="submit" class="btn btn-dark btn-lg" onclick="fun1()" value="올리기">
    		<input type="reset" class="btn btn-outline-light btn-lg" id="cancel" type="reset" value="다시 쓰기"></div>
		<%
		// 아이디가 없으면 로그인 하게
		}else if(id==null){
			%>
			<p class="lead fw-white fw-bolder text-white text-end mb-2">글 등록은 로그인한 회원만 할 수 있어요😥</p>
			<div class="float-end"><input type="button" class="btn btn-dark btn-lg" value="로그인 하러가기" onclick="location.href='../member/login.jsp'">
    		<input type="button" class="btn btn-dark btn-lg" value="회원가입 하러가기" onclick="location.href='../member/join.jsp'"></div>
			<%
		}
		%>
	</form>
</div>
</div>
</div>
<!-- Blog preview section-->
<section class="py-2">
    <div class="row gx-6 justify-content-center">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-8 col-xl-6">
                <div class="text-center">
                    <h2 class="fw-bolder">From our blog</h2>
                    <p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eaque fugit ratione dicta mollitia. Officiis ad.</p>
                </div>
            </div>
        </div>
        <div class="row gx-6">
            <div class="col-lg-4 mb-5">
                <div class="card h-90 shadow border-0">
                    <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                        <a class="text-decoration-none link-dark stretched-link" href="#!">
                        <h1 class="fw-bolder mb-3">
                        몇월며칠 몇 시<br>
                        어디에서 <br>
                        뭐뭐 먹을<br>
                        2명 구합니다!</h1></a>
                        <p class="lead fw-normal text-muted mb-5">맛있게 드실 분 </p>
                    </div>
                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                <div class="small">
                                    <div class="fw-bold">Kelly Rowan</div>
                                    <div class="text-muted">March 12, 2022 &middot; 6 min read</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-5">
                <div class="card h-90 shadow border-0">
                    <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                    <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                        <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Another blog post title</h5></a>
                        <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                <div class="small">
                                    <div class="fw-bold">Josiah Barclay</div>
                                    <div class="text-muted">March 23, 2022 &middot; 4 min read</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-5">
                <div class="card h-90 shadow border-0">
                    <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
                    <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                        <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">The last blog post title is a little bit longer than the others</h5></a>
                        <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                <div class="small">
                                    <div class="fw-bold">Evelyn Martinez</div>
                                    <div class="text-muted">April 2, 2022 &middot; 10 min read</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
