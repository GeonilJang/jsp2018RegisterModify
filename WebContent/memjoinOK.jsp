<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.test.ex.*" %>
<%@ page import = "java.sql.*" %>

 <% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mdto" class="com.test.ex.MemDTO"/>
<jsp:setProperty name ="mdto" property="*"/>
<%
	mdto.setrDate(new Timestamp(System.currentTimeMillis()));
	MemDAO mdao  = MemDAO.getInstance();
	if(mdao.checkId(mdto.getId()) == MemDAO.MEM_EXIST){
%>

	<script type="text/javascript">
		alert("아이디가 이미 존재합니다.");
		history.back();
	</script>	

<%		
	}else{
		int n = mdao.insertMember(mdto);
		
		if(n == MemDAO.MEM_JOIN_SUCCESS){
			session.setAttribute("id", mdto.getId());	
%>
	<script type="text/javascript">
		alert("회원 가입 처리 되었습니다.");
		document.location.href ="login1.jsp";
	</script>


<%
	}else{ 
%>
	<script type="text/javascript">
		alert("회원 가입 실패.");
		document.location.href ="login1.jsp";
	</script>

<%
		}
	}
%>

