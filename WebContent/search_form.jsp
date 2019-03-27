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
		<form action="search_form_ok.se" method="get">
			<div class="inner-content">
		<div class="search-container">
			<div class="container">
				<div class="row">
					<h4 class="text-center">찾으시는 내용을 검색해 주세요</h4>
					<div class="col-md-8 col-md-offset-2" style="margin-bottom: 158px;">
						<div class="form-group">
						<h3 class="heading">카테고리 선택</h3>
							<select class="form-control" id="category_select" name="sort" style="height: 60px; padding: 0 20px; border: 1px solid darkblue;" onchange="search_first_selete()">
								<option value="0"></option>
								<option value="cus_info">고객사 정보</option>
								<option value="Main_info">유지보수 정보</option>
							</select>
						<h3 class="heading">항목 선택</h3>
							<select class="form-control" id="list_select" name="title" style="height: 60px; padding: 0 20px; border: 1px solid darkblue;" onchange="search_data_selete()">
								
							</select>
						</div>
						<h3 class="heading">검색 할 내용</h3>
						<div class="input-group" id="input_group">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>