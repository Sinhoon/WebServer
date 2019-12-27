<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8" %>

<%

	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(null,email,null,password,null);
	dto = dao.isMember(dto);
	
		//세션에 dto 정보 저장한다. 시간 설정 30분
		if(dto.getName() != null){
			session.setMaxInactiveInterval(60*60*24);
			session.setAttribute("member", dto);
		%>
		<script>
			alert('로그인.');
			location.href="/index.jsp?";
		</script>
		<%}else{ %>
		<script>
			alert('로그인 실패');
			history.back(-1);
		</script>
		<%} %>
	
