<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
table {
	border-collapse: collapse;
}

td {
	padding: 5px;
	border: solid 1px gray;
}
</style>
</head>
<body>

	<table>
		<tr>
			<%
				for (int i = 2; i < 10; ++i) {
					out.println("    <td>");
				    for (int j = 1; j < 10; ++j) {
					   out.println(i + " x " + j + " = " + i * j + "<br>");
				}
				    out.println("</td>");
			}
			%>
		</tr>
	</table>

</body>
</html>
