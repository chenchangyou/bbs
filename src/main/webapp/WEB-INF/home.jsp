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
</head>
<body onload="load()">

<div id="loading" class="loader">
</div>
<%@include file="../common/head.jsp" %>
<div class="layui-container" style="width: 1180px;margin: 60px auto 30px auto;height: 300px;padding: 0">
    <div class="layui-carousel" id="test1">
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
        <p><img src="${ctx}/${loginUser.headshot}" alt="..." class="img-circle" width="70px" height="70px"
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
            <div class="panel panel-default" style="margin-top: 5px">
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
<script>
    layui.use('util', function(){
        var util = layui.util;
        //执行
        util.fixbar({
            bar1: false
            /*,click: function(type){
                console.log(type);
                if(type === 'bar1'){
                    alert('点击了bar1')
                }
            }*/
        });
    });
    function getNewPost() {
        layui.use('flow', function () {
            var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
            var flow = layui.flow;
            var util = layui.util;
            var postImg;
            flow.load({
                elem: '#NewPost' //指定列表容器
                , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                    var lis = [];
                    //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                    $.get('/getpostlist?page=' + page, function (res) {
                        //假设你的列表返回在data集合中
                        layui.each(res.date, function (index, item) {
                            if(item.coverImage!=null){
                                postImg = '<div>' +
                                    '<a href="postdetails?postlistId=' + item.id + '" target="_blank" class="thumbnail" style="width: 93%;height: 100%">' +
                                    '<img style="max-height: 100%;width:100%;height:100%' +
                                    '" src="${ctx}/'+item.coverImage+'" alt="...">'+
                                    '</a> ' +
                                    '</div>'
                            }else {
                                postImg = '';
                            }
                            lis.push('' +
                                '<div class="contentbox" style="width: 760px;height: 116px;margin:0 auto;border-bottom: 1px solid #f4f5f7;padding: 8px 0px;">' +
                                ' <a href="postdetails?postlistId=' + item.id + '"  target="_blank" style="display: block">' +
                                '        <div style="width: 75%;height: 100%;float: left">' +
                                '            <ul class="list-group" style="border: none">' +
                                '                <li class="list-group-item" style="text-overflow:ellipsis;overflow: hidden"><span class="titlebox" style="font-size: 20px;white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;font-weight: bolder;">' + item.title + '</span></li>' +
                                '                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden">' +
                                '               <span style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 10px">'+item.synopsis+'</span></li>' +
                                '                <li class="list-group-item span1">' +
                                '                    <span style="margin: 0;vertical-align: middle;">' +
                                '                        <img class="layui-circle" border="1px red" width="22px" height="22xp" src="${ctx}/' + item.user.headshot + '">' +
                                '                        ' + item.user.username + ' ' +
                                '                    </span>' +
                                '                    <span>发表于：'+ util.toDateString(item.createTime,'yyyy-MM-dd HH:mm') +'</span>' +
                                '                    <span>'+item.category.name+'</span>' +
                                '                    <span><i class="fa fa-eye"></i>  ' + item.browse + '</span>' +
                                '                    <span><i class="fa fa-thumbs-o-up"></i>  ' + item.collectCount + '</span>' +
                                '                    <span><i class="fa fa-commenting"></i>  ' + item.replynumber + '</span>' +
                                '                </li>' +
                                '            </ul>' +
                                '        </div>' +
                                '        <div style="width:22%;height: 100%;margin-left:15px;float: left;padding: 8px">' +
                                ''+postImg+'' +
                                '        </div>' +
                                '       </a>' +
                                '    </div>' +
                                '');
                        });
                        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                        next(lis.join(''), page < res.pages);
                    });
                }
            });
        });
    }
    $("#newpost").click();
        /*公告点击事件*/
    $(".notice").click(function () {
        var nid = $(this).attr("id");
        var title = $(this).text();
        var index = layer.open({
            type: 2,
            title :'友人公告-'+title,
            content: '/notice/detail?nid='+nid,
            area: ['700', '100%'],
            maxmin: false
        });
        layer.full(index);
    })
</script>
</body>
</html>
