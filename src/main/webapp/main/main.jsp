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
 </head>
    
  <body class="d-flex flex-column h-100">
      <main class="flex-shrink-0">
          <!-- Navigation-->
	<jsp:include page="../inc/top.jsp"></jsp:include>
          <!-- Header-->
          <header class="bg-pic py-8">
           <div class="container px-5">
            <div class="row gx-5 align-items-center justify-content-center">
             <div class="col-lg-8 col-xl-7 col-xxl-6">
              <div class="my-5 text-center text-xl-start">
                <h1 class="display-2 fw-bolder text-white mb-2">즐거움을 나누면 <br>배가 됩니다</h1><br>
                <p class="lead fw-bold1 text-white-50 mb-4">가끔은 혼밥도 심심할 때! <br>다양하게 즐기고 싶을 때!<br>한 끼의 즐거움을 나눠보세요!</p>
                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                   <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">식사메이트 찾아볼까?</a>
                   <a class="btn btn-outline-light btn-lg px-4" href="#!">Contact</a>
                </div>
              </div>
             </div>
             <div class="col-xl-2 col-xxl-6 d-none d-xl-block text-center">
              <img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/1200x800/000/fff" alt="..." />
             </div>
            </div>
           </div>
          </header>
        
      </main>
      <!-- Footer-->
      <jsp:include page="../inc/bottom.jsp"></jsp:include>
      <!-- Bootstrap core JS-->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
      <!-- Core theme JS-->
      <script src="js/scripts.js"></script>
  </body>
</html>
