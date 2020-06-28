<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, lecture1.jdbc3.*" %>
<%
List<Book> list = BookDAO.findAll();
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

<h1>책목록</h1>
<a class="btn" href="bookCreate.jsp">책등록</a>

<table class="table">
  <thead>
    <tr>
      <th>제목</th>
      <th>저자</th>
      <th>카테고리</th>
      <th>가격</th>
      <th>출판사</th>
    </tr>
  </thead>
  <tbody>
    <% for (Book book : list) { %>
      <tr class="clickable" data-url="bookEdit.jsp?id=<%= book.getId() %>">
        <td><%= book.getTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getCategoryName() %></td>
        <td class="align-center"><%= book.getPrice() %></td>
        <td><%= book.getPublisher() %></td>
      </tr>
    <% } %>
  </tbody>
</table>

</div>
</body>
</html>

