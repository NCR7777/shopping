<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="domain.Order" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%--
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
    <title>查看订单</title>
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
        <table class="table table-bordered table-hover table-striped table-responsive">
            <caption>
                用户订单&nbsp;&nbsp;<small><a href="showUser.jsp">查看所有用户</a>&nbsp;&nbsp;<a href="index.html">返回首页</a></small>
            </caption>
            <tr>
                <th>订单id</th>
                <th>用户id</th>
                <th>姓名</th>
                <th>手机号</th>
                <th>购买商品</th>
                <th>订单总价格</th>
                <th>收货地址</th>
                <th>支付方式</th>
                <th>订单生成时间</th>
                <th>是否支付</th>
            </tr>
            <%
                request.setCharacterEncoding("utf-8");
                JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
                String sqlOrder = "select * from `order`";
                List<Order> orders = jdbcTemplate.query(sqlOrder,new BeanPropertyRowMapper<>(Order.class));

                request.setAttribute("orders",orders);
                String sqlTotalPrice = "SELECT `product_totalPrice` FROM `order`";
                List<Map<String, Object>> list = jdbcTemplate.queryForList(sqlTotalPrice);
                ArrayList<Map<String, Object>> prices = new ArrayList<>(list);
                for (int i = 0; i < orders.size(); i++) {
                    orders.get(i).setAdminTotalPrice((double) prices.get(i).get("product_totalPrice"));
                }
            %>
            <c:forEach items="${orders}" var="me">
                <tr>
                    <td>${me.order_id}</td>
                    <td>${me.user_id}</td>
                    <td>${me.user_nickname}</td>
                    <td>${me.user_phoneNumber}</td>
                    <td>${me.cart}</td>
                    <td>${me.adminTotalPrice}</td>
                    <td>${me.user_address}</td>
                    <td>${me.pay_channel}</td>
                    <td>${me.order_time}</td>
                    <td>${me.order_status}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>

</html>
