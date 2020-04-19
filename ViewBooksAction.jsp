<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
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
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/svecw","root","");
	statement=connection.createStatement();
	String sql ="select * from book";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("bookid") %></td>
		<td><%=resultSet.getString("bookname") %></td>
		<td><%=resultSet.getString("price") %></td>
		<td><%=resultSet.getString("quantity") %></td>
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