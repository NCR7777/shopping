<%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/9
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="./bs/js/jquery.min.js"></script>
    <script src="./bs/js/bootstrap.js"></script>
    <script src="./bs/js/holder.min.js"></script>
    <link rel="stylesheet" href="./bs/css/bootstrap.css">
    <link rel="stylesheet" href="./css/top.css">
    <link rel="stylesheet" href="css/indexContainer.css">
    <link rel="stylesheet" href="./css/bottom.css">
    <title>我的信息</title>
    <style>
        *{
            font-family: "微软雅黑";
        }
        body{
            background: #f0f0f0;
        }
        .container{
            margin-top: 15px;
            padding-bottom: 15px;
            background: white;
        }
    </style>
</head>
<body>
    <%@include file="header.html"%>
    <div class="container">
        <div>
            <table class="table table-bordered table-hover table-striped" width="100%">
                <caption>我的信息</caption>
                <tr>
                    <td width="40%">我的用户名</td>
                    <td width="60%">${sessionScope.user_username}</td>
                </tr>
                <tr>
                    <td>我的密码</td>
                    <td>${sessionScope.user_password}</td>
                </tr>
                <tr>
                    <td>我的姓名</td>
                    <td>${sessionScope.user_nickname}</td>
                </tr>
                <tr>
                    <td>我的手机号</td>
                    <td>${sessionScope.user_phoneNumber}</td>
                </tr>
                <tr>
                    <td>我的性别</td>
                    <td>${sessionScope.user_sex}</td>
                </tr>
            </table>
        </div>
        <div class="row">
            <a href="changeMyInfo.jsp">
                <input type="button" value="修改信息" class="btn btn-info col-xs-4 col-xs-offset-1">
            </a>
            <form action="Logout">
                <input type="submit" value="退出登录" class="btn btn-danger col-xs-4 col-xs-offset-2">
            </form>

        </div>
    </div>
    <%@include file="footer.html"%>
</body>
</html>
