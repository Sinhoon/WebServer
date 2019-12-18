<%-- page directive --%>


<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="utf-8" %>
<%@ page session = "false" %>
<%@ page buffer = "10kb" %>
<%@ page autoFlush = "true" %>
<%@ page isThreadSafe = "false" %>
<%@ page info = "jsp 페이지" %>
<%@ page errorPage = "/error.jsp" %>


<%
	Calendar c = Calendar.getInstance();

	//int a = Integer.parseInt("123a"); 
	
	String id = request.getParameter("id");
	out.print(id);
	
%>

${param.id}
