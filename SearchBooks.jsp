<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
	<td>bookid</td>
	<td>bookname</td>
	<td>price</td>
	<td>quantity</td>
</tr>
<%
try{
	String bname = request.getParameter("bname");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
	PreparedStatement ps = con.prepareStatement("select * from book where bookname = '"+bname+"' ");
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString("bookid") %></td>
			<td><%=rs.getString("bookname") %></td>
			<td><%=rs.getString("price") %></td>
			<td><%=rs.getString("quantity") %></td>
		</tr>
		<%
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
</table>
</body>
</html>