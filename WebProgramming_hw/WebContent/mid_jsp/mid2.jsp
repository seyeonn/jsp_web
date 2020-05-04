<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
form div {
	margin-bottom: 10px;
}

button {
	padding: 0.4em 2em;
	margin-top: 10px;
}

input {
	width: 150px;
	padding: 4px;
}
</style>
</head>
<body>
<%
String number = request.getParameter("number");
if (number == null)
	number = "one";
%>
	<form method="get">
      <label><input type="radio" name="radio1" value="one" />one</label>
      <label><input type="radio" name="radio1" value="two" />two</label>
      <label><input type="radio" name="radio1" value="three" />three</label>
		<div>
			<input type="text" value='<%=number%>' />
		</div>
		<div>
			<button type="submit">Ok</button>
		</div>
	</form>

</body>
</html>

