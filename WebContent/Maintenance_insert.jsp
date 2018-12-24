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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<script>
		function state_change(){
		        var result = document.getElementById('name_select');
		                $.ajax({
		                    url : "test.do?sort="+document.getElementById("state_select").value ,// test.jsp 에서 받아옴
		                    dataType :"json", // 데이터타입을 json 으로 받아옴
		                    success : function(data) {
		                        result.innerHTML = data;
		                    },
		                    error : function(e) {
		                        result.innerHTML = e.responseText;
		                    }
		                });
		            
		    	
			
			if(document.getElementById("state_select").value=="장애"){
				document.getElementById("type_select").innerHTML= "<option value='요청'>요청</option>"
				+"<option value='진행'>진행</option>"
				+"<option value='완료'>완료</option>"
			}
			
			else if(document.getElementById("state_select").value=="percall"){
				document.getElementById("type_select").innerHTML= "<option value='방문'>방문</option>"
				+"<option value='원격'>원격</option>"
				+"<option value='유선'>유선</option>"
				+"<option value='메일'>메일</option>"
			}
			
			else if(document.getElementById("state_select").value=="정기점검"){
				document.getElementById("type_select").innerHTML= "<option value='매월점검'>매월점검</option>"
				+"<option value='분기점검'>분기점검</option>"
				+"<option value='원격점검'>원격점검</option>"
			}
			
			else if(document.getElementById("state_select").value=="구축"){
				document.getElementById("type_select").innerHTML= "<option value='신규'>신규</option>"
				+"<option value='추가'>추가</option>"
			}
		
		}	
		
		function companysel(){
	        var result = document.getElementById('company_select');
            $.ajax({
                url : "company_list_select.co",// test.jsp 에서 받아옴
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
		<div class="page_header">
		<div class="page_header_parallax">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3>유지보수 현황관리</h3>
						<h4>유지 보수 등록</h4>
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
							<li>유지 보수 등록</li>
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
					<form action="mainten_insert.ma" method="post">
					<h4 class="uppercase" style = "margin : 15px 0px;">구분</h4>
						<div class="form-group">
							<select class="form-control" onchange="state_change()" id="state_select" onclick="companysel()" name="sort" style="height: 50px; padding: 0 20px; border: 1px solid darkblue;">
								<option></option>
								<option value="장애">장애</option>
								<option value="percall">percall</option>
								<option value="정기점검">정기점검</option>
								<option value="구축">구축</option>
							</select>
						</div>
						<h4 class="uppercase" style = "margin : 15px 0px;">타입</h4>
						<div class="form-group">
								<select class="form-control" id="type_select" name="type" style="height: 50px; padding: 0 20px; border: 1px solid darkblue;">
				
								</select>
						</div>
						<h4 class="uppercase" style = "margin : 15px 0px;">작업 제목</h4>
						<div class="form-group">
								<select class="form-control" id="name_select" name="ca_title" style="height: 50px; padding: 0 20px; border: 1px solid darkblue;">
				
								</select>
						</div>
						<h4 class="uppercase" style = "margin : 15px 0px;">고객사 명</h4>
						<div class="form-group">
								<select class="form-control" id="company_select" name="com_name" style="height: 50px; padding: 0 20px; border: 1px solid darkblue;">
				
								</select>
						</div>
						<h4 class="uppercase" style = "margin : 15px 0px;">작업 내용</h4>
						<div class="form-group">
								<input class="form-control" name="content" type="text" autocomplete="off">
						</div>
						<h4 class="uppercase" style = "margin : 15px 0px;">작업자</h4>
						<div class="form-group">
								<input class="form-control" name="op" type="text" autocomplete="off">
						</div>
						<h4 class="uppercase" style = "margin : 15px 0px;">비고</h4>
						<div class="form-group">
								<input class="form-control" name="other" type="text" autocomplete="off">
						</div>
						<h4 class="uppercase" style = "margin : 15px 0px;">날짜</h4>
						<div class="form-group">
								<input class="form-control" name="go_date" type="date">
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