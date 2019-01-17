<%@page import="Maintenance.Maintenancebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Maintenance.Maintenancebean"%>
<meta charset="UTF-8">
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
	
	@media only screen and (max-width : 1199px) {
	#table2{
		left: 800px !important;
	}
}

	@media only screen and (max-width : 991px) {
	#table2{
		display: none !important;
	}
	
	.paging li {
		display: inline-block;
		border: 1px solid #006bb7;
		border-radius : 3px;
		padding: 3px 10px;
		margin-top: 15px;
		
	}
	
	.paging li:hover {
		background-color: #dbf0ff;
	}
	
	.paging li a {
		font-size: 18px;
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
<body>

<div class="page_header">
		<div class="page_header_parallax">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>정보 검색</h3>
						<h4>유지보수 정보 검색</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li>정보 검색</li>
							<li>유지보수 정보 검색</li>
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
				<div class="col-sm-9 double-space-bottom">
					<h2 class="heading space30">유지보수 정보</h2>
					<div class="space-top"></div>
					<form action="#" method="post" name="#">
<table class="table">
<thead>
	<tr>
		<th>체크박스</th>
		<th>기간</th>
		<th>구분</th>
		<th>타입</th>
		<th>작업 제목</th>
		<th>작업 내용</th>
		<th>작업자</th>
		<th>비고</th>
		<th>고객사 명</th>
	</tr>
	</thead>
	<% List<Maintenancebean> maintenancebean = (List<Maintenancebean>) request.getAttribute("search_select_List");
		int requestt = 0, progress = 0, Complet = 0, visit = 0, remote = 0, flowing_line = 0, mail = 0,
			monthly_Inspection = 0, branch_Inspection = 0, remote_Inspection = 0, neww = 0, add = 0;
		
		String sort = request.getParameter("sort");
		String title = request.getParameter("title");
		String search_data = request.getParameter("search_data");

		
		int totalCount=0;
		int countList =0;
		int totalPage =0;
		int currentPage=0;
		int countPage=0;
	
	%>
	<% for(Maintenancebean m : maintenancebean){
							
						%>
	<tr>
		<td><input type="checkbox" value="" name="delete_check"></td>
		<td><%=m.getGo_date() %></td>
		<td><%=m.getSort() %></td>
		<td><%=m.getType() %></td>
		<td><%=m.getCa_title() %></td>
		<td><%=m.getContent() %></td>
		<td><%=m.getOp() %></td>
		<td><%=m.getOther() %></td>
		<td><%=m.getCom_name() %></td>
	</tr>
	<%
	
		requestt = 				m.getRequest();
		progress = 				m.getProgress();
		Complet =				m.getComplet();
		visit =					m.getVisit();
		remote =				m.getRemote();
		flowing_line =			m.getFlowing_line();
		mail =					m.getMail();
		monthly_Inspection =	m.getMonthly_Inspection();
		branch_Inspection =		m.getBranch_Inspection();
		remote_Inspection =		m.getRemote();
		neww=					m.getNeww();
		add=					m.getAdd();
		
		 totalCount = m.getTotalCount();
		 countList = m.getCountList();
		 totalPage = m.getTotalPage();
		 currentPage = m.getCurrentPage();
		 countPage = m.getCountPage();
	
	
						}
						%>
</table>
</form>
					<ul class="paging" style="text-align: center;">
											<%
					
						
						 int startPage = ((currentPage - 1) /5) * 5 + 1;
				         int endPage = startPage + countPage - 1;
				     
				         if(totalCount == 0){
				        	%> <li><a href="company_list.co?&currentPage=1&sort=<%=sort%>&title=<%=title%>&search_data=<%=search_data%>">1</a></li><%
				         }
				         
				         else{
						if(totalCount % countList > 0){
				            totalPage++;
				         }

				         if(totalPage < currentPage){
				            currentPage = totalPage;
				         }

				        

				         if(endPage > totalPage){
				            endPage = totalPage;
				         }

				         if(currentPage>=6){
				         %>
				            <li><a href="company_list.co?&currentPage=1&sort=<%=sort%>&title=<%=title%>&search_data=<%=search_data%>">처음</a></li>
				         <%
				         }
				         
				         if(currentPage>5){
				         %>
				            <li><a href="search_form_ok.se?currentPage=<%=startPage-countPage%>&sort=<%=sort%>&title=<%=title%>&search_data=<%=search_data%>">이전</a></li>
				         <%
				         }
				         
				         for(int i = startPage; i <= endPage; i++){
				        	
				         %>
				         <li><a href="search_form_ok.se?currentPage=<%=i%>&sort=<%=sort%>&title=<%=title%>&search_data=<%=search_data%>"><%=i%></a></li>
				         <%
				         }
				         if(endPage!=totalPage){
				         %>
				         <li><a href="search_form_ok.se?currentPage=<%=startPage+countPage%>&sort=<%=sort%>&title=<%=title%>&search_data=<%=search_data%>">다음</a></li>
				         <%
				         }
				         
				         if(endPage!=totalPage){
				         %>
				         <li><a href="search_form_ok.se?currentPage=<%=totalPage%>&sort=<%=sort%>&title=<%=title%>&search_data=<%=search_data%>">끝</a></li>
				         <%
				            }
				         }
				         %>
				     	</ul>	
	<div class="space30" ></div>
		<table class="table table-bordered" style="position: absolute; width: 150px; left: 950px;top : 0px;font-weight: bold; font-size: 13px;" id="table2">
				<tr style="background-color: gray;">
					<td>구분</td>
					<td>해당건수</td>
				</tr>
				<tr style="background-color: #9b9b9b">
					<td>장애</td>
					<td><%=requestt+progress+Complet %>건</td>
				</tr>
				
				<tr style="background-color: #d3d3d3">
                    <td>요청</td>
                    <td><%=requestt %>건</td>
                </tr>
                <tr style="background-color: #d3d3d3">
                    <td>진행</td>
                    <td><%=progress %>건</td>
                </tr>
                <tr style="background-color: #d3d3d3">
                    <td>완료</td>
                    <td><%=Complet %>건</td>
                </tr>
                <tr style="background-color: #8fbdef">
                    <td>percall</td>
                    <td><%=visit+remote+flowing_line+mail %>건</td>
                </tr>
                <tr style="background-color: #cfdfff">
                    <td>방문</td>
                    <td><%=visit %>건</td>
                </tr>
                <tr style="background-color: #cfdfff">
                    <td>원격</td>
                    <td><%=remote %>건</td>
                </tr>
                <tr style="background-color: #cfdfff">
                    <td>유선</td>
                    <td><%=flowing_line %>건</td>
                </tr>
                <tr style="background-color: #cfdfff">
                    <td>메일</td>
                    <td><%=mail %>건</td>
                </tr>
                <tr style="background-color: #f7eb64">
                    <td>정기점검</td>
                    <td><%=monthly_Inspection+branch_Inspection+remote_Inspection %>건</td>
                </tr>
                <tr style="background-color: #f9f6bb">
                    <td>매월점검</td>
                    <td><%=monthly_Inspection %>건</td>
                </tr>
                <tr style="background-color: #f9f6bb">
                    <td>분기점검</td>
                    <td><%=branch_Inspection %>건</td>
                </tr>
                <tr style="background-color: #f9f6bb">
                    <td>원격점검</td>
                    <td><%=remote_Inspection %>건</td>
                </tr>
                <tr style="background-color: #a6e2aa">
                    <td>구축</td>
                    <td><%=neww+add %>건</td>
                </tr>
                <tr style="background-color: #ddf5d6">
                    <td>신규</td>
                    <td><%=neww %>건</td>
                </tr>
                <tr style="background-color: #ddf5d6">
                    <td>추가</td>	
					<td><%=add %>건</td>		
				</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
</body>
</html>