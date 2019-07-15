<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
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

            // getNewPost();
        });

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
