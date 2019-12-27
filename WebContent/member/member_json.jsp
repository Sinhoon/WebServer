<%@page import="kr.co.acorn.dao.MemberDao"%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType = "application/json;charset=utf-8"%>


<%
	MemberDao dao = MemberDao.getInstance();
	int start = Integer.parseInt(request.getParameter("start"));
	int length = Integer.parseInt(request.getParameter("length"));
	out.print(dao.selectJSON(start, length));
%>