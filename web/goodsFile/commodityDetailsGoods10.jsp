<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/9
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="../bs/js/jquery.min.js"></script>
    <script src="../bs/js/bootstrap.js"></script>
    <script src="../bs/js/holder.min.js"></script>
    <link rel="stylesheet" href="../bs/css/bootstrap.css">
    <link rel="stylesheet" href="../css/top.css">
    <link rel="stylesheet" href="../css/bottom.css">
    <link rel="stylesheet" href="../css/commodityDetails.css">
    <title>商品详情</title>
    <style>
        * {
            font-family: "微软雅黑";
        }

        body {
            background: #f0f0f0;
        }
    </style>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "select * from `goods` where `goods_id` = 10";
        Map<String, Object> list1 = jdbcTemplate.queryForMap(sql);
        session.setAttribute("goodsAttr", list1);
    %>
    <%@include file="../header.html" %>
    <div class="container">
        <div class="row">
            <div class="goodsName">
                商品名称：<b>${goodsAttr.goods_name}</b>
            </div>
            <div class="col-md-7">
                <img class="goodsPicture" src="${pageContext.request.contextPath}/${goodsAttr.goods_pictureSRC}" alt="">
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-xs-7">
                        <ul>
                            <li class="first"><b>${goodsAttr.goods_name}</b></li>
                            <li class="other">
                                <hr>
                            </li>
                            <li class="other">价格： <b>${goodsAttr.goods_price}</b> 元</li>
                            <li class="other">产地： <b>${goodsAttr.goods_buildPlace}</b></li>
                            <li class="other">代言人： <b>${goodsAttr.goods_spokesman}</b></li>
                        </ul>
                    </div>
                    <div class="col-xs-5">
                        <div class="QRCode"><img src="../images/PRSRSpokesman3.png" alt=""></div>
                        <div class="lead text-center">代言人</div>
                    </div>
                </div>
                <div class="row">
                    <input type="button" class="col-xs-3 col-xs-offset-2 btn btn-success" value="立即购买">
                    <a href="${pageContext.request.contextPath}/AddToCart?goods_id=${goodsAttr.goods_id}"><input type="button" class="col-xs-3 col-xs-offset-2 btn btn-info" value="加入购物车"></a>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../footer.html" %>
</body>
<script>
    function reloadHeight() {
        if ($(window).width() >= 768) {
            var tempHeight = $('.col-md-7').css("height");
            $('.col-md-5').css("height", tempHeight);
        }

    }

    window.onload = function () {
        window.onresize = reloadHeight;
        reloadHeight();
    };
</script>
</html>
