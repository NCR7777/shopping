<%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/24
  Time: 13:41
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

    <title>编辑订单</title>
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
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

%>
<body>
    <%@include file="header.html"%>
    <div class="container">
        <p class="lead cartTitle"><b>编辑订单</b></p>
        <c:if test="${!empty(sessionScope.thisOrder)}">
        <div>
            <table class="table table-striped table-hover table-condensed table-responsive">
                <tr>
                    <th class="text-center">订单id</th>
                    <th class="text-center" >购买商品</th>
                    <th class="text-center">总价格</th>
                    <th class="text-center">支付状态</th>
                    <th class="text-center">操作</th>
                </tr>
                <tr>
                    <td class="text-center">${sessionScope.thisOrder.order_id}</td>
                    <td class="text-center">${sessionScope.thisOrder.cart}</td>
                    <td class="text-center">${sessionScope.thisOrder.product_totalPrice}</td>
                    <td class="text-center">${sessionScope.thisOrder.order_status}</td>
                    <td class="text-center"><a href="DeleteOrder">删除订单</a></td>
                </tr>
            </table>
        </div>
            <c:if test="${'未支付'.equals(sessionScope.thisOrder.order_status)}">
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
                        <input type="hidden" value="${sessionScope.thisOrder.order_id}" name="order_id">
                        <input type="submit" value="已确认支付：${sessionScope.thisOrder.product_totalPrice}元" class="btn btn-danger" onclick="return textareaJustify();">
                    </form>
                </div>
            </c:if>
            <c:if test="${'已支付'.equals(sessionScope.thisOrder.order_status)}">
                <div class="text-center">
                    <form action="UpdateOrderAddress">
                        <label for="user_address_another" class="lead">请修改收货地址</label>
                        <textarea name="user_address" id="user_address_another" placeholder="请输入您的收货地址">${sessionScope.thisOrder.user_address}</textarea>
                        <input type="hidden" value="${sessionScope.thisOrder.order_id}" name="order_id">
                        <input type="submit" value="确认修改" class="btn btn-danger" onclick="return updateTextareaJustify();" style="margin-top: 15px">
                    </form>
                </div>
            </c:if>
        </c:if>
    </div>
    <%@include file="footer.html"%>
</body>
<script src="./js/payAPI.js"></script>
</html>
