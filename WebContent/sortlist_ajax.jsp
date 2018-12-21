<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="state.statebean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% List<statebean> statebean = (List<statebean>) request.getAttribute("sortlist"); %>
			<% for(statebean s : statebean){

				%>
					<option value="<%=s.getTitle() %>"><%=s.getTitle() %></option>
				
			<%
			}
			%>
		
</body>
</html>