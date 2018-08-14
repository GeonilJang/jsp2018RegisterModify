<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>


<%
	if(session.getAttribute("chkMember") != null){
%>  
	<%-- <jsp:forward page="main.jsp"/> --%>
	
<%
	}
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="" align=center>
			<hr width=400 size=2 color="green">
				<h2>로그인</h2>
			<hr width=400 size=2 color="green">
			
			<form action="memloginOK.jsp" method="post">
				아이디 : <input type="text" name="id" size="20" value="<%if(session.getAttribute("id")!= null){out.print(session.getAttribute("id"));} %>"><br>
				비밀번호 : <input type="text" name="pw" size="20"><br>
				<input type="submit" value="로그인">&nbsp;<input type="button" value="회원가입" onclick="javascript:window.location='memJoin.jsp'">
			</form>
		</div>
</body>
</html>