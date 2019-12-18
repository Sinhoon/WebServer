<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%-- C:\Users\acorn\web_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>hello</title>
</head>
<body>

	<!-- html 클라이언트 주석  -->
	<%-- jsp  히든 주석           --%>
	<%
		int a= 11;
		out.write(a);
		out.print(a);
		out.print("11");
		out.write("11");
		// 자박 주석    
		for (int i = 0; i < 10; i++) {
	%>
	<li><%="a"+i%></li>
	<%
		}
		out.write(a);
	%>
</body>
</html>
