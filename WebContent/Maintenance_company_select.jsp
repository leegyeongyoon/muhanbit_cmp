<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="company.companybean" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<select  id="select_company" name="select_company" onchange="select_list_data()">
			<option></option>
		<% List<companybean> companybean = (List<companybean>) request.getAttribute("companyList"); %>
						<% for(companybean c : companybean){

						%>
							
								<option value="<%=c.getName()%>"> <%=c.getName()%> </option>
									
						<%
						}
						%>
						
						</select>
						
						
						<table id="name_select">
							<tr>
								<th>기간</th>
								<th>구분</th>
								<th>타입</th>
								<th>작업제목</th>
								<th>작업내용</th>
								<th>작업자</th>
								<th>비고</th>
							</tr>
						</table>
						
						
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
</body>
</html>