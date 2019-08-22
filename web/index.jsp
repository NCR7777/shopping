<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="utils.JDBCUtils" %>
<%@ page import="domain.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%--
  Created by IntelliJ IDEA.
  User: Cortana
  Date: 2019/6/1
  Time: 0:21
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
    <title>商城首页</title>
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
    <%
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
      String sql = "select * from `goods`";
      List<Goods> list = jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(Goods.class));
      request.setAttribute("goodsAttribute",list);
  %>
    <%@include file="header.html"%>
    <div id="regContainer" class="container">
      <div class="row commodity">
      <c:forEach items="${goodsAttribute}" var="goods">
        <div class="col-md-4">
          <div class="goods">
            <a href="goodsFile/${goods.goods_href}">
              <img src="${pageContext.request.contextPath}${goods.goods_pictureSRC}" alt="">
            </a>
          </div>
          <div class="goodsTitle text-center">
            <a href="${goods.goods_href}"><b>${goods.goods_name}</b></a>
          </div>
          <div class="goodsPrice">
            仅售: <span>${goods.goods_price}</span> ！
          </div>
        </div>
      </c:forEach>
      </div>
    </div>
    <%@include file="footer.html"%>
  </body>
</html>
