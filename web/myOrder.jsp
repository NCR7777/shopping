<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="domain.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/22
  Time: 1:36
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
    <link rel="stylesheet" href="./css/myCart.css">
    <title>我的订单</title>
    <style>
        *{
            font-family: "微软雅黑";
        }
        body{
            background: #f0f0f0;
        }
        .container{
            margin-top: 15px;
        }
    </style>
</head>
<%
    if (session.getAttribute("user_nickname")==null){
        response.sendRedirect("login.jsp");
    }else{
        request.setCharacterEncoding("utf-8");
        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "SELECT * FROM `order` WHERE `user_id` = ?";
        List<Order> list = jdbcTemplate.query(sql, new Object[]{session
        .getAttribute("user_id")} ,new BeanPropertyRowMapper<>(Order.class));
        session.setAttribute("orderList",list);
        String sqlTotalPrice = "SELECT `product_totalPrice` FROM `order`";
        List<Map<String, Object>> mapList = jdbcTemplate.queryForList(sqlTotalPrice);
        ArrayList<Map<String, Object>> prices = new ArrayList<>(mapList);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setAdminTotalPrice((double) prices.get(i).get("product_totalPrice"));
        }
    }
%>
<body>
    <%@include file="header.html"%>
    <div class="container">
        <p class="lead cartTitle"><b>我的订单</b></p>
        <c:if test="${empty(sessionScope.orderList)}">
            <div class="text-center" style="height: 300px">
                <span style="line-height: 300px;">您还没有在本站下过订单呢 T_T</span>
            </div>
        </c:if>
        <c:if test="${!empty(sessionScope.orderList)}">
            <div>
                <table class="table table-striped table-hover table-responsive">
                    <tr>
                        <th class="text-center">订单号</th>
                        <th>购买商品</th>
                        <th class="text-center">总价格</th>
                        <th class="text-center">支付状态</th>
                        <th class="text-center">操作</th>
                    </tr>
                    <c:forEach items="${orderList}" var="me">
                    <tr>
                        <td class="text-center">${me.order_id}</td>
                        <td>${me.cart}</td>
                        <td class="text-center" style="color: mediumvioletred"><b>${me.adminTotalPrice}</b></td>
                        <td class="text-center">${me.order_status}</td>
                        <c:if test="${'未支付'.equals(me.order_status)}">
                            <td class="text-center"><a href="UpdateOrder?order_id=${me.order_id}">去支付</a></td>
                        </c:if>
                        <c:if test="${'已支付'.equals(me.order_status)}">
                            <td class="text-center"><a href="UpdateOrder?order_id=${me.order_id}">编辑订单</a></td>
                        </c:if>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </c:if>
    </div>
    <%@include file="footer.html"%>
</body>
</html>
