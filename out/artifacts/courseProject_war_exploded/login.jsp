<%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/9
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="./bs/js/jquery.min.js"></script>
    <script src="./bs/js/bootstrap.js"></script>
    <script src="./bs/js/holder.min.js"></script>
    <link rel="stylesheet" href="./bs/css/bootstrap.css">
    <link rel="stylesheet" href="./css/top.css">
    <link rel="stylesheet" href="css/indexContainer.css">
    <link rel="stylesheet" href="./css/bottom.css">
    <title>用户登录</title>
    <style>
        *{
            font-family: "微软雅黑";
        }
        body{
            background: #f0f0f0;
        }
        .container{
            padding-top: 15px;
            margin-top: 15px;
            background: white;
            border-top: #bbb solid 1px;
        }
    </style>
</head>
<body>
    <%@include file="header.html"%>
    <div class="container">
        <form method="post" action="Login" class="">
            <div class="form-group">
                <label for="username">请输入用户名<small>（没有账号？<a href="register.jsp">立即注册</a>）</small></label>
                <input type="text" name="user_username" id="username" class="form-control" placeholder="请输入用户名">
                <span class="help-block">用户名提示说明</span>
            </div>
            <div class="form-group">
                <label for="password">请输入密码</label>
                <input id="password" type="password" class="form-control" placeholder="请输入密码" name="user_password">
                <span class="help-block">密码提示说明</span>
            </div>
            <div class="row">
                <input id="submit" type="submit" value="登录" class="btn btn-success col-xs-4 col-xs-offset-4">
            </div>
        </form>
    </div>
    <%@include file="footer.html"%>
</body>
</html>
