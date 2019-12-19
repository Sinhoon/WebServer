<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.acorn.dao.DeptDao"%>
<%@ page pageEncoding="utf-8"%>

<%@ include file="../inc/header.jsp"%>

<%  
	int pagenum = 0;
	int start = 0;
	int len  = 10;
	int totalRows = 0;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int pageLength = 2;
    int cPage = 0;
	String tempPage = request.getParameter("page");	
	if(tempPage==null | tempPage.length()==0){
		cPage =1;
	}
	try{
	cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage= 1;
	}
/* 	String templen = request.getParameter("len");
	
	if(templen==null | templen.length()==0){
		len =2;
	}
	try{
		len = Integer.parseInt(templen);
	}catch(NumberFormatException e){
		len = 2;
	} */
	
	// a + (n-1)d
	start = (cPage-1)*len;
	

	DeptDao dao = DeptDao.getInstance();
	totalRows = dao.getTotalRows();
	totalPage = totalRows/len == 0?  totalRows/len : totalRows/len+1;
	//totalPage = totalRows/len + (int)Math.ceil((totalRows%len)/10.0);
	if(totalPage == 0 ){
		totalPage = 1;
	}
	ArrayList<DeptDto> list = dao.select(start, len);
	
	
	/*
		totalRows = 132 ; 
		len = 5;
		pageLength = 10;
					startpage   endpage
		cPage =  1    1           10
		cPage =  5	  1           10
		cPage =  14   11          20 
		startPage = 1 + (currentblock-1)*pageLength;
		endPage  = pageLength + (currentblock-1)*pageLength;
		n : currentblock
	*/
	
	int currentBlock = cPage % pageLength == 0 ? (cPage / pageLength) : (cPage / pageLength +1);
	
	startPage = 1 + (currentBlock-1)*pageLength;
	endPage  = pageLength + (currentBlock-1)*pageLength;
	
	int totalBlock = totalPage % pageLength == 0 ? (totalPage / pageLength) : (totalPage / pageLength +1);
	
	if(currentBlock == totalBlock) {
		endPage = totalPage;
	}
%>
<!-- breadcrumb start-->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">DEPT</li>
	</ol>
</nav>
<!-- breadcrumb end-->

<!-- main start -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
		<h3 > 부서 리스트 : <%= totalRows +"개"%></h3>
			<div class = " table-responsive-lg">
			<table class="table" >
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="40%">
					<col width="40%">
				</colgroup>
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
						<th scope="col">부서번호</th>
						<th scope="col">부서이름</th>
						<th scope="col">부서위치</th>
					</tr>
				</thead>
				<tbody>
					<%
						pagenum = (totalRows)-(cPage-1)*len;
						if (list.size() != 0) {
							for (DeptDto dto : list) {
					%>
					<tr>
						<td><%= pagenum-- %></td>
						<td><a href="view.jsp?page=<%=cPage%>&no=<%=dto.getNo()%>"><%=dto.getNo()%></a></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getLoc()%></td>
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="3">데이터가 존재 하지않습니다.</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					
					<% if (currentBlock == 1) { %>
					<li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
					<%  } else { %>
					<li class="page-item">
					<a class="page-link" href="list.jsp?page=<%= startPage -1 %>" tabindex="-1" aria-disabled="true">Previous</a></li>
					<%  }%>
					<% for(int i = startPage ; i <= endPage; i ++) { %>
					<li class="page-item <%if(cPage==i) {%> active <% }%>" ><a class="page-link" href="list.jsp?page=<%= i %>"> <%= i %></a></li>
					<%  }%>
					
					<% if (currentBlock == totalBlock) { %>
					<li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1">Next</a></li>
					<%  }  else { %>
					<li class="page-item">
					<a class="page-link" href="http://localhost/dept/list.jsp?page=<%=endPage+1%>">Next</a></li>
					<%  }%>
				</ul>
			</nav>
			<div class="text-right">
				<a href="write.jsp?page=<%=cPage%>" class="btn btn-outline-secondary">부서등록</a>
			</div>
		</div>
		</div>
	</div>
</div>
<!-- main end -->


<jsp:include page="../inc/footer.jsp" />

