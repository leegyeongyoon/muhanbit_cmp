<%@page import="Maintenance.Maintenancebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="Maintenance.Maintenancebean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
@media only screen and (max-width : 1200px) {
	#insert_btn1, #insert_btn2 {
		width: 100% !important;
		display: table !important;
	}
}
</style>
<script>
	$(document).ready(function() {
		$("#insert_btn1").click(function() {
			if ($("input[name=delete_check]").prop("checked")) {
				$("input[name=delete_check]").prop("checked", false);
			} else {
				$("input[name=delete_check]").prop("checked", true);
			}
		});
	})
</script>
<body>

	<div class="page_header">
		<div class="page_header_parallax">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>유지보수 현황 보기</h3>
						<h4>전체 보기</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li>유지보수 현황 보기</li>
							<li>전체 보기</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<select id="year" name="year">
		<%
			for (int i = 2010; i <= 2100; i++) {
		%>
		<option value="<%=i%>"><%=i%></option>
		<%
			}
		%>
	</select>
	<select id="month" name="month">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
	</select>월
	<input type="button" onclick="monthsel()" value="검색">


	<div class="inner-content"
		style="padding-top: 50px; padding-bottom: 450px;">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 double-space-bottom">
					<h2 class="heading space30">전체 유지보수 현황</h2>
					<div class="space-top">
						<form action="company_delete.co" method="post" name="com_del_form">
							<table class="table" id="monthselect">
								<thead>
									<tr>
										<th>기간</th>
										<th>구분</th>
										<th>타입</th>
										<th>작업 제목</th>
										<th>작업 내용</th>
										<th>작업자</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<input id="insert_btn1" class="button btn-lg" value="체크박스 전체 선책"
								type="button"
								style="font-size: 15px; display: inline; width: 49.8%;">
							<input id="insert_btn2" class="button btn-lg" value="체크 항목 삭제"
								type="button"
								style="font-size: 15px; display: inline; width: 49.8%;"
								onclick="delete_com()">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function monthsel() {
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			if (year == null || month == null) {
				if (year == null) {
					alert('년도를 선택해주세요');
				} else if (month == null) {
					alert('월을 선택해주세요');
				}
				return false;
			} else {
				var result = document.getElementById('monthselect');
				$.ajax({
					url : "Maintenance_list.ma?year=" + year + "&month="
							+ month,// test.jsp 에서 받아옴
					dataType : "json", // 데이터타입을 json 으로 받아옴
					success : function(data) {
						result.innerHTML = data;
					},
					error : function(e) {
						result.innerHTML = e.responseText;
					}
				});

			}

		}
	</script>
	
	<select>
		<option>1<p>hi</p></option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		얄랄루
	</select>
</body>
</html>