<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.test.ex.MemDAO" %>
<%@ page import = "com.test.ex.MemDTO" %>    
<% request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean id="mdto" class="com.test.ex.MemDTO" scope="page" />
<jsp:setProperty name="mdto" property="*"/>

<%
	String id = (String)session.getAttribute("id");
	mdto.setId(id);
	
	MemDAO mdao = MemDAO.getInstance();
	int n = mdao.updateMember(mdto);
	
	if(n == 1){

%>
	<script>
		alert("회원정보 수정이 되었습니다.");
		document.location.href="main.jsp";
	</script>

<%
	}else{
%>
	<script>
		alert("정보 수정 실패!")
		history.go(-1);
	</script>
<%
	}
%>


