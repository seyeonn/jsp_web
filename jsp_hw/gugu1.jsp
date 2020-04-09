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
			<%
				for (int i = 1; i < 10; ++i) {
					out.println("  <tr>");
				    for (int j = 2; j < 10; ++j) {
					out.println("    <td>" + j + " x " + i + " = " + i * j + "</td>");
				}
				    out.println("   </tr>");
			}
			%>	
	</table>

</body>
</html>
