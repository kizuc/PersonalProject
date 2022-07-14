<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>orderForm.jsp</title>
     
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="../css/styles.css" rel="stylesheet">
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Page content-->
            <section class="bg-light py-2">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-4 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                            <i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">같이 드실 분!</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">

                                <form action="joinPro.jsp" id="contactForm" name="fr" data-sb-form-api-token="API_TOKEN" method="post" onsubmit="return checkSubmit()">
                                    <!-- id input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control4" name="id" id="id" type="text" placeholder="닉네임" data-sb-validations="required" />
                                        <label for="id"></label> <span class="lead fw-bold3 text-dark-40 mb-3">(이)랑</span>
                                    </div>
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control3" name="date" id="date" type="date" placeholder="언제" data-sb-validations="required,date" />
<!--                                         <label for="email"></label> -->
<!--                                     </div> -->
<!--                                     <div class="form-floating mb-3"> -->
                                        <input class="form-control3" name="time" id="time" type="time" placeholder="몇 시에" data-sb-validations="required,date" />
                                        <label for="email"></label> <span class="lead fw-bold3 text-dark-40 mb-3">에</span>
                                    </div>
                                    <!-- Email2 address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control4" name="where" id="where" type="text" placeholder="어디 음식점" data-sb-validations="required,date" />
                                        <label for="email"></label> <span class="lead fw-bold3 text-dark-40 mb-3">에서</span>
                                    </div>
                    				<div class="form-floating mb-3">
                                        <input class="form-control4" name="what" id="what" type="text" placeholder="어떤 음식을" data-sb-validations="required,date" />
                                        <label for="email"></label> <span class="lead fw-bold3 text-dark-40 mb-3">먹을 사람~</span>
                                    </div>
                                    <hr>
                                    <!--  address number input-->
                                    <div class="form-floating mb-3">
                                    <span class="lead fw-bold1 text-dark-40 mb-3">
                                     	<input type="checkbox" name="no1" value="해산물"> 해산물
                                     	<input type="checkbox" name="no1" value="해산물"> 술
                                     	<input type="checkbox" name="no1" value="해산물"> 매운 음식
                                     	<input type="checkbox" name="no1" value="해산물"> 느끼한 음식
                                     	은 힘들어요!</span>
                                    </div>
                                      <!-- Phone address2 input-->
                                    <div class="form-floating mb-3">
                                       <select name="grade">
										<option value="">이런 분</option>
										<option value="1">맛있게 먹으실 분</option>
										<option value="2">조용히 밥만 먹으실 분</option>
										<option value="3">이야기도 나누실 분</option>
										<option value="4">2차도 가실 분</option>
										</select> 
										<span class="lead fw-bold2 text-dark-40 mb-3">이면 좋겠어요!</span><br><br>
                                    </div>
                                      <!-- mobile number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="mobile" id="phone" type="text" placeholder="기타사항" data-sb-validations="required" />
                                        <label for="phone">기타 요청 사항</label><br>
                                    </div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"><input type="submit" class="btn btn-primary btn-lg" onclick="fun1()" value="올리기"></div><br>
                                    <div class="d-grid"><input type="reset" class="btn btn-outline-primary btn-lg" id="cancel" type="reset" value="취소"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	</body>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


</script>
</html>