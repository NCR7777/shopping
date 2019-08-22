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
            background: white;
        }

    </style>
</head>
<body>
    <%@include file="header.html"%>
    <div class="container">
        <div>
            <form action="ChangeInfo">
                <table class="table table-bordered table-hover table-striped" width="100%">
                    <caption>我的信息</caption>
                    <tr>
                        <td width="40%">我的用户名</td>
                        <td width="60%">${sessionScope.user_username}</td>
                    </tr>
                    <tr>
                        <td>请输入新密码</td>
                        <td><input type="password" value="${sessionScope.user_password}" class="form-control" name="user_password"></td>
                    </tr>
                    <tr>
                        <td>我的姓名</td>
                        <td>${sessionScope.user_nickname}</td>
                    </tr>
                    <tr>
                        <td>请输入手机号</td>
                        <td><input type="text" value="${sessionScope.user_phoneNumber}" class="form-control" name="user_phoneNumber"></td>
                    </tr>
                    <tr>
                        <td>我的性别</td>
                        <td>${sessionScope.user_sex}</td>
                    </tr>
                </table>
                <input type="hidden" value="${sessionScope.user_username}" name="user_username">
                <div class="row">
                    <input type="submit" value="确认修改" class="btn btn-success col-xs-4 col-xs-offset-1">
                    <a href="myInfo.jsp">
                        <input type="button" value="取消修改" class="btn btn-danger col-xs-4 col-xs-offset-2">
                    </a>
                </div>
            </form>
        </div>
    </div>
    <%@include file="footer.html"%>
</body>
</html>
