<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터 들고 올 때 태그도 들고오기 때문에 최소로(퍼센트 안의 것은 괜찮다.)

// id 파라미터 값 가져오기
String id=request.getParameter("id");

// DB에 아이디가 있는지 없는지 확인
MemberDAO memberDAO=new MemberDAO();
MemberDTO memberDTO=memberDAO.getMember(id);

if(memberDTO==null){	//아이디 없음
	%>아이디 사용가능<%
}else{	//아이디 있음
	%>아이디 중복<%
}
%>