<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<head>
    <title>版块专区</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/mycss.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js" type="text/javascript"></script>
    <style>
        .sectionbody {
            text-align: center;
            margin-left:31px;
        }
        .sectionbg{
            background-color: #f2f2f2;
        }
        .sectionbg:hover{
            background-color: rgba(226, 226, 226, 0.29);
        }
        .breadcrumb{
            margin-bottom: 5px;
            background-color: #FFFFFF;
        }
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
        .sectionback{
            background-color: rgba(30, 159, 255, 0.5);
            color: #ffffff;
        }

    </style>
</head>
<body>
<%@include file="../common/head.jsp" %>

<div class="layui-container" style="padding-top: 4%; ">
    <ol class="breadcrumb">
        <li><a href="/home">首页</a></li>
        <li class="active">版块</li>
    </ol>
    <blockquote class="layui-elem-quote " style="background-color: #FFFFFF;margin-bottom: 5px">所有版块</blockquote>
    <div class="layui-row" id="Section" style="background-color: #ffffff; overflow: auto;min-height: 20%;max-height: 60%;padding: 5px">
        <%--版块区--%>
    </div>
    <div class="layui-row" style="min-height: 100%;background-color: #ffffff">
        <blockquote class="layui-elem-quote">推荐帖子</blockquote>

        <div class="layui-col-md12" id="NewPost">
            <%--内容区--%>
        </div>

    </div>
</div>

<script>

    layui.use(['laypage', 'layer','util'], function () {
        var laypage = layui.laypage
             ,layer = layui.layer
              ,util = layui.util;

        $(function () {

            getNewPost();
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
                        $.get('/getpostlist?page=' + page,{}, function (res) {
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
                                        '                    <span>'+item.category.name+'</span>' +
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

    });
    $(function () {
        getSection();
    });
    function getSection() {
        $.get("/section/getAllSection",function (data) {
            var content="";
            for (var i=0;i<data.length ;i++){
                content+="" +
                    "<div class=\"layui-col-md2 sectionbody\">\n" +
                    "            <a href=\"/section/sectionDetail?id="+data[i].id+"\">\n" +
                    "            <div class=\"panel panel-default\">\n" +
                    "                <div class=\"panel-body sectionbg\">\n" +
                    "                   "+data[i].name+" <span class=\"layui-badge\">  "+(i+1)+"</span>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "            </a>\n" +
                    "        </div>"
            }
            $("#Section").html(content);
        });
    }
</script>

</body>
</html>
