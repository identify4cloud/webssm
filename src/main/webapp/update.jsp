<%--
  Created by IntelliJ IDEA.
  User: Amrzs
  Date: 2018/7/31
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>用户修改</title>
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
    <h4  class="display-4"><p class="text-center">修改页面</p></h4>
<form action="update" method="post">
    <input type="hidden" name="id" value="${sessionScope.update_user.id}">
    <input type="hidden" name="birthday" value="${sessionScope.update_user.birthday}">
    <input type="hidden" name="password" value="${sessionScope.update_user.password}">
    <div class="form-group">
        <label>用户名:</label>
        <input type="text" name="name"  class="form-control"  value="${sessionScope.update_user.name}"  value="readonly" readonly/>
    </div>
    <div class="form-group">
        <label>年龄:</label>
        <input type="text" name="age" class="form-control" value="${sessionScope.update_user.age}"/>
    </div>
    <div class="form-group">
        <label>性别:</label>
        <label class="radio-inline"><input type="radio" name="sex" value="男">男</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label class="radio-inline"><input type="radio" name="sex" value="女">女</label>
    </div>
    <input type="submit" value="修改" class="btn btn-primary"/>
</form>
</div>
</body>
</html>
