<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>发表新帖</title>
    <%@include file="../../common/style.jsp"%>
</head>
<body>
<%@include file="../../common/head.jsp"%>
           <div style="width: 1180px;margin: 65px auto">
               <ol class="breadcrumb">
                   <li><a href="home">首页</a></li>
                   <li class="active">发表新帖</li>
               </ol>
                <h2>发布帖子</h2>
                <form action="addpost" method="post">
                    <input type="hidden" name="act" value="add" />
                    用户名：${loginUser.username}</br>
                    标题：<input type="text" class="form-control" autocomplete="off"  style="width: 200px" name="title" /><span id="title1" style="color: red"></span><br/>
                    内容<div id="editor"></div>
                    <textarea id="content" name="content" style="display: none;"></textarea></br>
                    <button class="btn btn-danger" style="width:100px;float: right" type="submit" > 发表</button>
                </form>
           </div>
<script>
    var E = window.wangEditor
    var editor = new E('#editor');
    var $content = $('#content');
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $content.val(html)
    }
    editor.create();
    // 初始化 textarea 的值
    $content.val(editor.txt.html());
</script>
<script>
    var $tips = "<div class=\"divs\">";
    function tj(){
        if($(".form-control").val().length <= 0){
            $(".form-control").css("border","1px red solid")
            xs("请输入标题");
        }else if ($("#editor").txt.html().length <= 0){
            xs("请输入内容");
        }else{
            $("#tj").submit();
        }
    }
    function xs(error){
        $(".divs").remove();
        $("body").append($tips+error+"</div>");
        setTimeout(function () {
            $(".divs").fadeOut(400);
        }, 1200);
    }
</script>
</body>
</html>
