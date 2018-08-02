<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
</head>
<body>
<div class="container">
	<h4  class="display-4"><p class="text-center">用户列表</p></h4>
	<form action="list" method="post"  class="form-inline">
		<label >用户名:</label>
		<input type="text" class="form-control" name="name" placeholder="请输入用户名" value="${sessionScope.name}" >
		<label>性别:</label>
		<select class="form-control" name="sex">
			<option value="" selected>请选择性别</option>
			<option>男</option>
			<option>女</option>
		</select>
		<label>开始日期：</label>
		<input class="input-text"   class="form-control" type="date" name="datemin" value="${sessionScope.datemin}" />
		<label>结束日期：</label>
		<input class="input-text"  class="form-control" type="date" name="datemax" value="${sessionScope.datemax}" >&nbsp;&nbsp;&nbsp;
		<input type="submit"  class="btn btn-primary" value="查询"/>
	</form>
		<br/>
	<table class="table table-dark table-hover">
		<tr>
			<td>编号</td>
			<td>用户名</td>
			<td>年龄</td>
			<td>性别</td>
			<td>注册日期</td>
			<td>操作</td>
		</tr>
		<c:forEach var="u" items="${user_list}">
			<tr>
				<td>${u.id }</td>
				<td>${u.name }</td>
				<td>${u.age }</td>
				<td>${u.sex }</td>
				<td><fmt:formatDate value="${u.birthday}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
				<td><a href="delete?id=${u.id}">删除</a> <a href="getById?id=${u.id}">修改</a> </td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>