<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp"%>
<html>
<!DOCTYPE html>
<head>
    <title>欢迎来到友人博客</title>
    <%@include file="../common/style.jsp"%>
    <style>
        #footer {
            clear:both;
            width: 100%;
            height: 150px;
            background: #6495ED;
        }
    </style>
</head>
<body  onload="load()">

<div id="loading" class="loader" >
</div>
<%@include file="../common/head.jsp"%>
<div class="layui-container"style="width: 1180px;margin: 60px auto 30px auto;height: 300px;padding: 0">
    <div class="layui-carousel" id="test1" >
        <div carousel-item>
            <div><img src="../static/images/lbt.png"/></div>
            <div><img src="../static/images/lbt.png"/></div>
            <div><img src="../static/images/lbt.png"/></div>
            <div><img src="../static/images/lbt.png"/></div>
            <div><img src="../static/images/lbt.png"/></div>
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
            <p><img src="${ctx}/${loginUser.headshot}" alt="..." class="img-circle" width="70px" height="70px" style="text-align: center"></p>
            <p>${loginUser.username}</p>
            <p>个人信息</p>
        </div>
        <div>

        <div class="box-right" >
          <c:if test="${not empty loginUser}">
            <a href="addpost" class="btn btn-danger" style="width: 100%;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 发表新帖</a>
          </c:if>
          <c:if test="${empty loginUser}">
                <a class="btn btn-danger" data-toggle="modal" data-target="#myModal"  style="width: 100%;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 发表新帖</a>
          </c:if>
            <div class="panel panel-default" style="margin-top: 5px">
                <div class="panel-body">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="#">公告1</a></li>
                        <li class="list-group-item"><a href="#">公告1</a></li>
                        <li class="list-group-item"><a href="#">公告1</a></li>
                        <li class="list-group-item"><a href="#">公告1</a></li>
                        <li class="list-group-item"><a href="#">公告1</a></li>
                        <li class="list-group-item"><a href="#">公告1</a></li>
                    </ul>
                </div>
            </div>

        </div>
            <div class="box-middle articledetail">
                <div style=" background-color: #F2F2F2;">
                    <div class="layui-tab" style="margin-top: 0">
                        <ul class="layui-tab-title" style="background-color: #FFFFFF">
                            <li class="layui-this">最新回复</li>
                            <li>新帖</li>
                            <li>热门</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <c:forEach items="${postlist}" var="postlist">
                                    <div class="layui-row layui-col-space15">
                                        <div class="layui-col-md12">
                                            <a href="postdetails?postlistId=${postlist.id}"  target="_blank" style="display: block">
                                                <div class="layui-card">
                                                    <div class="layui-card-header">标题：${postlist.title}</div>
                                                    <div class="layui-card-body" style=" display: -webkit-box;-webkit-box-orient: vertical;overflow: hidden;white-space:nowrap;text-overflow:ellipsis;width:100%;height: 40px;font-size: 12px">
                                                        内容：${postlist.content}
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="layui-tab-item">内容2</div>
                            <div class="layui-tab-item">内容3</div>
                            <div class="layui-tab-item">内容4</div>
                            <div class="layui-tab-item">内容5</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
<div id="footer"></div>
</body>
</html>
