<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>join.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" name="fr" method="post">
<fieldset>
<legend>기본 정보</legend>
<label>ID</label>
<input type="text" name="id" class="id">
<input type="button" value="중복확인" class="dup" onclick="winopen()"><br>
<!-- <span style="display:none;" name="dck" id="dck">숨길 내용</span><br> -->
<label>비밀번호</label>
<input type="password" name="pass"><br>
<label>비밀번호 확인</label>
<input type="password" name="pass2"><br>
<label>이름</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<label>E-Mail 확인</label>
<input type="email" name="email2"><br>
</fieldset>

<fieldset>
<legend>선택 사항</legend>
<label>우편번호</label>
<input type="text" id="addnum" name="addnum" readonly>
<input type="button" id="addresskakao" value="주소 검색" class="dup"><br>
<label>주소</label>
<input type="text" id="address" name="address" readonly>
<input type="text" id="address2" name="address2"><br>
<label>전화번호</label>
<input type="text" name="phone"><br>
<label>핸드폰</label>
<input type="text" name="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
function winopen(){
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	//1. 아이디가 없으면 알림창과 진행x
	if(document.fr.id.value =="" || document.fr.id.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.fr.id.focus();
	}else{
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		window.open("idCheck.jsp?userid="+document.fr.id.value,"","width=500, height=300");
	}
}

window.onload = function(){
	
    document.getElementById("addresskakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	document.getElementById("addnum").value = data.zonecode; // 우편번호 입력
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>