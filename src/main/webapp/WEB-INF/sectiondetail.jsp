<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<head>
    <title>友人论坛_专区</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/mycss.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js" type="text/javascript"></script>
    <style>

        a:hover{
            text-decoration: none;
            color: cornflowerblue;
        }
        a:link{
            text-decoration: none;
            /*color: #000000;*/
        }
        a:visited{
            /*color: #000000;*/
        }
    </style>
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
</head>
<body>
<%@include file="../common/head.jsp" %>

<div class="layui-container">
    <div class="layui-row layui-col-space10" id="Section" style="background-color: #ffffff; min-height: 100%;margin-top: 60px">

        <div class="layui-col-md3">
          <blockquote class="layui-elem-quote">${section.name}·板块</blockquote>
        </div>
        <div class="layui-col-ma9">

        </div>
        <div class="layui-col-md12">
            <div class="layui-tab layui-tab-brief" lay-filter="demo">
                <ul class="layui-tab-title">
                    <li id="All" class="layui-this" onclick="getNewPost('${section.id}')">全部</li>
                    <c:forEach items="${section.sectionCategory}" var="category" varStatus="s">
                        <li class="category" id="${category.id}">${category.name}</li>
                    </c:forEach>
                </ul>
                <div id="post" class="layui-tab-content"></div>
            </div>

        </div>

    </div>
</div>
<script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
<script>
    layui.use(['flow','layer','element'], function () {
            var layer = layui.layer,
            flow = layui.flow
           ,element = layui.element;

            element.on('tab(demo)', function(data){
           console.log(data);
        });
    });
    function getSection() {
        $.get("/section/getAllSection",function (data) {
            var content="";
            for (var i=0;i<data.length ;i++){
                content+="<div class=\"layui-col-md2\">\n" +
                    "            <div class=\"panel panel-default\">\n" +
                    "                <div class=\"panel-body\">\n" +
                    "                    "+data[i].name+"\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "        </div>"
            }
            $("#Section").html(content);
        })
    }
    $(function () {
        $("#All").click();

        $(".category").click(function () {
            $("#post").empty();
            var id = $(this).attr("id");
            layui.use(['flow','util'], function () {
                var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
                var flow = layui.flow;
                var util = layui.util;
                var postImg;
                flow.load({
                    elem: '#post' //指定列表容器
                    , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                        var lis = [];
                        //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                        $.get('/getpostByCategory?page=' + page,{id:id}, function (res) {
                            //假设你的列表返回在data集合中
                            layui.each(res.date, function (index, item) {
                                if(item.coverImage!=null){
                                    postImg = '<div class="layui-hide-xs">' +
                                        '<a href="/postdetails?postlistId=' + item.id + '" target="_blank" class="thumbnail" style="width: 93%;height: 100%">' +
                                        '<img style="max-height: 100%;width:100%;height:100%' +
                                        '" src="'+item.coverImage+'" alt="...">'+
                                        '</a> ' +
                                        '</div>'
                                }else {
                                    postImg = '';
                                }
                                if(item.state ==1){
                                    lis.push('' +
                                        '<div class="contentbox layui-row" style="height: 120px;margin:0 auto;border-bottom: 1px solid #f4f5f7;">' +
                                        ' <a class="layui-col-xs12 layui-col-md9" href="/postdetails?postlistId=' + item.id + '"  target="_blank" style="display: block">' +
                                        '        <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" style="float: left">' +
                                        '            <ul class="list-group" style="border: none">' +
                                        '                <li class="list-group-item" style="text-overflow:ellipsis;overflow: hidden"><span class="titlebox" style="font-size: 20px;white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;font-weight: bolder;">' + item.title + '</span></li>' +
                                        '                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden">' +
                                        '               <span style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 10px">'+item.synopsis+'</span></li>' +
                                        '                <li class="list-group-item span1">' +
                                        '                    <span style="margin: 0;vertical-align: middle;">' +
                                        '                        <img class="layui-circle" border="1px red" width="22px" height="22xp" src="' + item.user.headshot + '">' +
                                        '                        ' + item.user.username + ' ' +
                                        '                    </span>' +
                                        '                    <span>发表于：'+ util.toDateString(item.createTime,'yyyy-MM-dd HH:mm') +'</span>' +
                                        '                    <span>'+item.sectionCategory.name+'</span>' +
                                        '                    <span><i class="fa fa-eye"></i>  ' + item.browse + '</span>' +
                                        '                    <span><i class="fa fa-thumbs-o-up"></i>  ' + item.collectCount + '</span>' +
                                        '                    <span><i class="fa fa-commenting"></i>  ' + item.replynumber + '</span>' +
                                        '                </li>' +
                                        '            </ul>' +
                                        '        </div>' +
                                        '       </a>' +
                                        '        <div class="layui-hide-xs layui-col-md3 layui-col-sm3" style="width:22%;height: 100%;margin-left:15px;float: left;padding: 8px">' +
                                        ''+postImg+'' +
                                        '        </div>' +
                                        '    </div>' +
                                        '');
                                }
                            });
                            //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                            //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                            next(lis.join(''), page < res.pages);
                        });
                    }
                });
            });
        })
    });



    function getNewPost(id) {
        $("#post").empty();
        layui.use(['flow','util'], function () {

            var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
            var flow = layui.flow;
            var util = layui.util;
            var postImg;
            flow.load({
                elem: '#post' //指定列表容器
                , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                    var lis = [];
                    //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                    $.get('/getpostBySection?page=' + page,{id:id}, function (res) {
                        //假设你的列表返回在data集合中
                        layui.each(res.date, function (index, item) {
                            if(item.coverImage!=null){
                                postImg = '<div class="layui-hide-xs">' +
                                    '<a href="/postdetails?postlistId=' + item.id + '" target="_blank" class="thumbnail" style="width: 93%;height: 100%">' +
                                    '<img style="max-height: 100%;width:100%;height:100%' +
                                    '" src="'+item.coverImage+'" alt="...">'+
                                    '</a> ' +
                                    '</div>'
                            }else {
                                postImg = '';
                            }
                            if(item.state ==1){
                                lis.push('' +
                                    '<div class="contentbox layui-row" style="height: 120px;margin:0 auto;border-bottom: 1px solid #f4f5f7;">' +
                                    ' <a class="layui-col-xs12 layui-col-md9" href="/postdetails?postlistId=' + item.id + '"  target="_blank" style="display: block">' +
                                    '        <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" style="float: left">' +
                                    '            <ul class="list-group" style="border: none">' +
                                    '                <li class="list-group-item" style="text-overflow:ellipsis;overflow: hidden"><span class="titlebox" style="font-size: 20px;white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;font-weight: bolder;">' + item.title + '</span></li>' +
                                    '                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden">' +
                                    '               <span style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 10px">'+item.synopsis+'</span></li>' +
                                    '                <li class="list-group-item span1">' +
                                    '                    <span style="margin: 0;vertical-align: middle;">' +
                                    '                        <img class="layui-circle" border="1px red" width="22px" height="22xp" src="' + item.user.headshot + '">' +
                                    '                        ' + item.user.username + ' ' +
                                    '                    </span>' +
                                    '                    <span>发表于：'+ util.toDateString(item.createTime,'yyyy-MM-dd HH:mm') +'</span>' +
                                    '                    <span>'+item.sectionCategory.name+'</span>' +
                                    '                    <span><i class="fa fa-eye"></i>  ' + item.browse + '</span>' +
                                    '                    <span><i class="fa fa-thumbs-o-up"></i>  ' + item.collectCount + '</span>' +
                                    '                    <span><i class="fa fa-commenting"></i>  ' + item.replynumber + '</span>' +
                                    '                </li>' +
                                    '            </ul>' +
                                    '        </div>' +
                                    '       </a>' +
                                    '        <div class="layui-hide-xs layui-col-md3 layui-col-sm3" style="width:22%;height: 100%;margin-left:15px;float: left;padding: 8px">' +
                                    ''+postImg+'' +
                                    '        </div>' +
                                    '    </div>' +
                                    '');
                            }
                        });
                        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                        next(lis.join(''), page < res.pages);
                    });
                }
            });
        });
    }
</script>

</body>
</html>
