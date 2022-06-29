<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>ID 중복 체크</h2>
<%
// 1. 한글처리 & 받아온 파라미터 변수화
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("userid");

// 2. MemberDAO 객체생성 -> 전달받은 정보 저장
MemberDAO memberDAO = new MemberDAO();

// 3. idCheck(ID) 메서드
int result = memberDAO.idCheck(id);
if (result == 1){
	out.print("사용가능한 아이디입니다!");
	// 아이디 사용하기 버튼추가
	%>
	 <input type="button" value="ID 사용하기" onclick="result();">
	<%
}else if(result == 0){
	out.print("중복 ID 입니다!");
}else{
	out.print("에러!");
}
%>
<!-- 팝업창구현  -->
<fieldset>
	<!-- <form action="" method="post">
		  action 속성에 값이 없으면 기본적으로 자기자신을 불러오지만 중복확인 버튼을 클릭했을때 변경되지않는다.-->	
	<form action="idCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="userid" value="<%=id%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

<!-- 중복확인 창에서 회원가입 페이지로 정보 전달 -->
<script type="text/javascript">
	function result(){
		// 팝업창의 아이디 정보를 회원가입 창에 아디정보로 전달
		// 팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
		// alert("팝업창의 id값"+document.wfr.user.userid.value+", 회원가입창의 id값 : " +opener.document.fr.id.value)
		// 회원가입 페이지의 id값에 아이디 중복으로 선택된 id값을 대입
		opener.document.fr.id.value = document.wfr.userid.value;
		
		opner.document.fr.id.readOnly=true;
		
		window.close();
	}
</script>

</body>
</html>