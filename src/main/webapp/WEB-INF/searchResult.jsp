<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<head>
    <title>搜索结果</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/mycss.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js" type="text/javascript"></script>
</head>
<body>
<%@include file="../common/head.jsp" %>

<div class="layui-container">
    <div class="layui-row" style="background-color: #ffffff; min-height: 100%;margin-top: 60px">

        <div class="layui-col-md12">
            <form id="search_form" method="get" action="/post/searchResult/">
                <div class="input-group">
                    <input id="keyword" name="keyword" type="text" class="form-control" placeholder="输入关键进行搜索"
                           value="${keywordMap.keyword}">
                      <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">搜索</button>
                      </span>
                </div>
            </form>
        </div>

        <div class="layui-col-md12">
            <div class="panel panel-default">
                <div class="panel-heading"> 本次共搜索到<span style="color: red">${keywordMap.cont}</span>条数据</div>
                <div class="panel-body">
                    <ul class="list-group" id="content">
                        <c:forEach items="${keywordMap.byKeyWord}" var="keyword">
                            <li class="list-group-item">
                                <a class="" href="/postdetails?postlistId=${keyword.id}">${keyword.title}</a>
                                <span style="position: absolute;right: 2%">发布于 <fmt:formatDate value="${keyword.createTime}" pattern="yyyy-MM-dd HH:mm"/></span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="layui-col-md12" style="text-align: center">
                <div id="pages"></div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['laypage', 'layer','util'], function () {
        var laypage = layui.laypage
             ,layer = layui.layer
              ,util = layui.util;

        //分页功能
        laypage.render({
            elem: 'pages'
            , count: ${keywordMap.cont}
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            , jump: function (obj) {
                var keyword = $("#keyword").val();
                var page = obj.curr;
                var content='';
                var id ='';
                var title='';
                var createTime='';
                $.post("/post/searchResult/bykeyword/",{keyword:keyword,page:page,limit:obj.limit},function (data) {
                    $.each(data.date,function (i,v) {

                        id=v.id;title=v.title;createTime=util.toDateString(v.createTime, "yyyy-MM-dd HH:mm");

                       content +=" <li class=\"list-group-item\">" +
                           "<a class=\"\" href=\"/postdetails?postlistId="+id+" \">"+title+"</a>\n" +
                           "                                <span style=\"position: absolute;right: 2%\">发布于 "+createTime+"</span>" +
                           "</li>"

                    });
                    $("#content").html(content);
                    prominent();
                });
              }
        });
    });
</script>
<script>
        //搜索内容高亮
        $(function () {

            prominent();
        });
        function prominent() {
            //获取要查找的字符串
            var searchVal =  $("#keyword").val();
            if(searchVal.length>0){
                // 获取要查找的内容
                var text =  $("#content").html();
                //将之前的查找高亮的字符串,取消高亮
                text = text.replace(/<b[^>]*>([^>]*)<\/b[^>]*>/ig,"$1");
                $("#content").html(text);
                //初始化正则表达式,加上括号(),形成可捕获元组.ig表示全局匹配和不区分大小写
                var reg = new RegExp("("+searchVal +")","ig");
                //高亮要查找的字符串
                text = text.replace(reg,"<b style='color: red'>$1</b>");
                $("#content").html(text);
            }
        }
</script>
</body>
</html>
