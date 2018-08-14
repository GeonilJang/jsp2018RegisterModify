<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<!-- 자바스크립트 파일 불러오기. -->
		<script type="text/javascript" src="member.js"></script>
		
	</head>
	<body>
		<div class="" align=center>
			<hr width=400 size=2 color="blue">
				<h2>회원 가입</h2>
			<hr width=400 size=2 color="blue">
			
			<form action="memjoinOK.jsp" method="post" name="join_frm">
				아이디 : <input type="text" name="id" size="20"><br>
				비밀번호 : <input type="text" name="pw" size="20"><br>
				비밀번호 확인 : <input type="text" name="pw_confirm" size="20"><br>
				이름 : <input type="text" name="name" size="20"><br>
				메일 : <input type="text" name="email" size="20"><br>
				주소 : <input type="text" name="addr" size="50"><br>	
				<input type="button" value="회원가입" onclick="mem_check()">&nbsp;<input type="reset" value="취소">
			</form>
		</div>
	</body>
</html>