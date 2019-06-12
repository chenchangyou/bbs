<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <%@include file="../../common/style.jsp"%>
</head>
<body>
<%@include file="../../common/head.jsp"%>

<div style="height: 650px; width: 1160px;margin:80px auto;padding:10px 10px;background-color:#FFFFFF;box-shadow: 2px 2px 2px #888888;">
    <ol class="breadcrumb">
        <li>首页</li>
        <li class="active">个人中心</li>
    </ol>

<div style="width: 100%">

    <div style="width:200px;height: 630px;float: left">


    </div>
    <div style="width:900px;height: 630px;padding: 15px;float: right">

        <div style="width: 100%;padding: 15px 10px"><h3 style="font-weight: bolder">个人资料</h3></div>
        <hr style="color:#888888;height: 1px ">
        <div style="width: 100%;height: 560px">
            <div style="width: 150px;height: 560px;float: left;text-align: center">
                <img src="${ctx}/${loginUser.headshot}" alt="..." class="img-circle" width="100" height="100">
                <p style="text-align: center;width: 100%"><a href="#" style="color: #1E9FFF;"> 修改头像 </a></p>
            </div>
            <div style="width: 700px;height: 560px;float: right">
                <div style="width: 100%;height: 80px;padding: 2px 10px">
                    <div style="width: 100%;height: 30px">
                        <span style="line-height: 30px ;width: 100px;float: left">ID ：${loginUser.id}</span>
                        <a style="line-height: 30px ;width: 80px;padding: 0 3px;float: right;color: #1E9FFF" href="">个人主页>></a>
                    </div>
                    <div style="width: 100%;height: 30px;margin-top: 10px">
                        <span style="margin-left: 10px;text-align: center;line-height: 30px;">关注 99</span>
                        <span style="margin-left: 10px;text-align: center;line-height: 30px;">粉丝 888万</span>
                        <span style="margin-left: 10px;text-align: center;line-height: 30px;">等级 99+</span>
                    </div>
                </div>
                <hr style="color:#888888;height: 1px ">
                <div style="width: 100%;height: 470px;font-size: 16px">
                    <div style="width: 100%;height: 30px">
                        <span style="line-height: 30px ;width: 100px;float: left">昵称：${loginUser.username}</span>
                        <a style="line-height: 30px ;width: 100px;padding: 0 3px;float: right;color: #1E9FFF" href="">修改资料>></a>
                    </div>
                    <div>性别：${loginUser.sex}</div>
                    <div>年龄：${loginUser.age}</div>
                    <div>联系电话：${loginUser.tel}</div>
                    <div>邮箱：${loginUser.email}</div>
                    <div>注册时间：<fmt:formatDate value="${loginUser.createTime}" pattern="yyyy-MM-dd"/></div>
                </div>

            </div>
        </div>

    </div>

</div>

</div>

<script>

</script>
</body>
</html>
