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
	width: 100px;
}
</style>
</head>
<body>
<%
String s1 = request.getParameter("number");
int number = (s1 == null) ? 0 : Integer.parseInt(s1);
%>
    <form method="get">
        <input type="text" name="number" value='<%= number %>' />
        <button type="submit"> 단 </button>
    </form>
    <br>
	<table>
			<%
				for (int i = 1; i < 10; ++i) {
					out.println("    <tr>\n<td>" + number + " x " + i + " = " + i * number + "</td>\n</tr>");			
			}
			%>	
	</table>

</body>
</html>
