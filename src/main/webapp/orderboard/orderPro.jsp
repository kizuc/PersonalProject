<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Time"%>
<%@page import="oboard.OboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderboard/orderpro.jsp</title>
</head>
<body>
<%
String howmany = ""; // 인원 수 담을 String 멤버변수
String options = ""; // 옵션 담을 String 멤버변수
%>
<%
// post request 한글처리
request.setCharacterEncoding("utf-8");
// request id pass name email address phone mobile 파라미터값 가져오기 >변수저장
String id=request.getParameter("id");
String nickname=request.getParameter("nickname");
String fdate=request.getParameter("fdate");
String ftime=request.getParameter("ftime");
// DateFormat df = new SimpleDateFormat("M월 dd일");
String faddress=request.getParameter("faddress");
String wfood=request.getParameter("wfood");
// checkbox의 여러 항목을 저장학 위해
String nof[]=request.getParameterValues("nof");
String people=request.getParameter("people");
String option=request.getParameter("option");
String etc=request.getParameter("etc");

if (people.equals("1명")) {
	howmany="1명";
} else if (people.equals("2명")){
	howmany="2명";
} else if (people.equals("3명")){
	howmany="3명";
} else if (people.equals("몇 명이라도 OK!")){
	howmany="몇 명이라도 OK!";
} else howmany="인원은 조율";


if (option.equals("조용히 밥만 먹으실 분")) {
	options="조용히 밥만 먹으실 분";
} else if (option.equals("이야기도 나누실 분")){
	options="이야기도 나누실 분";
} else if (option.equals("2차도 가실 분")){
	options="2차도 가실 분";
} else options="맛있게 먹으실 분";

// 배열 요소 하나씩 출력되게 처리
String txtnof=new String();
for(int i=0; i<nof.length; i++){
	txtnof += nof[i] + " ";
}

// 객체생성=>기억장소 할당
OboardDTO oboardDTO=new OboardDTO();
// 멤버변수에 값을 저장하는 메서드호출
oboardDTO.setNickname(nickname);
oboardDTO.setFdate(fdate);
oboardDTO.setFtime(ftime);
oboardDTO.setFaddress(faddress);
oboardDTO.setWfood(wfood);
oboardDTO.setNof(txtnof);
oboardDTO.setPeople(people);
oboardDTO.setOptions(options);
oboardDTO.setEtc(etc);
//자바파일메서드정의(디비) 메서드호출
// oboardDAO oboardDAO=new oboardDAO();
//메서드호출
// oboardDAO.insertoboard(oboardDTO);
%>
<script type="text/javascript">
	alert("성공적으로 등록됐어요!");
	location.href="orderboard.jsp";
</script>
</body>
</html>