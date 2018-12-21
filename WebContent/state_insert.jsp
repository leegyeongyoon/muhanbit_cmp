<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<h4>작업 제목 등록</h4>
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
							<li>작업제목 등록</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="inner-content" style="margin-bottom: 200px;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<form action="state_insert.do" method="post">
					<h4 class="uppercase" style = "margin : 15px 0px;">구분</h4>
						<div class="form-group">
							<select class="form-control" id="state_select" name="sort" style="height: 50px; padding: 0 20px; border: 1px solid darkblue;">
								<option></option>
								<option value="장애">장애</option>
								<option value="percall">percall</option>
								<option value="정기점검">정기점검</option>
								<option value="구축">구축</option>
							</select>
						</div>
					<h4 class="uppercase" style = "margin : 15px 0px;">작업제목</h4>
						<div class="form-group">
							<input class="form-control" id="work_name" name="title" type="text" autocomplete="off">
						</div>
						<input id = "insert_btn" class="button btn-lg" value="등록하기" type="submit" style = "font-size : 15px; display:inline;">
						<input id = "insert_btn" class="button btn-lg" value="메인으로" type="button" onclick="location.href='index.do'" style = "font-size : 15px; display:inline;">
						<div class="space20"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>