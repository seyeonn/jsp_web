<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, lecture1.jdbc2.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="course" class="lecture1.jdbc2.Course" />
<jsp:setProperty property="*" name="course" />
<%
    String errorMessage = null;
if (request.getMethod().equals("POST")) {
    errorMessage = CourseService.insert(course);
    if (errorMessage == null) {
        response.sendRedirect("courseList1.jsp");
        return;
    }
}
List<Department> departments = DepartmentDAO.findAll();
List<Professor> professors = ProfessorDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/lecture1/res/common.css"/>
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
<style>
  form { padding: 10px 40px 40px 40px; width: 400px; }
  label { display: inline-block; width: 70px; text-align: right; margin-right: 4px; }
  form div { margin-top: 20px; }
  input[name=year] { width: 60px; }
</style>
</head>
<body>
<div class="container">

<form method="post" class="shadow">
  <h1>강좌 등록</h1>
  <div>
    <label>강좌명</label>
    <input type="text" name="courseName" value="${ course.courseName }" required />
  </div>
  <div>
    <label>개설학과</label>
    <select name="departmentId" required>
      <option value="">개설학과를 선택하세요</option>
      <% for (Department department : departments) { %>
        <% int id = department.getId(); %>
        <% String dname = department.getDepartmentName(); %>
        <option value="<%= id %>" <%= id == course.getDepartmentId() ? "selected" : "" %>>
          <%= dname %>
        </option>
      <% } %>
    </select>
  </div>
  <div>
    <label>학점</label>
    <input type="text" name="unit" value="${ course.unit }" 
           required pattern="[1-6]" title="학점은 1 이상 6 이하입니다" />
  </div>
  <div>
    <label>담당교수</label>
    <select name="professorId" required>
      <option value="">담당교수를 선택하세요</option>
      <% for (Professor professor : professors) { %>
        <% int id = professor.getId(); %>
        <% String pname = professor.getProfessorName(); %>
        <option value="<%= id %>" <%= id == course.getProfessorId() ? "selected" : "" %>>
          <%= pname %>
        </option>
      <% } %>
    </select>
  </div>
  <div>
    <label>시작일</label>
    <input type="text" name="startDate" value="${ course.startDate }" placeholder="yyyy-mm-dd" 
           required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" title="2020-03-02 형태로 입력하세요" />
  </div>
  <div>
    <button type="submit" class="btn"><i class="fas fa-check"></i> 저장</button>
    <a class="btn" href="courseList1.jsp"><i class="fas fa-ban"></i> 취소</a>
  </div>
  <% if (errorMessage != null) { %>
    <div class="error">저장 실패: <%= errorMessage %></div>
  <% } %>
</form>

</div>
</body>
</html>

