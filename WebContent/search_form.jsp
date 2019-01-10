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
						<h3>유지보수 현황 검색</h3>
						<h4>검색 내용</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li>유지보수 현황 검색</li>
							<li>검색 내용</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		</div>
			<div class="inner-content">
		<div class="search-container">
			<div class="container">
				<div class="row">
					<h4 class="text-center">찾으시는 내용을 검색해 주세요</h4>
					<div class="col-md-8 col-md-offset-2" style="margin-bottom: 158px;">
						<div class="form-group">
						<h3 class="heading">항목 선택</h3>
							<select class="form-control" id="state_select" name="sort" style="height: 60px; padding: 0 20px; border: 1px solid darkblue;" onchange="#">
								<option></option>
								<option value="go_date">날짜</option>
								<option value="sort">구분</option>
								<option value="type">타입</option>
								<option value="title">작업 제목</option>
								<option value="content">작업 내용</option>
								<option value="op">작업자</option>
								<option value="customer">고객사 명</option>
							</select>
						</div>
						<h3 class="heading">검색 할 내용</h3>
						<div class="input-group">
							<input class="form-control" placeholder="검색 할 내용을 적어주세요" type="text" name="#">
							<span class="input-group-btn">
							<button type="submit"><i class="fa fa-search"></i></button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>