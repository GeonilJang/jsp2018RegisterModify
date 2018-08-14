<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="com.test.ex.MemDTO" %>
<%@ page import ="com.test.ex.MemDAO" %>    

<%
	request.setCharacterEncoding("UTF-8");
	
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");

	System.out.println("아이디 : "+id+", 비밀번호 : "+pw);
	
	MemDAO mdao = MemDAO.getInstance();
	int chkNum = mdao.memberCheck(id, pw);
	
	if(chkNum == -1 ){
%>
	<script>
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>

<%		
	}else if(chkNum == 0){
%>
	<script>
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
<%		
	}else if(chkNum == 1){
		
		MemDTO mdto = mdao.getMember(id);
		
		if(mdto == null){
			%>
				<script>
					alert("가입된 회원이 아닙니다.");
					history.go(-1);
				</script>
			<%
		}else{
			String name = mdto.getName();
			session.setAttribute("id",id);
			session.setAttribute("name",name);
			session.setAttribute("chkMember","yes");
			System.out.println("로그인 까지왔네");
%>
	<script>
		alert("로그인 되었습니다.")
		location.href="main.jsp";
	</script>
	
<%	
	/* response.sendRedirect("main.jsp"); */
		}
	}
%>
