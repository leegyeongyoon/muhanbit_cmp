<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="company.companybean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@media only screen and (max-width : 1200px) {
		#insert_btn {
			width: 100% !important;
			display : table !important;
		}
	}
</style>
</head>
<body>
		<div class="page_header">
		<div class="page_header_parallax">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>유지보수 현황관리</h3>
						<h4>고객사 정보 수정</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li>유지보수 현황 관리</a></li>
							<li>고객사 정보 수정</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="inner-content">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
				<% List<companybean> companybean = (List<companybean>) request.getAttribute("companyUpdate"); %>
				<% for(companybean c : companybean){
	
					%>
					<h4 class="uppercase" style = "margin : 15px 0px;">고객사 이름</h4>
					<form action="company_update_ok.co" method="post">
					<input type="hidden" value="<%=c.getName()%>" name="name">
						<div class="form-group">
							<input class="form-control" name="company_name" type="text" autocomplete="off" autofocus="autofocus" value="<%=c.getName()%>">
						</div>
					<h4 class="uppercase" style = "margin : 15px 0px;">담당자 이름</h4>
						<div class="form-group">
							<input class="form-control" name="manager_name" type="text" autocomplete="off" value="<%=c.getManager()%>">
						</div>
					<h4 class="uppercase" style = "margin : 15px 0px;">담당자 전화번호</h4>
						<div class="form-group">
							<input class="form-control" name="manager_phone" type="text" autocomplete="off" value="<%=c.getPhone()%>">
						</div>
					<h4 class="uppercase" style = "margin : 15px 0px;">담당자 이메일</h4>
						<div class="form-group">
							<input class="form-control" name="manager_email" type="text" autocomplete="off" value="<%=c.getEmail()%>">
						</div>
					<h4 class="uppercase" style = "margin : 15px 0px;">고객사 주소</h4>
						<div class="form-group">
							<input class="form-control" name="company_address" type="text" autocomplete="off" value="<%=c.getAddress()%>">
						</div>	
						<input id = "insert_btn" class="button btn-lg" value="수정하기" type="submit" style = "font-size : 15px; display:inline;">
						<input id = "insert_btn" class="button btn-lg" value="메인으로" type="button" onclick="location.href='index.do'" style = "font-size : 15px; display:inline;">
						<div class="space20"></div>
					</form>
					<%
				}
				%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>