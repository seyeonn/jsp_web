<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, lecture1.jdbc2.*" %>
<%
    List<Course> list = CourseDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/lecture1/res/common.css"/>
<style>
  div.container { width: 600px; }
  h1 { margin-bottom: -20px; }
  a.btn { float: right; margin-bottom: 5px; }
</style>
</head>
<body>
<div class="container">

<h1>강좌목록</h1>
<a class="btn" href="courseCreate1.jsp">강좌등록</a>

<table class="table">
  <thead>
    <tr>
      <th>강좌명</th>
      <th>개설학과</th>
      <th>학점</th>
      <th>담당교수</th>
      <th>시작일</th>
    </tr>
  </thead>
  <tbody>
    <%
        for (Course course : list) {
    %>
      <tr>
        <td><%= course.getCourseName() %></td>
        <td><%= course.getDepartmentName() %></td>
        <td class="align-center"><%= course.getUnit() %></td>
        <td><%= course.getProfessorName() %></td>
        <td class="align-center"><%= course.getStartDate() %></td>
      </tr>
    <% } %>
  </tbody>
</table>

</div>
</body>
</html>

