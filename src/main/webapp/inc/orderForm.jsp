<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	<form action="orderPro.jsp" id="contactForm" name="fr" data-sb-form-api-token="API_TOKEN" method="post">
     <!-- id input-->
     <div class="form-floating mb-3">
         <input type="hidden" name="id" id="id" value="<%=id %>">
         		<%
		// 아이디가 있으면 닉네임이 보이게(닉네임이 없으면 기본값으로 익명이 뜬다)
		if(id!=null){
			%>
        	<input class="form-control4" name="nickname" id="nickname" type="text" value="<%=memberDTO.getNickname() %>" data-sb-validations="required" />
			<%
		// 아이디가 없으면 닉네임이 적히지 않게
		}else if(id==null){
			%>
        	<input class="form-control4" name="nickname1" id="nickname1" type="text" placeholder="닉네임" data-sb-validations="required" />
			<%
		}
		%>
        <span class="lead fw-bold3 text-black-40 mb-3 pe-3">&nbsp;(이)랑 같이</span>
     </div>
     <div class="form-floating mb-3">
        <input class="form-control3" name="fdate" id="fdate" type="datetime-local" placeholder="언제" data-sb-validations="required,date" />
        <span class="lead fw-bold3 text-black-40 mb-3">&nbsp;</span>
         <input class="form-control4" name="faddress" id="faddress" type="text" placeholder="어디 음식점" data-sb-validations="required,date" />
         <span class="lead fw-bold3 text-black-40 mb-3 pe-3">&nbsp;에서</span>
     </div>
     <div class="form-floating mb-3">
        <input class="form-control3" name="wfood" id="wfood" type="text" placeholder="어떤 음식을" data-sb-validations="required,date" />
        <span class="lead fw-bold3 text-dark-40 mb-3">&nbsp;먹을 &nbsp;</span>
       	<select class="form-control5" name="pp">
			<option value="1" selected>1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>
			<option value="4">인원은 조율</option>
			<option value="5">몇 명이라도 OK!</option>
		</select> 
		<span class="lead fw-bold3 text-dark-40 mb-3">&nbsp; 구해요!</span>
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
	      	<input class="form-check-input" type="checkbox" name="nof" value="매운 음식"> 매운 음식 
	      	<input class="form-check-input" type="checkbox" name="nof" value="느끼한 음식"> 느끼한 음식 
	      	<input class="form-check-input" type="checkbox" name="nof" value="딱딱한 음식"> 딱딱한 음식 
	     </span>  
	     <span class="lead fw-bold2 text-dark-40 mb-3"> 은 힘들고</span>
	     </div>
	     <div class="form-floating mb-0">
	        <select class="form-control4" name="opt">
				<option value="1" selected>맛있게 먹으실 분</option>
				<option value="2">조용히 밥만 먹으실 분</option>
				<option value="3">이야기도 나누실 분</option>
				<option value="4">2차도 가실 분</option>
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