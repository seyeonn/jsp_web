<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, lecture1.jdbc3.*" %>
<%
List<Student> list = StudentDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="/lecture1/res/common.js"></script>
<link rel="stylesheet" href="/lecture1/res/common.css"/>
<style>
  div.container { width: 600px; }
  h1 { margin-bottom: -20px; }
  a.btn { float: right; margin-bottom: 5px; }
</style>
</head>
<body>
<div class="container">

<h1>학생목록</h1>
<a class="btn" href="studentCreate.jsp">학생등록</a>

<table class="table">
  <thead>
    <tr>
      <th>학번</th>
      <th>이름</th>
      <th>학과</th>
      <th>학년</th>
    </tr>
  </thead>
  <tbody>
    <% for (Student student : list) { %>
      <tr class="clickable" data-url="studentEdit.jsp?id=<%= student.getId() %>">
        <td><%= student.getStudentNumber() %></td>
        <td><%= student.getName() %></td>
        <td><%= student.getDepartmentName() %></td>
        <td class="align-center"><%= student.getYear() %></td>
      </tr>
    <% } %>
  </tbody>
</table>

</div>
</body>
</html>

