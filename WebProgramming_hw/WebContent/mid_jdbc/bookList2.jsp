<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, mid.*, lecture1.DB" %>
<%
String srchText = request.getParameter("srchText");
if (srchText == null) srchText = "";
List<Book> list = BookDAO.findByName(srchText);
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <style>
    div.container { width: 600px; margin: 50px auto; font-size: 10pt; }
    input { padding: 5px; font-size: 10pt; }
    button { margin: 10px ; padding: 0.4em 2em; }
    thead th { background-color: #eee; }
    table{ border-collapse: collapse; width: 100%; }
    td, th { padding: 4px; border: 1px solid lightgray; }
    td:nth-child(4) { text-align: center; }
  </style>
</head>
<body>

<div class="container">

<h1>책목록</h1>

<form>
  <label>이름</label>
  <input type="text" name="srchText" value="<%= srchText %>" placeholder="검색조건" />
  <button type="submit">조회</button>
</form>

<table>
    <thead>
        <tr>
			<th>id</th>
			<th>제목</th>
			<th>저자</th>
			<th>카테고리</th>
			<th>가격</th>
			<th>출판사</th>
		</tr>
    </thead>
    <tbody>
          <% for (Book book : list) { %>
              <tr>
                  <td><%= book.getId() %></td>
                  <td><%= book.getTitle() %></td>
                  <td><%= book.getAuthor() %></td>
                  <td><%= book.getCategoryName() %></td>
                  <td><%= book.getPrice() %></td>
                  <td><%= book.getPublisher() %></td>
              </tr>
          <% } %>
    </tbody>
</table>

</div>
</body>
</html>

