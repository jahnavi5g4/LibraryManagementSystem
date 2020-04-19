<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String rno = request.getParameter("rollno");
	String pw = request.getParameter("password");
	if (rno.equals("admin") && pw.equals("admin")){
		response.sendRedirect("adminhomepage.html");
	}
	else {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
			PreparedStatement ps = con.prepareStatement("select * from student where RollNO = ' "+ rno+ "' and password =' "+ pw+ "' " );
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
			     
		
				session.setAttribute("key",rno);
				response.sendRedirect("userhomepage.html");
			}else{
				%>
				
				<h1 style=" text-align:center;color:red">INVALID CREDENTIAL</h1>
		
				<%
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	%>
</body>
</html>