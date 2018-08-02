<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<base href="<%= basePath%>" target="_self"/>
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#name").blur(function(){
			console.info("ttt");
			var $name = $("#name").val();
			$.post("validateName", {name:$name}, function(data){
			   console.info("Data Loaded: " + data);
			   //处理data   如果为true表示可用，否则表示用户名不可用
			 });
		});
	});
</script>
</head>
<body>
<div class="container">
	<h4  class="display-4"><p class="text-center">用户登录</p></h4>
	<form action="login" method="post">
		<div class="form-group">
			<label>用户名:</label>
			<input type="text" id="name" name="name" class="form-control"/>
		</div>
		<div class="form-group">
			<label>密码:</label>
			<input type="password" name="password"  class="form-control"/>
		</div>
		<div class="alert alert-danger">
			<strong>${login_error}</strong>
		</div>
		<input type="submit" value="登录" class="btn btn-primary"/>
		<input type="button" value="注册"  class="btn btn-primary" onclick=window.location.href="regist.jsp" />
	</form>
</div>
</body>
</html>