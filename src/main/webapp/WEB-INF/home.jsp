<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<!DOCTYPE html>
<head>
    <title>欢迎来到友人论坛</title>
    <%@include file="../common/style.jsp" %>
    <style>
        #footer {
            clear: both;
            width: 100%;
            height: 150px;
            background: #494949;
        }
        .list-group {
            display: block;
        }
        .list-group li {
            border: none;
            padding: 6px 16px;
            display: block;
        }

        .span1 span {
            margin-left: 25px;
            color: #A9A9A9;
            font-size: 10px;
        }

        .contentbox {
            display: block;
            background-color: #FFFFFF;
        }

        .contentbox:hover .titlebox {
              color: #3461ff;
          }

        .contentbox:hover {
            cursor: pointer;
        }
        .notice{
            text-align: center;
            display: block;
        }
    </style>
    <script>
        $.get()
    </script>
</head>
<body onload="load()">

<div id="loading" class="loader">
</div>
<%@include file="../common/head.jsp" %>
<div class="layui-container" style="width: 1180px;margin: 60px auto 30px auto;height: 300px;padding: 0">
    <div class="layui-carousel" id="test1">
        <div carousel-item id="carousel">
            <C:forEach items="${carouselList}" var="carouse">
             <div><img style="width: 100%;" src="${carouse.url}"/></div>
            </C:forEach>
        </div>
    </div>
</div>

<div style="width: 1180px;margin: 10px auto;height: 50px; background-color: #FFFFFF;">
    <form class="navbar-form navbar-right" style="width: 300px;">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="请输入关键字">
        </div>
        <button type="submit" class="btn btn-danger">搜索</button>
    </form>
</div>
<div style="width: 1180px;margin:20px auto 0 auto;">
    <div class="box-left articlelist">
        <p><img src="${loginUser.headshot}" alt="..." class="img-circle" width="70px" height="70px"
                style="text-align: center"></p>
        <p>${loginUser.username}</p>
        <p>个人信息</p>
    </div>
    <div>

        <div class="box-right">
            <c:if test="${not empty loginUser}">
                <a href="addpost" class="btn btn-info" style="width: 100%;"><span class="glyphicon glyphicon-pencil"
                                                                                    aria-hidden="true"></span> 发表新帖</a>
            </c:if>
            <c:if test="${empty loginUser}">
                <a class="btn btn-info" data-toggle="modal" data-target="#myModal" style="width: 100%;"><span
                        class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 发表新帖</a>
            </c:if>

            <%--公告--%>
            <div class="panel panel-info" style="width: 100%;height: 100%; margin-top: 5px">
                <div class="panel-heading">公告</div>
                <div class="panel-body">
                    <ul class="list-group" id="noticelist">
                        <c:forEach items="${noticeList}" var="notice">
                            <li class="list-group-item"><a class="notice" id="${notice.nid}" href="javascript:;">${notice.title}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </div>
        <div class="box-middle articledetail">
            <div style=" background-color: #F2F2F2;">
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="margin-top: 0">
                    <ul class="layui-tab-title" style="background-color: #FFFFFF">
                        <%--<li class="layui-this">最新回复</li>--%>
                        <li id="newpost" onclick="getNewPost()">新帖</li>
                        <li><i style="color: red;" class="layui-icon layui-icon-fire"></i>热门</li>
                    </ul>
                    <div class="layui-tab-content">

                        <div class="layui-tab-item" id="NewPost"></div>
                        <div class="layui-tab-item">内容3</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<div id="footer"></div>
<script src="../static/js/home.js" type="text/javascript"></script>
</body>
</html>
