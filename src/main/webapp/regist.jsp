<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%= basePath%>" target="_self"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- 新 Bootstrap4 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

	<!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
	<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

	<!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h4  class="display-4"><p class="text-center">注册页面</p></h4>
	<form action="regist" method="post" >
		<div class="form-group">
			<label>用户名:</label>
			<input type="text" name="name"  class="form-control"/>
		</div>
		<div class="form-group">
			<label>密码:</label>
			<input type="password" name="password" class="form-control"/>
		</div>
		<div class="form-group">
			<label>年龄:</label>
			<input type="text" name="age" class="form-control"/>
		</div>
		<div class="form-group">
			<label>性别:</label>
			<label class="radio-inline"><input type="radio" name="sex" value="男">男</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="radio-inline"><input type="radio" name="sex" value="女">女</label>
		</div>
		<input type="submit"  class="btn btn-primary" value="注册"/>
	</form>
</div>
</body>
</html>