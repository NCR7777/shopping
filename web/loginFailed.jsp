<%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/11
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>登录失败</title>
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
    <%@include file="header.html" %>
    <div class="container">
        <div class="text-center" style="height: 300px;">
            <span style="line-height: 300px;">登陆失败！用户名或密码错误！</span>
            <div class="row">
                <a href="login.jsp"><input type="button"value="重新登陆"  class="btn btn-primary col-xs-4 col-xs-offset-4" ></a>
            </div>
        </div>
    </div>
    <%@include file="footer.html" %>
</body>
</html>
