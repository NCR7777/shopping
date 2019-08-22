<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.User" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %><%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/13
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="../bs/js/jquery.min.js"></script>
    <script src="../bs/js/bootstrap.js"></script>
    <script src="../bs/js/holder.min.js"></script>
    <link rel="stylesheet" href="../bs/css/bootstrap.css">
    <link rel="stylesheet" href="../css/top.css">
    <link rel="stylesheet" href="../css/indexContainer.css">
    <link rel="stylesheet" href="../css/bottom.css">
    <title>查看用户</title>
    <style>
        *{
            font-family: "微软雅黑";
        }
        body{

        }
        .container{
            margin-top: 15px;
            background: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <table class="table table-bordered table-hover table-striped">
            <caption>
                商城用户&nbsp;&nbsp;<small><a href="showOrder.jsp">查看所有订单</a>&nbsp;&nbsp;<a href="index.html">返回首页</a></small>
            </caption>
            <tr>
                <th>用户id</th>
                <th>用户名</th>
                <th>姓名</th>
                <th>密码</th>
                <th>手机号</th>
                <th>性别</th>
            </tr>
            <%
                request.setCharacterEncoding("utf-8");
                JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
                String sql = "select * from `user`";
                List<User> list = jdbcTemplate.query(sql,new BeanPropertyRowMapper<User>(User.class));
                request.setAttribute("list",list);
            %>
            <c:forEach items="${list}" var="me">
                <tr>
                    <td>${me.user_id}</td>
                    <td>${me.user_username}</td>
                    <td>${me.user_nickname}</td>
                    <td>${me.user_password}</td>
                    <td>${me.user_phoneNumber}</td>
                    <td>${me.user_sex}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
