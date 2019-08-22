<%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/9
  Time: 17:07
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
    <title>用户注册</title>
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
        <form method="post" action="Register" class="">
            <div class="form-group">
                <label for="username">请输入用户名<small>（已有账号？<a href="login.jsp">立即登录</a>）</small></label>
                <input type="text" name="user_username" id="username" class="form-control" placeholder="请输入用户名">
                <span class="help-block">请输入用户名，不可修改</span>
            </div>
            <div class="form-group">
                <label for="password">请输入密码</label>
                <input id="password" type="password" class="form-control" placeholder="请输入密码" name="user_password">
                <span class="help-block">密码提示说明</span>
            </div>
            <div class="form-group">
                <label for="password">请输入手机号</label>
                <input id="phoneNumber" type="text" class="form-control" placeholder="请输入手机号" name="user_phoneNumber" maxlength="11" minlength="11">
                <span class="help-block">手机号提示说明</span>
            </div>
            <div class="form-group">
                <label for="username">请输入姓名</label>
                <input type="text" name="user_nickname" id="nickname" class="form-control" placeholder="请输入用户名">
                <span class="help-block">请输入真实的姓名，不可修改</span>
            </div>
            <div class="form-group">
                <label for="sex">请选择你的真实性别，不可修改</label>
                <select name="user_sex" id="sex" class="form-control">
                    <option value="" selected disabled="disabled">请选择你的性别</option>
                    <option value="male">男</option>
                    <option value="female">女</option>
                </select>
            </div>
            <div class="row">
                <input id="submit" type="submit" value="注册" class="btn btn-success col-xs-4 col-xs-offset-4">
            </div>
        </form>
    </div>
    <%@include file="footer.html"%>
</body>
</html>
