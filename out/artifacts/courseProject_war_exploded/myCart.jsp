<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/12
  Time: 12:52
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
    <title>我的购物车</title>
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

<body>
    <%@include file="header.html"%>
    <div class="container">
        <p class="lead cartTitle"><b>我的购物车</b></p>
        <div>
            <c:if test="${empty(sessionScope.cart.goodsMap)}">
            <div class="text-center" style="height: 300px">
                <span style="line-height: 300px;">您的购物车为空！</span>
            </div>
            </c:if>
            <c:if test="${!empty(sessionScope.cart.goodsMap)}" var="cart">
                <div>
                    <table class="table table-striped table-hover table-condensed table-responsive">
                        <tr>
                            <th class="text-center">商品图片</th>
                            <th class="text-center" >商品名称</th>
                            <th class="text-center">单价</th>
                            <th class="text-center">数量</th>
                            <th class="text-center">小计</th>
                            <th class="text-center">操作</th>
                        </tr>
                        <c:forEach items="${sessionScope.cart.goodsMap}" var="me">
                            <tr>
                                <td>
                                    <img src="${pageContext.request.contextPath}${me.value.goods.goods_pictureSRC}" alt="" height="50px">
                                </td>
                                <td class="text-center">${me.value.goods.goods_name}</td>
                                <td class="text-center">${me.value.goods.goods_price}</td>
                                <td class="text-center quantity">
                                    <input style="width: 100%;text-align: center" id="quantity=${me.value.quantity}" type="text" name="quantity" value="${me.value.quantity}" onchange="update(this,${me.value.goods.goods_id})">
                                </td>
                                <td class="text-center">${me.value.goods.goods_price * me.value.quantity}</td>
                                <td class="text-center"><a href="${pageContext.request.contextPath}/DeleteCartGoods?goods_id=${me.key}">删除</a></td>
                            </tr>
                            <input type="hidden" name="goods_id=${me.value.goods.goods_id}" value="${me.value.goods.goods_id}">
                            <script type="text/javascript">
                                function update(input,id) {
                                    var quantity = input.value;
                                    // var b = window.confirm("你确定修改吗？");
                                    // if(b) {
                                    if (quantity) {
                                        window.location.href = "${pageContext.request.contextPath}/UpdateCartGoodsQuantity?goods_id=" + id + "&quantity=" + quantity + "";
                                    }
                                    else {
                                        return false;
                                    }
                                    // }else {
                                    //     input.value = oldValue;
                                    // }
                                }
                            </script>
                        </c:forEach>
                        <tr>
                            <td colspan="3"><a href="${pageContext.request.contextPath}/ClearCart" onclick="return clearCart()"><input type="button" class="btn btn-link" value="清空购物车"></a></td>
                            <td class="text-center">总计</td>
                            <td class="text-center">${sessionScope.cart.price}</td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
    <c:if test="${!empty(sessionScope.cart.goodsMap)}" var="cart" scope="application">
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/CreateNewOrder"><input type="button" value="去支付：${sessionScope.cart.price}元" class="btn btn-danger"></a>
        </div>
    </c:if>
<%@include file="footer.html"%>
</body>
<script>
    function clearCart() {
        return window.confirm("你确定要清空购物车吗？");
    }
</script>
</html>
