<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %><%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/13
  Time: 22:07
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
    <link rel="stylesheet" href="./css/payAPI.css">
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
            background: white;
        }
    </style>
</head>
<body>
    <%@include file="header.html"%>
    <div class="container">
        <p class="lead cartTitle"><b>购买订单</b></p>
        <%
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        %>
        <c:if test="${!empty(sessionScope.order.orderMap)}" var="order">
            <div>
                <table class="table table-striped table-hover table-condensed table-responsive">
                    <tr>
                        <th class="text-center">商品图片</th>
                        <th class="text-center" >商品名称</th>
                        <th class="text-center">单价</th>
                        <th class="text-center">数量</th>
                        <th class="text-center">小计</th>
                    </tr>
                    <c:forEach items="${sessionScope.order.orderMap}" var="me">
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}${me.value.goods.goods_pictureSRC}" alt="" height="50px">
                            </td>
                            <td class="text-center">${me.value.goods.goods_name}</td>
                            <td class="text-center">${me.value.goods.goods_price}</td>
                            <td class="text-center quantity">${me.value.quantity}</td>
                            <td class="text-center">${me.value.goods.goods_price * me.value.quantity}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3"><a href="CancelOrder" onclick="return clearOrder()"><input type="button" class="btn btn-link" value="取消订单"></a></td>
                        <td class="text-center">总计</td>
                        <td class="text-center">${sessionScope.order.product_totalPrice}</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="text-center">
                <form action="OrderPay">
                    <label for="user_address" class="lead">请输入收货地址</label>
                    <textarea name="user_address" id="user_address" placeholder="请输入您的收货地址"></textarea>
                    <div id="user_pay_channel" class="radio">
                        <p class="lead">请选择支付方式</p>
                        <label><input type="radio" name="pay_channel" id="weChat" onclick="weChatShow()" value="微信">微信</label>
                        <label><input type="radio" name="pay_channel" id="aliPay" onclick="aliPayShow()" value="支付宝">支付宝</label>
                        <br>
                        <img src="images/aliPay.png" alt="" id="aliPayPicture">
                        <img src="images/weChat.png" alt="" id="weChatPicture">
                    </div>
                    <input type="hidden" value="${sessionScope.order.order_id}" name="order_id">
                    <input type="submit" value="已确认支付：${sessionScope.order.product_totalPrice}元" class="btn btn-danger" onclick="return textareaJustify();">
                </form>
            </div>
        </c:if>
    </div>
    <%@include file="footer.html"%>
</body>
<script src="./js/payAPI.js"></script>
<script>
    function clearOrder() {
        return confirm("你确定要取消订单吗？");
    }
</script>
</html>
