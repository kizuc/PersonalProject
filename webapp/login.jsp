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
 				<section class="bg-light py-1">
                <div class="container px-6">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-6 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">로그인</h1>
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
                                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                                    <!-- id input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="id" id="id" type="text" placeholder="Enter your ID..." data-sb-validations="required" />
                                        <label for="id">ID</label>
                                    </div>
                                     <!-- pass input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="password" name="pass" id="pass" type="text" placeholder="Enter your pass..." data-sb-validations="required" />
                                        <label for="pass">비밀번호</label>
                                    </div>
                                    
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">어서오세요!</div>
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
</html>