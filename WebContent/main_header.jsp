<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- HEADER -->
			<div class="container">
				<div class="navbar yamm navbar-default">
					<div class="navbar-header">
						<button type="button" data-toggle="collapse"
							data-target="#navbar-collapse-1" class="navbar-toggle">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a href="index.jsp" class="navbar-brand"><span
							style="width: 40px; color: darkblue; font-family: 'Montserrat', 'Helvetica Neue', Arial, sans-serif; font-weight: bold;">CMP</span></a>
					</div>
					<div id="navbar-collapse-1"
						class="navbar-collapse collapse navbar-right">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="#" data-toggle="dropdown"
								class="dropdown-toggle"> 유지보수 현황 관리
									<div class="arrow-up">
										<i class="fa fa-angle-down"></i>
									</div>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="company_insert_page.co">고객사 등록</a></li>
									<li><a href="company_list.co">고객사 관리</a></li>
									<li><a href="state_insert_page.do">작업 제목 등록</a></li>
									<li><a href="state_delete_page.do">작업 제목 관리</a></li>
									<li><a href="#">유지보수 등록</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" data-toggle="dropdown"
								class="dropdown-toggle"> 유지보수 현황 보기
									<div class="arrow-up">
										<i class="fa fa-angle-down"></i>
									</div>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="index.jsp?section=table.jsp">고객사별 보기</a></li>
									<li><a href="#">전체 보기</a></li>
								</ul></li>
							<li class="dropdown"><a href="#"> 데이터 백업 </a></li>
							<li class="dropdown"><a href="index.jsp?section=search.jsp"> 유지보수 현황 검색 </a></li>
						</ul>
					</div>
				</div>
			</div>
</body>
</html>