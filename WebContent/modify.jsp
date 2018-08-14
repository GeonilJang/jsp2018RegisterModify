<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.test.ex.MemDAO" %>
<%@ page import = "com.test.ex.MemDTO" %>    
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = (String)session.getAttribute("id");
	MemDAO mdao = MemDAO.getInstance();
	MemDTO mdto = mdao.getMember(id);

%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="member.js"></script>
</head>
<body>
	<div class="" align=center>
			<hr width=400 size=2 color="blue">
				<h2>회원 정보 수정</h2>
			<hr width=400 size=2 color="blue">
			
			<form action="memModifyOK.jsp" method="post" name="modify_frm">
				아이디 : <input type="text" name="id" size="20" readonly value=<%= mdto.getId() %>><br>
				비밀번호 : <input type="text" name="pw" size="20"><br>
				비밀번호 확인 : <input type="text" name="pw_confirm" size="20"><br>
				이름 : <input type="text" name="name" size="20" readonly value=<%= mdto.getName() %>><br>
				메일 : <input type="text" name="email" size="20" value=<%= mdto.getEmail() %>><br>
				주소 : <input type="text" name="addr" size="50" value=<%= mdto.getAddr() %>><br>	
				<input type="button" value="정보수정" onclick="updateInfo()">&nbsp;<input type="button" value="취소" onclick="javascript:window.location.href='login1.jsp'">
			</form>
		</div>
</body>
</html>