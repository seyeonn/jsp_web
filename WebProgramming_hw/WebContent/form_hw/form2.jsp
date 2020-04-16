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

select {
	width: 60px;
	padding: 4px;
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
String s1 = request.getParameter("s1");
if (s1 == null)
	s1 = "one";
%>
	<form method="get">
		<div>
			<select name="s1">
				<option value="one" <%="one".equals(s1) ? "selected" : ""%>>one</option>
				<option value="two" <%="two".equals(s1) ? "selected" : ""%>>two</option>
				<option value="three" <%="three".equals(s1) ? "selected" : ""%>>three</option>
			</select>
		</div>
		<div>
			<input type="text" value='<%=s1%>' />
		</div>
		<div>
			<button type="submit">Ok</button>
		</div>
	</form>

</body>
</html>

