<%@page import="Maintenance.Maintenancebean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Maintenance.Maintenancebean"%>
<meta charset="UTF-8">
<table class="table">

<thead>
	<tr>
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
	%>
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
	
	
						}
						%>
</table>
