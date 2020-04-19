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
	try{
		String rollno = session.getAttribute("key").toString();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
		PreparedStatement ps1 = con.prepareStatement("select * from booksissued where sid = '"+rollno+"'");
		ResultSet rs = ps1.executeQuery();
		while(rs.next()){
			int bid = rs.getInt("bookid");
			String bname = rs.getString("bookname");
			PreparedStatement ps3 = con.prepareStatement("select * from book where bookid = '"+bid+"'");
			ResultSet rs2 = ps3.executeQuery();
			if (rs2.next()){
				int qnt = rs2.getInt("quantity");
				if (qnt >= 1){
					PreparedStatement ps4 = con.prepareStatement("update book set quantity = '"+(qnt+1)+"' where bookid = '"+bid+"'");
					int j = ps4.executeUpdate();
					if (j > 0){
						response.sendRedirect("success.html");
					}
					else{
						response.sendRedirect("failure.html");
					}
				}
				else{
					PreparedStatement ps5 = con.prepareStatement("insert into book(bookid,bookname,price,quantity)values('"+bid+"','"+bname+"','"+10+"','"+1+"')");
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
		PreparedStatement ps = con.prepareStatement("delete from booksissued where sid=?");
		ps.setString(1,rollno);
		int i = ps.executeUpdate();
		if (i > 0){
			response.sendRedirect("success.html");
		}
		else{
			response.sendRedirect("failure.html");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>