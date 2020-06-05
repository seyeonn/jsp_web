<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, lecture1.jdbc3.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student" class="lecture1.jdbc3.Student" />
<jsp:setProperty property="*" name="student" />
<%
String errorMessage = null;
if (request.getMethod().equals("POST")) {
    errorMessage = StudentService.insert(student);
    if (errorMessage == null) {
        response.sendRedirect("studentList.jsp");
        return;
    }
}
List<Department> departments = DepartmentDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/lecture1/res/common.css"/>
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
<style>
  form { padding: 10px 40px 40px 40px; width: 400px; }
  label { display: inline-block; width: 40px; text-align: right; margin-right: 4px; }
  form div { margin-top: 20px; }
  input[name=year] { width: 60px; }
</style>
</head>
<body>
<div class="container">

<form method="post" class="shadow">
  <h1>학생 등록</h1>
  <div>
    <label>학번</label>
    <input type="text" name="studentNumber" value="${ student.studentNumber }" 
           required pattern="[0-9]+" />
  </div>
  <div>
    <label>이름</label>
    <input type="text" name="name" value="${ student.name }" required />
  </div>
  <div>
    <label>학과</label>
    <select name="departmentId" required>
      <option value="">소속학과를 선택하세요</option>
      <% for (Department department : departments) { %>
        <% int id = department.getId(); %>
        <% String dname = department.getDepartmentName(); %>
        <option value="<%= id %>" <%= id == student.getDepartmentId() ? "selected" : "" %>>
          <%= dname %>
        </option>
      <% } %>
    </select>
  </div>
  <div>
    <label>학년</label>
    <input type="text" name="year" value="${ student.year }" 
           required pattern="[1-4]" title="학년은 1 이상 4 이하입니다" />
  </div>
  <div>
    <button type="submit" class="btn"><i class="fas fa-check"></i> 저장</button>
    <a class="btn" href="studentList.jsp"><i class="fas fa-ban"></i> 취소</a>
  </div>
  <% if (errorMessage != null) { %>
    <div class="error"><%= errorMessage %></div>
  <% } %>
</form>

</div>
</body>
</html>

