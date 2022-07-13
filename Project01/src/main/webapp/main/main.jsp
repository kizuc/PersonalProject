<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>꽃가게</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="../css/styles.css" rel="stylesheet">
 </head>
    
  <body class="d-flex flex-column h-100">
      <main class="flex-shrink-0">
          <!-- Navigation-->
	<jsp:include page="../inc/top.jsp"></jsp:include>
          <!-- Header-->
          <header class="bg-pic py-5">
           <div class="container px-5">
            <div class="row gx-5 align-items-center justify-content-center">
             <div class="col-lg-8 col-xl-7 col-xxl-6">
              <div class="my-5 text-center text-xl-start">
                <h1 class="display-2 fw-bolder text-white mb-2">일상을 행복한 순간으로<br></h1>
                <p class="lead fw-normal text-white-50 mb-4">어쩌구 저쩌구 이런 저런 <br>신뢰와 책임을 바탕으로 하는<br>준비된 개발자가 되겠습니다!</p>
                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                   <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">오늘의 꽃다발 보러가기</a>
                   <a class="btn btn-outline-light btn-lg px-4" href="#!">Contact</a>
                </div>
              </div>
             </div>
             <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
              <img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/1200x800/000/fff" alt="..." />
             </div>
            </div>
           </div>
          </header>
        
      </main>
      <!-- Footer-->
	<footer class="bg-light py-4 mt-auto">
          <div class="container px-5">
              <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                  <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
                  <div class="col-auto">
                      <a class="link-light small" href="#!">Privacy</a>
                      <span class="text-white mx-1">&middot;</span>
                      <a class="link-light small" href="#!">Terms</a>
                      <span class="text-white mx-1">&middot;</span>
                      <a class="link-light small" href="#!">Contact</a>
                  </div>
              </div>
          </div>
	</footer>
      <!-- Bootstrap core JS-->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
      <!-- Core theme JS-->
      <script src="js/scripts.js"></script>
  </body>
</html>
