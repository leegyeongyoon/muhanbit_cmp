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

.search {
	background-color: white;
	border: 1px solid #00008b;
	border-radius : 3px;
	font-weight : bold;
	padding: 10px 20px;
}

.search:hover {
	background-color: #e3e3fc;
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
	<div class="inner-content" style="padding-top: 50px; padding-bottom: 450px;">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 double-space-bottom">
				<h3 class="heading">날짜 선택</h3>
					<select id="year" name="year" class="form-control" style="height: 40px; padding: 0 20px; border: 1px solid darkblue; width: 100px; display: inline;">
						<%
							for (int i = 2010; i <= 2100; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select><span style="font-size: 20px; margin-right: 10px;">년</span>
					<select id="month" name="month" class="form-control" style="height: 40px; padding: 0 20px; border: 1px solid darkblue; width: 100px; display: inline;">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select><span style="font-size: 20px; margin-right: 10px;">월</span>
						<input type="button" onclick="monthsel()" value="검색" class="search">
					<h2 class="heading space30">전체 유지보수 현황</h2>
					<div class="space-top">
						<form action="company_delete.co" method="post" name="com_del_form">
						
						<div id="monthselect">
						
						</div>
						
							
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
			if (year == "" || month == "") {
				if (year == "") {
					alert('년도를 선택해주세요');
				} else if (month == "") {
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

</body>
</html>