<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style>
  table { width: 500px; border-collapse: collapse; }
  thead tr { background-color: #eee; }
  td, th { border: 1px solid #aaa; padding: 5px; }
</style>

</head>
<body>

  <div class="container">
    <% request.setCharacterEncoding("utf-8"); %>  //꺼낼 데이터가 한글이라면 선언해주어야 한다.

    <h1>request parameter</h1>    
    <table>
      <thead>
        <tr>
          <th>Parameter Name</th>
          <th>Parameter Value</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>param1</td>
          <td><%= request.getParameter("param1") %></td>
        </tr>
        <tr>
          <td>param2</td>
          <td><%= request.getParameter("param2") %></td>
        </tr>
        <tr>
          <td>cmd</td>
          <td><%= request.getParameter("cmd") %></td>
        </tr>
        <tr>
          <td>method</td>
          <td><%= request.getMethod() %></td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>

