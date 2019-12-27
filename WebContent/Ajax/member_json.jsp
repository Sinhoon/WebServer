<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType = "application/json;charset=utf-8"%>


<%
	JSONObject obj = new JSONObject();
	JSONArray arr = new JSONArray();
	
	JSONObject item1 = new JSONObject();
	item1.put("name","성영한");
	item1.put("clubid","abc");
	
	
	JSONObject item2 = new JSONObject();
	item2.put("name","신훈");
	item2.put("clubid","love");
	
	arr.add(item1);
	arr.add(item2);
	
	obj.put("cafelist",arr);
	out.print(obj.toString());
	
%>