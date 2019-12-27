<%@ page pageEncoding="utf-8" %>

<%
	// httpsession 세션 객체 종료  1.브라우저 종료  2.기간만료  3. invalidate()메소드 호출
	
	// session.removeAttribute("member") 한객체만 없셈
	session.invalidate();
	response.sendRedirect("/index.jsp");

%>