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
}

select {
	margin-top: 10px;
}
</style>
</head>
<body>
<%
String number = request.getParameter("radio1");
String one = "one".equals(number) ? "checked" : "";
String two = "two".equals(number) ? "checked" : "";
String three = "three".equals(number) ? "checked" : "";
if (number == null) {
	number = "one";
	one = "checked";
}
%>
	<form method="get">
      <label><input type="radio" name="radio1" value="one" <%= one %>/>one</label>
      <label><input type="radio" name="radio1" value="two" <%= two %>/>two</label>
      <label><input type="radio" name="radio1" value="three" <%= three %>/>three</label>
	  <div>
			<select name="number">
				<option value="one" <%="one".equals(number) ? "selected" : ""%>>one</option>
				<option value="two" <%="two".equals(number) ? "selected" : ""%>>two</option>
				<option value="three" <%="three".equals(number) ? "selected" : ""%>>three</option>
			</select>
	   </div>
		<div>
			<button type="submit">Ok</button>
		</div>
	</form>

</body>
</html>

