<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
	try {
	    Context init = new InitialContext();
	           
	    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/leegy");
	    
	    Connection conn = null;
	    conn = ds.getConnection();
	   	
	    PreparedStatement pstmt = conn.prepareStatement("select id from member_tbl");
	    ResultSet rs = pstmt.executeQuery();
	    while(rs.next()){
	    	String id = rs.getString(1);
	    	out.println(id);
	    }
	           
	} catch (NamingException e1) {
	    e1.printStackTrace();
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	
	%>
</body>
</html>