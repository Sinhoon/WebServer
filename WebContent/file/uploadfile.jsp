<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.File"%>
<%@ page pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// String name = request.getParameter("file");  =>null

	String path = request.getRealPath("/upload/file");
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH) +1;
	path += File.separator + year + File.separator + month ;
	File f = new File(path);
	if(!f.exists()){
		f.mkdirs();
	}
	
	MultipartRequest multi = null;
    try{
	multi = new MultipartRequest(
			request,
			path, // 디렉토리
			10*1024*1024, // 파일크기
			"utf-8", // 인코딩 타입
			// 이름 중복시 파일명끝에 1 2 3 으로 파일이름 변경
			new DefaultFileRenamePolicy()
			);
    }catch(Exception e){
    	e.printStackTrace();
    }
    String name = multi.getParameter("name");
    String filename = multi.getFilesystemName("file");
    String uploadName = multi.getOriginalFileName("file");
    File f1 = new File(f,filename);
    long fileSize = f1.length()/1024;
    
%>

<img src = "/upload/file/<%=year%>/<%=month%>/<%=filename %>"  style="width:100">
name : <%= name %> <br>
File Sysytem  name :  <a href="/upload/file/<%=year%>/<%=month%>/<%=filename %>"> 좋았어 </a><%= fileSize %> kb<br>
File origin name <%= filename %> <br>

