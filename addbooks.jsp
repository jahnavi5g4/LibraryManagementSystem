<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "addbooksAction">
	Enter the id of the book: <input type = "text" name = "bid"><br>
	Enter the book you want to add:<input type = "text" name = "book"><br>
	Enter the price of the book:<input type = "text" name = "price"><br>
	Enter the quantity of the book:<input type = "text" name = "qnt"><br>
	<input type = "submit" value = "AddBooks">
	</form>
</body>
</html>