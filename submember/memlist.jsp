<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>submember/memlist.jsp</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/sub.css" rel="stylesheet" />
<%	// 데이터 있거나 admin계정 아니면 로그인 페이지로 이동
	String id=(String)session.getAttribute("id");
	if(id.equals("admin") && id != null){	
	} else{
		response.sendRedirect("../main/main.jsp");
	}
%>
</head>
<body class="d-flex flex-column">
 <main class="flex-shrink-0">
     <!-- Navigation-->
   <jsp:include page="../inc/top.jsp"></jsp:include>
     <!-- Page Content-->
     <section class="py-21">
         <div class="container px-5 my-5">
             <div class="row gx-5">
                 <div class="col-lg-12">
                     <!-- Post content-->
                     <h1 class="fw-bolder mb-1">관리자 페이지</h1>
   <jsp:include page="../inc/menuadmin.jsp"></jsp:include>
     <section class="py-2">
         <div class="container px-5 my-5">
             <div class="row gx-5">
                 <div class="col-lg-12">
                     <!-- Post content-->
                     <h4 class="fw-bolder mb-1">회원 목록</h4>
                     <section>
                         <div class="card bg-light">
                          <table>
								<tr>
									<th>ID</th>
									<th>이름</th>
									<th>phone</th>
									<th>mail</th>
									<th>주소</th>
									<th>상세주소</th>
									<th>가입날짜</th>
									<th>관리</th>
								</tr>
								<%
								 MemberDAO boardDAO=new MemberDAO();
								 List boardList=boardDAO.memList();
								 MemberDTO memberDTO=new MemberDTO();
								%>
								<%
								SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY.MM.dd.");
								
								for(int i=0;i<boardList.size();i++){
									memberDTO=(MemberDTO)boardList.get(i);
								%>
								<tr>
									<td><%=memberDTO.getId() %>
									<input type="text" name="dID" value="<%=memberDTO.getId()%>" hidden></td>
									<td><%=memberDTO.getName() %></td>
									<td><%=memberDTO.getMobile() %></td>
									<td><%=memberDTO.getEmail() %></td>
									<td><%=memberDTO.getAddress() %></td>
									<td><%=memberDTO.getAddress2() %></td>
								    <td><%=memberDTO.getDate()%></td>
								    <td><input value="회원삭제" type="button" onclick="checkConfirm('<%=memberDTO.getId()%>')"></td>
								</tr>	
									<%
								}
								%>
						</table>
                         </div>
                     </section>
                 </div>
             </div>
         </div>
     </section>
                 </div>
             </div>
         </div>
     </section>
 </main>
 <!-- Footer-->
  <jsp:include page="../inc/bottom.jsp"></jsp:include>
 <!-- Bootstrap core JS-->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<!-- 삭제 확인 -->
<script type="text/javascript">
	function checkConfirm(id){
		var result = confirm("정말 삭제하시겠습니까??");
		if(!result)	return false;
		
		location.href='deleteAdminPro.jsp?dID=' + id;
		
	}
</script>


</html>
