<%@page import="Maintenance.Maintenancebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="company.companybean" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	@media only screen and (max-width : 1200px) {
		#table2{
			left : 750px !important;
		}
	}
	
	@media only screen and (max-width : 992px) {
		#table2{
			display : none !important;
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

$(document).ready(function(){
    $("#insert_btn1").click(function(){
       if($("input[name=#]").prop("checked")){
          $("input[name=#]").prop("checked",false);
        }else{
            $("input[name=#]").prop("checked",true);
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
						<h4>고객사 별 보기</h4>
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
							<li>고객사 별 보기</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="inner-content" style="padding-top: 50; padding-bottom: 465px;">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 double-space-bottom">
					<h2 class="heading">고객사/날짜 선택</h2>
					<div class="space-top">
						<select class="form-control space30" id="select_company" name="select_company"  style="height: 40px; padding: 5 20px; border: 1px solid darkblue; width: 20%; display: inline;">
						<option></option>
						<% List<companybean> companybean = (List<companybean>) request.getAttribute("companyList"); %>
										<% for(companybean c : companybean){
				
										%>
											
												<option value="<%=c.getName()%>"> <%=c.getName()%> </option>
													
										<%
										}
										%>
							
						</select><span style="font-size: 20px; margin-right: 10px;">회사</span>
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
						<input type="button" onclick="select_list_data()" value="검색" class="search">
						<div id="name_select"></div>
						<script>
		
						function select_list_data(){
							
							var year = document.getElementById("year").value;
							var month = document.getElementById("month").value;
							var company = document.getElementById("select_company").value;
							if (year == "" || month == ""|| company == "") {
								if (year == "") {
									alert('년도를 선택해주세요');
								} else if (month == "") {
									alert('월을 선택해주세요');
								}
								else{
									alert('회사를 선택해주세요');
								}
								return false;
							}
							
							else {
					        var result = document.getElementById('name_select');
					                $.ajax({
					                    url : "Maintenance_list.ma?company="+company+"&year=" + year + "&month="+ month ,// select_list_data.jsp 에서 받아옴
					                    dataType :"json", // 데이터타입을 json 으로 받아옴
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
					</div>
				</div>
		</div>
	</div>
	</div>

</html>