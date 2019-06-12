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


<div style="width: 98%; margin: 5px auto;height: 100%;border: 1px red solid">
    <div style="width: 100%;height: 100%">
        <ul class="body_box">
            <li>111</li>
            <li>2222</li>
        </ul>

    </div>
    <div></div>
</div>

<div class="panel panel-default" style="background-color: #00FFFF;border: 1px red solid">
    <!-- 评论区 -->
    <div class="panel-body" style="padding: 5px;">
        <div style="height: 35px;width: 100%">
            <div style="width: 50px;float: left"><img src="${ctx}/${user.headshot}" alt="..." class="img-circle" width="35px" height="35px" style="text-align: center"></div>
            <div style="float: left;margin-left: 2px;width: 100px;text-align: center">用户名</div>
        </div>
        <div style="padding: 1px 3px;overflow: hidden;max-height: 100px">内容：热评一</div>
        <div style="width: 100%;height: 25px;">
            <div style="width: 100px;float: left;font-size: 12px;color: #A9A9A9;;">时间</div>
            <div style="width: 100px;float:right;"><i class="fa fa-thumbs-o-up"></i><i style="color: red" class="fa fa-thumbs-up"></i><i style="color: red" class="fa fa-thumbs-down"></i><i class="fa fa-thumbs-o-down"></i></div>
        </div>
    </div>
</div>
</div>

</body >
<script type="text/javascript">
    function load(){
        $("#loading").fadeOut("slow");
    }
</script>
</html>
