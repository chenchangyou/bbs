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
                    <c:forEach items="${section.sectionCategory}" var="category" varStatus="s">
                        <li <c:if test="${s.first}">class="layui-this"</c:if>>${category.name}</li>

                    </c:forEach>
                </ul>
                <div class="layui-tab-content"></div>
            </div>

        </div>

    </div>
</div>
<script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
<script>
    layui.use(['layer','util','element'], function () {
            var layer = layui.layer
              ,util = layui.util
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
</script>

</body>
</html>
