<%@page import="test.DayChange"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	if (coin == null) {
		coin = "bitcoin";
	}
	if (startDate == null) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);
		startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
	}
	if (endDate == null) {
		Calendar cal = Calendar.getInstance();
		endDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<!-- main start-->

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h3>
				크롤링 <
				<%=coin%>
				>
			</h3>
			<div class="table-responsive-lg">
				<form name="f" method="post" action="list.jsp">
					<select id="coin" name="coin">
						<option value="bitcoin" <%if (coin.equals("bitcoin")) {%> selected
							<%}%>>bitcoin</option>
						<option value="ethereum" <%if (coin.equals("ethereum")) {%>
							selected <%}%>>ethereum</option>
						<option value="xrp" <%if (coin.equals("xrp")) {%> selected <%}%>>xrp</option>
					</select> <input type="text" id="startDate" name="startDate"
						value="<%=startDate%>"> <input type="text" id="endDate"
						name="endDate" value="<%=endDate%>">

					<button id="sub" class="btn btn-outline-secondary">검색</button>
				</form>

			
				<br>
				<div id="chart_div"></div>

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
						 	
							String url = "https://coinmarketcap.com/currencies/" + coin + "/historical-data/?start=" + startDate
									+ "&end=" + endDate;
							Document doc = null;

							try {
								doc = Jsoup.connect(url).get();

							} catch (IOException e) {
								e.printStackTrace();
							}
							doc = null;
							Elements elements = doc.select(".cmc-table__table-wrapper-outer table tbody tr");
							
							String[][] list = new String[elements.size()][3];
							for (int i = 0; i < elements.size(); i++) {
								Element trElement = elements.get(i);
/* 								list[i][0] = DayChange.change(trElement.child(0).text());
								list[i][1] = trElement.child(2).text();
								list[i][2] = trElement.child(3).text(); */
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
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yymmdd",
									maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
				$("#endDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yymmdd",
									maxDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});

				$("#sub").click(function() {
					f.submit();
				});
				
				
			    google.charts.load('current', {'packages':['line', 'corechart']});
			    google.charts.setOnLoadCallback(drawChart);
			    function drawChart() {
			      var chartDiv = document.getElementById('chart_div');
			      var data = new google.visualization.DataTable();
			      data.addColumn('date', 'Month');
			      data.addColumn('number', "Price");
			      data.addColumn('number', "MarketCap");
			      data.addRows([
			    	  <%for (int i = 0; i < elements.size(); i++) {%>
			    	  [new Date(<%=list[i][1].substring(0,4)%>,<%=list[i][1].substring(5,7)%>,<%=list[i][1].substring(8)%>])
			    	  ,<%=list[i][1].replaceAll(",.","")%>,<%=list[i][2].replaceAll(",.","")%>],
					 <% } %>
			      ]);

			      var materialOptions = {
			    	        chart: {
			    	          title: 'Average Temperatures and Daylight in Iceland Throughout the Year'
			    	        },
			    	        width: 900,
			    	        height: 500,
			    	        series: {
			    	          // Gives each series an axis name that matches the Y-axis below.
			    	          0: {axis: 'MarketCap'},
			    	            1: {axis: 'Price'}
			    	        },
			    	        axes: {
			    	          // Adds labels to each axis; they don't have to match the axis names.
			    	          y: {
			    	        	  MarketCap: {label: 'MarketCap'},
			    	        	  Price: {label: 'Price'}
			    	          }
			    	        }
			    	      };
			       


			      function drawMaterialChart() {
			        var materialChart = new google.charts.Line(chartDiv);
			        materialChart.draw(data, materialOptions);
			      }
			      drawMaterialChart();

			    }
			});
</script>

<%@ include file="../inc/footer.jsp"%>


