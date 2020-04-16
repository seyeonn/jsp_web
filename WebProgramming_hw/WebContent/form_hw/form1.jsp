<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<body>
<%
String s1 = request.getParameter("number");
int number = (s1 == null) ? 0 : Integer.parseInt(s1) + 1;
%>
  <div class="container">
    <form method="get">
        <input type="text" name="number" value='<%= number %>' />
        <button type="submit"> ++ </button>
    </form>
  </div>
</body>
</html>

