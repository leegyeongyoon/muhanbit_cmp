<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
								//드라이버 로드
								String product_name = "";
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "muhanbit");
								PreparedStatement pstmt = conn.prepareStatement("CREATE DATABASE cmp");
								pstmt.executeUpdate();
								pstmt.close();
								conn.close();	
								response.sendRedirect("C:/Muhanbit_Program/CMP/WebContent/backup/createdatabase.jsp");
						%>
</body>
</html>