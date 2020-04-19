<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "OrderBooksAction">
	Enter the id of the book: <input type = "text" name = "bid"><br>
	Enter the name of the book: <input type = "text" name = "bname"><br>
	Enter your id: <input type = "text" name = "sid"><br>
	Enter your name: <input type = "text" name = "sname"><br>
	Enter the issuedate of the book: <input type = "date" name = "issdate"><br>
	Enter the return of the book: <input type = "date" name = "retdate"><br>
	<input type = "submit" value = "OrderBooks">
	</form>
</body>
</html>