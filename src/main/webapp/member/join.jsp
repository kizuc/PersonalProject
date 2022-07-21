<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
<title>한끼가치 - 회원가입</title>

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
                    <form action="joinPro.jsp" id="contactForm" name="fr" data-sb-form-api-token="API_TOKEN" method="post" onsubmit="return(fun1())">
                        <!-- id input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" name="id" id="id" type="text" placeholder="Enter your ID..." data-sb-validations="required" />
                            <label for="id">ID</label>
							<div class="d-grid"><button class="btn btn-primary btn-lg" type="button" id="duplecheck" onclick="winopen()">ID 중복 확인</button></div><br>
                        </div>
                         <!-- pass input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" type="password" name="pass" id="pass" type="text" placeholder="Enter your pass..." data-sb-validations="required" onkeyup="checkPass(this.value)"/>
                            <label for="pass">비밀번호</label><span id="checkPassResult"><!-- 패스워드 규칙 판별 결과 표시 영역 --></span>
                        </div>
                         <!-- pass2 input-->
                        <div class="form-floating mb-4">
                            <input class="form-control" type="password" name="pass2" id="pass2" type="text" placeholder="Enter your pass2..." data-sb-validations="required" onblur="checkRetypePass(this.value)"/>
                            <label for="pass2">비밀번호 확인</label><span id="checkRetypePassResult"><!-- 패스워드 일치 여부 표시 영역 --></span>
                        </div><br>
                         <!-- Name input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" name="name" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                            <label for="name">이름</label>
                        </div>
                        <!-- Email address input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" name="email" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                            <label for="email">email</label>
                            <div class="invalid-feedback" data-sb-feedback="email:email">메일 형식에 맞지 않습니다.</div>
                        </div>
                        <!-- Email2 address input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" name="email2" id="email2" placeholder="name@example.com" data-sb-validations="required,email" />
                            <label for="email2">email 확인</label>
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
                        <div class="d-grid"><input type="submit" class="btn btn-primary btn-lg" value="회원가입"></div><br>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function fun1() {
	
	if(document.fr.id.value.length < 4 || document.fr.id.value.length > 10){
		alert("ID는 4 ~ 10자로 입력하세요");
		return false;
	}
	if(document.fr.pass.value.length < 6 || document.fr.pass.value.length > 10){
		alert("비밀번호는 6 ~ 10자로 입력하세요");
		document.fr.pass.focus();
		return false;
	}
	if(document.fr.pass2.value.length < 6 || document.fr.pass2.value.length > 10){
		alert("비밀번호는 6 ~ 10자로 입력하세요");
		document.fr.pass2.focus();
		return false;
	}
	if(document.fr.name.value == ""){
		alert("이름을 입력하세요");
		document.fr.name.focus();
		return false;
	}
	if(document.fr.email.value == ""){
		alert("이메일을 입력하세요");
		document.fr.pass.focus();
		return false;
	}
	if(document.fr.email2.value == ""){
		alert("이메일 확인란을 입력하세요");
		document.fr.pass.focus();
		return false;
	}
	if(document.fr.email.value!=document.fr.email2.value){
		alert("이메일이 일치하지 않습니다");
		document.fr.pass.focus();
		return false;
	}
	
}
	var checkPassResult = false;		// 패스워드 검사
	var checkRetypePassResult = false;	// 패스워드 확인 결과

	// 패스워드 보안강도 검사
	function checkPass(pass){
		// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
		var spanElem = document.getElementById("checkPassResult");
		
		// 정규표현식 패턴 정의
		var lengthRegex = /^[A-Za-z0-9!@#$%]{6,10}$/; // 길이 및 사용 가능 문자 규칙
		var engRegex = /[A-Za-z]/;	// 영어
		var numRegex = /[0-9]/;		// 숫자 규칙
		var specRegex = /[!@#$%]/;	// 특수문자 규칙
		
		var count = 0;	// 각 규칙별 검사 결과를 카운팅 할 변수
		
		if(lengthRegex.exec(pass)){	// 패스워드 길이 및 사용 가능 문자 규칙 통과 시
			spanElem.innerHTML = "사용 가능한 패스워드네요!";
			spanElem.style.color = "#198754";
			
			// 각 규칙별 검사 후 해당 항목이 포함되어 있을 경우 카운트 증가
			if(engRegex.exec(pass)) count++;
			if(numRegex.exec(pass)) count++;
			if(specRegex.exec(pass)) count++;
			
			switch(count){
			case 3: // 특수문자, 대문자, 소문자, 숫자 중 3개를 만족
				spanElem.innerHTML = "안전한 패스워드네요!";
				spanElem.style.color = "#198754";
				checkPassResult = true;
				break;
			case 2: // 특수문자, 대문자, 소문자, 숫자 중 2개를 만족
				spanElem.innerHTML = "조금 위험한 패스워드예요!";
				spanElem.style.color = "#fd7e14";
				checkPassResult = true;
				break;
			default: 
				spanElem.innerHTML = "영문자, 숫자, 특수문자 중 2가지 이상 조합 필수 입니다!";
				spanElem.style.color = "#dc3545";
				checkPassResult = false;
			}			
		} else {
			//spanElem.innerHTML = "사용 불가능한 패스워드";
			spanElem.innerHTML = "영문자, 숫자, 특수문자 조합 4 ~ 10자리 필수";
			spanElem.style.color = "#dc3545";
			checkPassResult = false;
		}
	}
	
	// 패스워드 일치 여부 검사
	function checkRetypePass(pass2){
		var pass = document.fr.pass.value;
		var spanElem = document.getElementById("checkRetypePassResult");
		if(document.fr.pass.value!="" && pass == pass2){	// 패스워드 일치
			spanElem.innerHTML = "패스워드 일치";
			spanElem.style.color = "GREEN";
			checkRetypePassResult = true;
		} else if(document.fr.pass.value!="" && pass != pass2) {	// 패스워드 불일치
			spanElem.innerHTML = "패스워드 불일치";
			spanElem.style.color = "RED"
			checkRetypePassResult = false;
		}
		
	}
	
// 우편번호
function winopen() {
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	//1. 아이디가 없으면 알림창과 진행x
	if(document.fr.id.value =="" || document.fr.id.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.fr.id.value="";
		document.fr.id.focus();
	}else{
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
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