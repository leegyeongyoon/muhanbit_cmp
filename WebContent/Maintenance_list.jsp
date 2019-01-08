<%@page import="Maintenance.Maintenancebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Maintenance.Maintenancebean"%>
<meta charset="UTF-8">
<thead>
	<tr>
		<th>기간</th>
		<th>구분</th>
		<th>타입</th>
		<th>작업 제목</th>
		<th>작업 내용</th>
		<th>작업자</th>
		<th>비고</th>
	</tr>
	</thead>
	<% List<Maintenancebean> maintenancebean = (List<Maintenancebean>) request.getAttribute("maintenanceList"); %>
	<% for(Maintenancebean m : maintenancebean){
							
						
						%>
	<tr>
		<td><%=m.getGo_date() %></td>
		<td><%=m.getSort() %></td>
		<td><%=m.getType() %></td>
		<td><%=m.getCa_title() %></td>
		<td><%=m.getContent() %></td>
		<td><%=m.getOp() %></td>
		<td><%=m.getOther() %></td>
	</tr>
	<%
						}
						%>