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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	@media only screen and (max-width : 1200px) {
		#insert_btn1, #insert_btn2{
			width: 100% !important;
			display : table !important;
		}
	}
</style>
<script>

$(document).ready(function(){
    $("#insert_btn1").click(function(){
       if($("input[name=delete_check]").prop("checked")){
          $("input[name=delete_check]").prop("checked",false);
        }else{
            $("input[name=delete_check]").prop("checked",true);
           }
       });
    })
    
</script>
</head>
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
							<li>유지보수 현황 보기</a></li>
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
					<h2 class="heading space30">전체 유지보수 현황</h2>
					<div class="space-top">
					<form action="company_delete.co" method="post" name="com_del_form">
						<table class="table">
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
						<% List<Maintenancebean> maintenancebean = (List<Maintenancebean>) request.getAttribute("maintenanceList"); %>
						<% for(Maintenancebean m : maintenancebean){
						%>
							<tr>
								<td><%=m.getGo_date() %></td>
								<td><%=m.getSort() %></td>
								<td><%=m.getType() %></td>
								<td><%=m.getCa_title() %></td>
								<td><%=m.getContent() %></td>
								<td><%=m.getOp() %></td>
								<td><%=m.getOther() %></td>
							</tr>				
						<%
						}
						%>
							</tbody>
						</table>
						<input id = "insert_btn1" class="button btn-lg" value="체크박스 전체 선책" type="button" style = "font-size : 15px; display:inline; width: 49.8%;">
						<input id = "insert_btn2" class="button btn-lg" value="체크 항목 삭제" type="button" style = "font-size : 15px; display:inline; width: 49.8%;" onclick="delete_com()">
						</form>
					</div>
				</div>
		</div>
	</div>
	</div>

</html>