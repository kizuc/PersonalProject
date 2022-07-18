<%@page import="java.util.Arrays"%>
<%@page import="oboard.OboardDAO"%>
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
// post request 한글처리
request.setCharacterEncoding("utf-8");
// request id pass name email address phone mobile 파라미터값 가져오기 >변수저장
String id=request.getParameter("id");
String nickname=request.getParameter("nickname");
String fdate=request.getParameter("fdate");
// DateFormat df = new SimpleDateFormat("M월 dd일");
String faddress=request.getParameter("faddress");
String wfood=request.getParameter("wfood");
String pp=request.getParameter("pp");
// checkbox의 여러 항목을 저장학 위해
String nofood[]=request.getParameterValues("nof");
String opt=request.getParameter("opt");
String etc=request.getParameter("etc");


if (pp.equals("2")){
	pp="2명";
} else if (pp.equals("3")){
	pp="3명";
} else if (pp.equals("4")){
	pp="인원은 조율";
} else if (pp.equals("5")){
	pp="몇 명이라도 OK!";
} else{ 
	pp="1명";
}


if (opt.equals("2")) {
	opt="조용히 밥만 먹으실 분";
} else if (opt.equals("3")){
	opt="이야기도 나누실 분";
} else if (opt.equals("4")){
	opt="2차도 가실 분";
} else{
	opt="맛있게 먹으실 분";
}

// 배열 요소 하나씩 출력되게 처리
String txtnof=new String();
if(nofood==null || nofood.length<=0){
	txtnof=Arrays.toString(nofood);
}else{
	for(int i=0; i<nofood.length; i++){
		txtnof += nofood[i] + ",";
	}
}

// 객체생성=>기억장소 할당
OboardDTO oboardDTO=new OboardDTO();
// 멤버변수에 값을 저장하는 메서드호출
oboardDTO.setId(id);
oboardDTO.setNickname(nickname);
oboardDTO.setFdate(fdate);
oboardDTO.setFaddress(faddress);
oboardDTO.setWfood(wfood);
oboardDTO.setPeople(pp);
oboardDTO.setNof(txtnof);
oboardDTO.setOoption(opt);
oboardDTO.setEtc(etc);

// 등록 메서드호출
OboardDAO oboardDAO=new OboardDAO();
// 메서드호출
oboardDAO.insertOboard(oboardDTO);
%>
<script type="text/javascript">
	alert("성공적으로 등록됐어요!");
	location.href="oboard.jsp";
</script>
</body>
</html>