<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% if((String)session.getAttribute("chkMember") == null){%>
 	<jsp:forward page="login1.jsp"/>
<%
}
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2><%= name %>님 환영합니다....!!!</h2>

<form action="mlogout.jsp" method="post">
	<input type = "submit" value="로그아웃"> &nbsp; <input type="button" value="회원정보 수정" onclick="javascript:window.location.href='modify.jsp'">
</form>

</body>
</html>