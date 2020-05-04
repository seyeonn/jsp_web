<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String name = "";
String sex = "";
String 에러메시지 = null;
request.setCharacterEncoding("UTF-8");
if (request.getMethod().equals("POST")) {
    name = request.getParameter("name");
    sex =  request.getParameter("radio1");
    
    if (name == null || name.length() == 0) 
        에러메시지 = "이름을 입력하세요";
    else if (sex == null || sex.length() == 0) 
        에러메시지 = "성별을 입력하세요";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
<style>
  body { font-family: 굴림체; font-size: 10pt; }
  div.container {margin: 20px; }
  form div { margin-bottom: 20px; }
  label { display: block; }   
  input.text { width: 200px; padding: 5px; }
  .btn { padding: 0.7em 2em; border: 1px solid #aaa;
         background: linear-gradient(#eee, #ddd); color: black;       
         font-family: 굴림체; font-size: 10pt; line-height: 1em;   
         text-decoration: none; cursor: pointer; display: inline-block; }
   div.info { margin: 10px; padding: 10px 20px; background-color: #dff; border: 1px solid #8ff; }
   div.error { margin: 10px; padding: 10px 20px; background-color: #fdd; border: 1px solid #faa; }
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
String checked = request.getParameter("radio1");
String 남자 = "남자".equals(checked) ? "checked" : "";
String 여자 = "여자".equals(checked) ? "checked" : "";
%>
<div class="container">
<form method="post">
  <h1>회원 등록</h1>
  <div>
    <label>이름</label>
    <input type="text" class="text" name="name" value="<%= name %>" />
  </div>
  <div>
  <label>성별</label>
  <label><input type="radio" name="radio1" value="남자" <%= 남자 %>/>남자</label>
  <label><input type="radio" name="radio1" value="여자" <%= 여자 %>/>여자</label>
  </div>
  <button type="submit" class="btn"> 회원 등록 </button>
</form>
<% if (에러메시지 != null) { %>
  <div class="error">
    회원가입 실패: <%= 에러메시지 %>
  </div>
<% } %>
<br>
<br>
<table>
  <tr>
    <td>이름</td>
    <td><%= name %></td>
  </tr>
  <tr>
    <td>성별</td>
    <td><%= sex %></td>
  </tr>
</table>

</div>
</body>
</html>

