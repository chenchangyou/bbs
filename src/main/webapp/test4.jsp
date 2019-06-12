<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/taglib.jsp"%>
<html>
<!DOCTYPE html>
<head>
    <title>欢迎来到友人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <%@include file="common/style.jsp"%>
    <style>
        .loader {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background: url('https://img-blog.csdn.net/20161205162919763') 50% 50% no-repeat rgb(249,249,249);
        }
        .body_box{
            width: 100%;
            height: 100%;
        }
        .body_box li{
            width: 100%;
            height: 200px;
            list-style: none;
            margin-top: 3px;
            border: 1px red solid;
            text-align: center;
        }
    </style>
</head>
<body  onload="load()">

<div id="loading" class="loader" >
</div>

<!--你的内容-->
<%@include file="common/head.jsp"%>

<ul>
    <li>
        1号用户评论
        <div>hello,我是第1条评论 2018-03-21 12:00:00 <a href="javascript:;" class="reply_btn" >回复</a></div>
    </li>
    <li>
        2号用户评论
        <div>hello,我是第2条评论 2018-03-21 12:00:00 <a href="javascript:;" class="reply_btn" >回复</a></div>
    </li>
    <li>
        3号用户评论
        <div>hello,我是第3条评论 2018-03-21 12:00:00 <a href="javascript:;" class="reply_btn" >回复</a></div>
    </li>
</ul>

</body >
<script type="text/javascript">
    $(function(){
        //页面加载完毕后开始执行的事件
        $(".reply_btn").click(function(){
            $(".reply_textarea").remove();
            $(this).parent().append("<div class='reply_textarea'><textarea name='' cols='40' rows='5'></textarea><br/><input type='submit' value='发表' /></div>");
        });
    });
</script>
</html>
