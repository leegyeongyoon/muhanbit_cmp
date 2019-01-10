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
	<% List<Maintenancebean> maintenancebean = (List<Maintenancebean>) request.getAttribute("maintenanceList");
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
<div class="space30" ></div>
		<table class="table table-bordered" style="position: relative; width: 150px; left: 900px;bottom: 300px; font-weight: bold; font-size: 13px;" id="table2">
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