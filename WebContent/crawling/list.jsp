<%@ page pageEncoding="utf-8"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page import="kr.co.acorn.dto.DeptDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.acorn.dao.DeptDao"%>
<%@ page import="java.io.IOException"%>
<%@ include file="../inc/header.jsp"%>


<%
	

	
	request.setCharacterEncoding("utf-8");
 	String coin = request.getParameter("coin");
	if(coin.toString() == null){
		coin = "bitcoin";
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

<!-- main start-->

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3>크롤링() <%= coin  %></h3>			
			<div class="table-responsive-lg">
				<form name="f" method="post" action="list.jsp">
				<select id="coin" name="coin">
	  				<option value="bitcoin" <%if(coin.equals("bitcoin")){ %>selected <%} %>>bitcoin</option>
	  				<option value="ethereum" <%if(coin.equals("ethereum")){ %>selected <%} %>>ethereum</option>
	  				<option value="xrp" <%if(coin.equals("xrp")){ %>selected <%} %>>xrp</option>
				</select>	
				<button id="sub" class="btn btn-outline-secondary">검색</button>
				</form>
				
<script>
  $(function(){
	  $("#sub").click(function(){
		  f.submit();
	  });
  });
 </script>	
				<table class="table table-hover">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">Date</th>
							<th scope="col">Opens</th>
							<th scope="col">High</th>
							<th scope="col">Low</th>
							<th scope="col">Close</th>
							<th scope="col">Volume</th>
							<th scope="col">MarketCap</th>
						</tr>
					</thead>
					<tbody>
						<%
						String url = "https://coinmarketcap.com/currencies/"+coin+"/historical-data/?start=20171101&end=20191203";
						Document doc = null;

						try {
							doc = Jsoup.connect(url).get();

						} catch (IOException e) {
							e.printStackTrace();
						}
						Elements elements = doc.select(".cmc-table__table-wrapper-outer table tbody tr");
							for (int i = 0; i < elements.size(); i++) {
								Element trElement = elements.get(i);
						
						%>

						<tr>

							<td><%=trElement.child(0).text()%></td>

							<td><%=trElement.child(1).text()%></td>

							<td><%=trElement.child(2).text()%></td>

							<td><%=trElement.child(3).text()%></td>

							<td><%=trElement.child(4).text()%></td>

							<td><%=trElement.child(5).text()%></td>

							<td><%=trElement.child(6).text()%></td>

						</tr>

						<%
							}
						%>

						<tr>

							<td colspan="6">데이터가 존재하지 않습니다.</td>

						</tr>



			

					</tbody>

				</table>

			</div>

		</div>

	</div>

</div>

<!-- main end-->

<%@ include file="../inc/footer.jsp"%>


	