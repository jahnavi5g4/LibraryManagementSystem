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
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
		PreparedStatement ps6 = con.prepareStatement("select * from booksissued where status = 'not issued'");
		ResultSet rs6 = ps6.executeQuery();
		if (rs6.next()){
		PreparedStatement ps = con.prepareStatement("update booksissued set status = 'issued' ");
		int i = ps.executeUpdate();
		PreparedStatement ps2 = con.prepareStatement("select * from booksissued");
		ResultSet rs1 = ps2.executeQuery();
		while (rs1.next()){
			int bid = rs1.getInt("bookid");
			PreparedStatement ps3 = con.prepareStatement("select * from book where bookid = '"+bid+"'");
			ResultSet rs2 = ps3.executeQuery();
			while (rs2.next()){
				int qnt = rs2.getInt("quantity");
				if (qnt >= 1){
					PreparedStatement ps4 = con.prepareStatement("update book set quantity = '"+(qnt-1)+"' where bookid = '"+bid+"'");
					int j = ps4.executeUpdate();
					if (j > 0){
						response.sendRedirect("success.html");
					}
					else{
						response.sendRedirect("failure.html");
					}
				}
				else{
					PreparedStatement ps5 = con.prepareStatement("delete from book where bookid = '"+bid+"'");
					int k = ps5.executeUpdate();
					if (k > 0){
						response.sendRedirect("success.html");
					}
					else{
						response.sendRedirect("failure.html");
					}
				}
			}
			
		}
		%>
		<table border="1">
		<tr>
			<td>bookid</td>
			<td>bookname</td>
			<td>issuedate</td>
			<td>returndate</td>
			<td>status</td>
		</tr>
	<%
		PreparedStatement ps1 = con.prepareStatement("select * from booksissued");
		ResultSet rs = ps1.executeQuery();
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("bookid") %></td>
				<td><%=rs.getString("bookname") %></td>
				<td><%=rs.getString("issuedate") %></td>
				<td><%=rs.getString("returndate") %></td>
				<td><%=rs.getString("status") %></td>
			</tr>
			<%
		}
		}
		else{
			%>
			<h1>Already Issued</h1>
			<%
		}
	%>
	</table>
</body>
</html>