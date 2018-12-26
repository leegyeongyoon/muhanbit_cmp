<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Maintenance.Maintenancebean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<tr>
		<th>기간</th>
		<th>구분</th>
		<th>타입</th>
		<th>작업제목</th>
		<th>작업내용</th>
		<th>작업자</th>
		<th>비고</th>
	</tr>
	<%
		List<Maintenancebean> maintenancebean = (List<Maintenancebean>) request
				.getAttribute("maintenance_select_List");
		int requestt = 0, progress = 0, Complet = 0, visit = 0, remote = 0, flowing_line = 0, mail = 0,
				monthly_Inspection = 0, branch_Inspection = 0, remote_Inspection = 0, neww = 0, add = 0;
	%>
	<%
		for (Maintenancebean m : maintenancebean) {
	%>
	<tr>
		<td><%=m.getGo_date()%></td>
		<td><%=m.getSort()%></td>
		<td><%=m.getType()%></td>
		<td><%=m.getCa_title()%></td>
		<td><%=m.getContent()%></td>
		<td><%=m.getOp()%></td>
		<td><%=m.getOther()%></td>
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

	<div>
	<b>구분 : <%=requestt+progress+Complet %></b><br>
	요청 : <%=requestt%><br>	
	진행 : <%=progress%><br>
	완료 : <%=Complet%><br>
	<hr>
	<b>percall : <%=visit+remote+flowing_line+mail %></b><br>
	방문 : <%=visit%><br>
	원격 : <%=remote%><br>
	유선 : <%=flowing_line%><br>
	메일 : <%=mail%><br>
	<hr>
	<b>정기점검 : <%=monthly_Inspection+branch_Inspection+remote_Inspection %></b><br>
	매월점검 :<%=monthly_Inspection%><br>
	분기 점검 :<%=branch_Inspection%><br>
	원격점검 : <%=remote_Inspection%><br>
	<hr>
	<b>구축 : <%=neww+add %></b>
	신규 : <%=neww%><br>
	추가 : <%=add%><br>
</div>





</body>
</html>