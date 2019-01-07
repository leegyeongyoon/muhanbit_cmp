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
		#insert_btn1, #insert_btn2{
			width: 100% !important;
			display : table !important;
		}
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
					<h2 class="heading">고객사 선택</h2>
					<div class="space-top">
						<select class="form-control space20" id="select_company" name="select_company" onchange="select_list_data()" style="height: 50px; padding: 5 20px; border: 1px solid darkblue; width: 20%;">
						<option></option>
						<% List<companybean> companybean = (List<companybean>) request.getAttribute("companyList"); %>
										<% for(companybean c : companybean){
				
										%>
											
												<option value="<%=c.getName()%>"> <%=c.getName()%> </option>
													
										<%
										}
										%>
							
						</select>
						<div id="name_select"></div>
						<script>
		
						function select_list_data(){
					        var result = document.getElementById('name_select');
					                $.ajax({
					                    url : "Maintenance_select_list.ma?company="+document.getElementById("select_company").value ,// select_list_data.jsp 에서 받아옴
					                    dataType :"json", // 데이터타입을 json 으로 받아옴
					                    success : function(data) {
					                        result.innerHTML = data;
					                    },
					                    error : function(e) {
					                        result.innerHTML = e.responseText;
					                    }
					                });
								            
								}	
												
						</script>
					</div>
				</div>
		</div>
	</div>
	</div>

</html>