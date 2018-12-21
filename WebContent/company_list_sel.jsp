<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="company.companybean" %>

						<% List<companybean> companybean = (List<companybean>) request.getAttribute("companyList"); %>
						<% for(companybean c : companybean){

						%>
							
								
								<option value="<%=c.getName() %>"><%=c.getName() %></option>
								
											
						<%
						}
						%>
			
</html>