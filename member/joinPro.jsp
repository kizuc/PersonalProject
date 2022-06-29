<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%
//post request 한글처리
request.setCharacterEncoding("utf-8");
// request id pass name email address phone mobile 파라미터값 가져오기 >변수저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String addnum=request.getParameter("addnum");
String address=request.getParameter("address");
String address2=request.getParameter("address2");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");


//객체생성=>기억장소 할당
MemberDTO memberDTO=new MemberDTO();
// 멤버변수에 값을 저장하는 메서드호출
memberDTO.setId(id);
memberDTO.setPass(pass);
memberDTO.setName(name);
memberDTO.setEmail(email);
memberDTO.setAddnum(addnum);
memberDTO.setAddress(address);
memberDTO.setAddress2(address2);
memberDTO.setPhone(phone);
memberDTO.setMobile(mobile);

//자바파일메서드정의(디비) 메서드호출
//패키지member파일이름 MemberDAO
//insertMember()메서드정의
//객체생성=>클래스 기억장소할당
MemberDAO memberDAO=new MemberDAO();
//메서드호출
//memberDAO.insertMember(id,pass,name);
memberDAO.insertMember(memberDTO);
%>
<script type="text/javascript">
	alert("회원가입 성공");
	location.href="login.jsp";
</script>
</body>
</html>