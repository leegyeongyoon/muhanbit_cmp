<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="company.companybean" %>
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
						<h3>유지보수 현황 관리</h3>
						<h4>고객사 관리</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li>유지보수 현황 관리</li>
							<li>고객사 관리</li>
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
					<h2 class="heading space30">고객사 정보</h2>
					<div class="space-top">
					<form action="company_delete.co" method="post" name="com_del_form">
						<table class="table">
							<thead>
								<tr>
									<th>체크박스</th>
									<th>고객사 명</th>
									<th>고객사 주소</th>
									<th>담당자</th>
									<th>담당자 연락처</th>
									<th>담당자 이메일</th>
								</tr>
							</thead>
							<tbody>
						<% List<companybean> companybean = (List<companybean>) request.getAttribute("companyList"); %>
						<% for(companybean c : companybean){

						%>
							<tr>
								<td><input type="checkbox" value="<%=c.getName()%>" name="delete_check"></td>
								<td><a href="company_update.co?name=<%=c.getName()%>"><%=c.getName() %></a></td>
								<td><%=c.getAddress() %></td>
								<td><%=c.getManager() %></td>
								<td><%=c.getPhone() %></td>
								<td><%=c.getEmail() %></td>
								
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
	<script type="text/javascript">
		function delete_com(){
			var del_chk = document.getElementsByName("delete_check");
			var count = 0;
			for(var i=0 ; i <del_chk.length ; i ++){
			if(del_chk[i].checked == true){
				count = 1;
			}}
			
			if(count == 1 ){
				var con = confirm("정말 삭제하시겠습니까?");
				
				if(con == true){
					document.com_del_form.submit();
				}
				
				else if(con == false){
					alert('아니요 . 삭제하지 않을거에요 !!');
				}
				
			}
			else if(count == 0) {
				alert('체크박스가 선택되지 않으셨습니다.');
			}
		}
	</script>
</html>