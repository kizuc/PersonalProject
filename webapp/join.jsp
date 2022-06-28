<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="css/styles.css" rel="stylesheet">
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <jsp:include page="inc/top.jsp"></jsp:include>
            <!-- Page content-->
            <section class="bg-light py-2">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-4 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">회원가입</h1>
<!--                             <p class="lead fw-normal text-muted mb-0">We'd love to hear from you</p> -->
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- * * SB Forms Contact Form * *-->
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- This form is pre-integrated with SB Forms.-->
                                <!-- To make this form functional, sign up at-->
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                <legend class="fs-6">기본 정보</legend>
                                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                                    <!-- id input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="id" id="id" type="text" placeholder="Enter your ID..." data-sb-validations="required" />
                                        <label for="id">ID</label>
                                        <div class="invalid-feedback" data-sb-feedback="id:required">ID은 필수 입력사항 입니다.</div>
										<div class="d-grid"><button class="btn btn-primary btn-lg" type="button" id="duplecheck">ID 중복 확인</button></div><br>
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
                                        <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email">email</label>
                                        <div class="invalid-feedback" data-sb-feedback="email:required">메일은 필수 입력사항 입니다.</div>
                                        <div class="invalid-feedback" data-sb-feedback="email:email">메일 형식에 맞지 않습니다.</div>
                                    </div>
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="email2" type="email2" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email2">email 확인</label>
                                        <div class="invalid-feedback" data-sb-feedback="email2:required">메일 확인은 필수 입력사항 입니다.</div>
                                        <div class="invalid-feedback" data-sb-feedback="email2:email">메일 형식에 맞지 않습니다.</div>
                                    </div><br>
                                    <hr>
                                   <legend class="fs-6">선택 사항</legend>
                                                                        <!-- Phone number input-->
<!--                                     <div class="form-floating mb-3"> -->
<!--                                         <input class="form-control" id="addnum" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" /> -->
<!--                                         <label for="addnum">우편번호</label> -->
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                     	<input class="form-control2" id="address2" type="address2" placeholder="(우편번호) 주소" data-sb-validations="required" style=margin-right:0px readonly>
                                      	<div class="d-grid gap-2 d-sm-inline-flex justify-content-sm-end justify-content-xl-end">
                                    	<a class="btn btn-primary btn-lg px-3 mb-sm-1" id="addresskakao" href="#features">주소 찾기</a></div>
                                    </div>
                                      <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="address2" type="address2" placeholder="OOO동 OOO호" data-sb-validations="required" />
                                        <label for="address2">상세 주소</label>
                                    </div>
                                      <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="phone" type="tel" placeholder="051-123-4567" data-sb-validations="required" />
                                        <label for="phone">전화 번호</label>
                                    </div>
                             
                                      <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="phone" type="tel" placeholder="010-123-4567" data-sb-validations="required" />
                                        <label for="phone">폰 번호</label><br>
                                    </div>
<!--              Message input -->
<!--              <div class="form-floating mb-3"> -->
<!--                  <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea> -->
<!--                  <label for="message">Message</label> -->
<!--                  <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div> -->
<!--              </div> -->
                                    <!-- Submit success message-->
                                    <!---->
                                    <!-- This is what your users will see when the form-->
                                    <!-- has successfully submitted-->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">가입을 축하합니다!</div>
                                            <br />
<!--                                             <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a> -->
                                        </div>
                                    </div>
                                    <!-- Submit error message-->
                                    <!---->
                                    <!-- This is what your users will see when there is-->
                                    <!-- an error submitting the form-->
                                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"><button type="submit" class="btn btn-primary btn-lg" id="submit">Submit</button></div><br>
                                    <div class="d-grid"><button type="reset" class="btn btn-outline-primary btn-lg" id="cancel" type="reset">cancel</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
      <jsp:include page="inc/bottom.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("addresskakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	
            	document.getElementById("address").value = " (" + data.zonecode + ") "+data.address; // 우편번호 입력
//             	document.getElementById("address").value = data.address; // 주소 넣기
                
                
                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>