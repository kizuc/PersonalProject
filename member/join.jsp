<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>member/join.jsp</title>
     
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="../css/styles.css" rel="stylesheet">
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <jsp:include page="../inc/top.jsp"></jsp:include>
            <!-- Page content-->
            <section class="bg-light py-2">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-4 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                            <i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">회원가입</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">

                                <legend class="fs-6">기본 정보</legend>
                                <form action="joinPro.jsp" id="contactForm" name="fr" data-sb-form-api-token="API_TOKEN" method="post">
                                    <!-- id input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="id" id="id" type="text" placeholder="Enter your ID..." data-sb-validations="required" />
                                        <label for="id">ID</label>
                                        <div class="invalid-feedback" data-sb-feedback="id:required">ID은 필수 입력사항 입니다.</div>
										<div class="d-grid"><button class="btn btn-primary btn-lg" type="button" id="duplecheck" onclick="winopen()">ID 중복 확인</button></div><br>
                                    </div>
                                     <!-- pass input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="password" name="pass" id="pass" type="text" placeholder="Enter your pass..." data-sb-validations="required" />
                                        <label for="pass">비밀번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="pass:required">비밀번호는 필수 입력사항 입니다.</div>
                                    </div>
                                     <!-- pass2 input-->
                                    <div class="form-floating mb-4">
                                        <input class="form-control" type="password" name="pass2" id="pass2" type="text" placeholder="Enter your pass2..." data-sb-validations="required" />
                                        <label for="pass2">비밀번호 확인</label>
                                        <div class="invalid-feedback" data-sb-feedback="pass2:required">비밀번호 확인은 필수 입력사항 입니다.</div>
                                    </div><br>
                                     <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="name" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                        <label for="name">이름</label>
                                        <div class="invalid-feedback" data-sb-feedback="name:required">이름은 필수 입력사항 입니다.</div>
                                    </div>
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="email" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email">email</label>
                                        <div class="invalid-feedback" data-sb-feedback="email:required">메일은 필수 입력사항 입니다.</div>
                                        <div class="invalid-feedback" data-sb-feedback="email:email">메일 형식에 맞지 않습니다.</div>
                                    </div>
                                    <!-- Email2 address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="email2" id="email2" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email2">email 확인</label>
                                        <div class="invalid-feedback" data-sb-feedback="email2:required">메일 확인은 필수 입력사항 입니다.</div>
                                        <div class="invalid-feedback" data-sb-feedback="email2:email">메일 형식에 맞지 않습니다.</div>
                                    </div><br>
                                    <hr>
                                   <legend class="fs-6">선택 사항</legend>
                                    <!--  address number input-->
                                    <div class="form-floating mb-3">
                                     	<input class="form-control2" name="address" id="address" placeholder="(우편번호) 주소" data-sb-validations="required" style=margin-right:0px readonly>
                                      	<div class="d-grid gap-2 d-sm-inline-flex justify-content-sm-end justify-content-xl-end">
                                    	<a class="btn btn-primary btn-lg px-3 mb-sm-1" id="addresskakao" href="#features">주소 찾기</a></div>
                                    </div>
                                      <!-- Phone address2 input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="address2" id="address2" placeholder="OOO동 OOO호" data-sb-validations="required" />
                                        <label for="address2">상세 주소</label>
                                    </div>
                                      <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="phone" id="phone" type="tel" placeholder="051-123-4567" data-sb-validations="required" />
                                        <label for="phone">전화 번호</label>
                                    </div>
                             
                                      <!-- mobile number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="mobile" id="phone" type="tel" placeholder="010-123-4567" data-sb-validations="required" />
                                        <label for="phone">폰 번호</label><br>
                                    </div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"><input class="btn btn-primary btn-lg" onclick="fun1()" value="회원가입"></div><br>
                                    <div class="d-grid"><input type="reset" class="btn btn-outline-primary btn-lg" id="cancel" type="reset" value="취소"></div>
                                </form>
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
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function fun1() {
	
	if(document.fr.id.value.length < 4 || document.fr.id.value.length > 10){
		alert("정말 삭제하시겠습니까?");
		return;
	}
	if(document.fr.pass.value == ""){
		alert("비밀번호를 입력하세요");
		document.fr.pass.focus();
		return;
	}
	if(document.fr.pass.value.length<4 || document.fr.pass.value.length>10){
		alert("비밀번호는 4 ~ 10자로 입력하세요");
		document.fr.pass.focus();
		return;
	}
	if(document.fr.pass2.value!=document.fr.pass.value){
		alert("비밀번호가 일치하지 않습니다");
		document.fr.pass2.focus();
		return;
	}
	if(document.fr.name.value == ""){
		alert("이름을 입력하세요");
		document.fr.name.focus();
		return;
	}
	if(document.fr.email.value == ""){
		alert("이메일을 입력하세요");
		document.fr.pass.focus();
		return;
	}
	if(document.fr.email2.value == ""){
		alert("이메일 확인란을 입력하세요");
		document.fr.pass.focus();
		return;
	}
	if(document.fr.email.value!=document.fr.email2.value){
		alert("이메일이 일치하지 않습니다");
		document.fr.pass.focus();
		return;
	}
	document.fr.submit();
	
}
function winopen() {
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	//1. 아이디가 없으면 알림창과 진행x
	if(document.fr.id.value =="" || document.fr.id.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.fr.id.value="";
		document.fr.id.focus();
	}else{
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		window.open("idCheck.jsp?userid="+document.fr.id.value,"","width=450, height=300, left=100, top=100");
		document.fr.id.value="";
	}
}
</script>
<script type="text/javascript">
window.onload = function(){
    document.getElementById("addresskakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
    	 //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	
            	document.getElementById("address").value = " (" + data.zonecode + ") "+data.address; // 우편번호 입력
                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>