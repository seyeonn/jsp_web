<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, lecture1.jdbc5.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String errorMessage = null;
if (request.getMethod().equals("POST")) {
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    if (UserService.login(session, userid, password)) {
        response.sendRedirect("userList.jsp");
        return;
    } else
        errorMessage = "로그인 실패";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/lecture1/res/common.css"/>
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
<style>
  form { padding: 10px 40px 40px 40px; width: 400px; }
  label { display: inline-block; width: 60px; text-align: right; margin-right: 4px; }
  form div { margin-top: 20px; }
  input { width: 150px; }
</style>
</head>
<body>
<div class="container">

<form method="post" class="shadow">
  <h1>로그인</h1>
  <div>
    <label>사용자ID</label>
    <input type="text" name="userid" required />
  </div>
  <div>
    <label>비밀번호</label>
    <input type="password" name="password" required />
  </div>
  <div>
    <button type="submit" class="btn"><i class="fas fa-check"></i> 로그인</button>
  </div>
  <% if (errorMessage != null) { %>
    <div class="error"><%= errorMessage %></div>
  <% } %>
</form>

</div>
</body>
</html>

