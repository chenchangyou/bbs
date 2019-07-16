<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<!DOCTYPE html>
<head>
    <title>欢迎来到友人论坛</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
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
            padding: 4px 14px;
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

        .notice {
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

<div class="layui-container">

    <div class="layui-row" style="margin: 60px auto 0 auto;max-height: 68%;padding: 0">
        <div class="layui-carousel" id="test1" style="max-height: 36%">
            <div carousel-item id="carousel">
                <C:forEach items="${carouselList}" var="carouse">
                    <div><img style="width: 100%;" src="${carouse.url}"/></div>
                </C:forEach>
            </div>
        </div>
    </div>

    <div class="layui-col-row" style="border-radius: 5px;margin: 10px auto;height: 50px; background-color: #FFFFFF;">
        <div class="layui-col-md8" style="padding: 15px;color: #c2c2c2;">
            <span>今日投稿数：</span>
            <span id="toDayPostNum">999+</span>
        </div>
        <form method="get" action="/post/searchResult/"  class="layui-col-md4 layui-col-xs11 layui-col-sm7" style="position: absolute;right: 0px;padding: 8px">
            <div class="layui-row" style="text-align: right">
                <span class="form-group layui-col-md8 layui-col-sm8 layui-col-xs8">
                    <input type="text" name="keyword" class="form-control" placeholder="请输入关键字">
                </span>
                <span class="layui-col-md3 layui-col-sm3 layui-col-xs3">
                    <button type="submit" class="btn btn-danger" style="width: 100%;">搜索</button>
                </span>
            </div>
        </form>
    </div>

    <div class="layui-row  layui-col-space10" style="margin:10px auto 0 auto;">
        <div class="box-left articlelist layui-col-md2">
            <div class="layui-row" style="padding: 5px; background-color: #FFFFFF;border-radius: 4px;">
                <div class="layui-col-md12 layui-hide-xs">
                    <p><img src="${loginUser.headshot}" alt="..." class="img-circle" width="70px" height="70px"
                            style="text-align: center"></p>
                    <p>${loginUser.username}</p>
                    <p>个人信息</p>
                </div>
                <div class="layui-col-md12">
                    <c:if test="${not empty loginUser}">
                        <a href="addpost" class="btn btn-info" style="width: 100%;"><span class="glyphicon glyphicon-pencil"
                                                                                          aria-hidden="true"></span> 发表新帖</a>
                    </c:if>
                    <c:if test="${empty loginUser}">
                        <a class="btn btn-info" data-toggle="modal" data-target="#myModal" style="width: 100%;"><span
                                class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 发表新帖</a>
                    </c:if>

                    <%--公告--%>
                    <div class="panel panel-info layui-hide-xs" style="margin-top: 5px;margin-bottom: 3px">
                        <div class="panel-heading">公告</div>
                        <div class="panel-body">
                            <ul class="list-group" id="noticelist">
                                <c:forEach items="${noticeList}" var="notice">
                                    <li class="list-group-item"><a class="notice" id="${notice.nid}"
                                                                   href="javascript:;">${notice.title}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="box-middle articledetail layui-col-md10">
            <div style=" background-color: #F2F2F2;border-radius: 4px;">
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="margin-top: 0; border-radius: 4px;">
                    <div class="layui-col-md12">
                    <ul class="layui-tab-title layui-col-md11" style="background-color: #FFFFFF;border-radius: 5px;height: 44px">
                        <li id="clicknewpost" onclick="getNewPost()">新帖</li>
                        <li onclick="getPopularPost()"><i style="color: red;" class="layui-icon layui-icon-fire"></i>热门</li>
                    </ul>
                    <span class="layui-col-md1" style="padding: 12px;border-bottom: 1px #e2e2e2 solid"><a href="/section/">更多>></a></span>
                    </div>
                    <div class="layui-tab-content" style="padding: 0; border-radius: 4px;">

                        <div class="layui-tab-item" id="NewPost" style="border-radius: 5px"></div>
                        <div class="layui-tab-item" id="PopularPost"></div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
<div id="footer"></div>
<script src="../static/js/home.js" type="text/javascript"></script>
<script>
    $(function () {
        $.get("/admin/getToday",function (data) {
            $("#toDayPostNum").text(data)
        })
    })

</script>
</body>
</html>
