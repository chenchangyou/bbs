<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<head>
    <title>注册成功</title>
    <%@include file="../common/style.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
</head>
<body>
<div style="width: 600px;height: 400px; margin: 50px auto;">
    <div style="width: 100%; height: 150px;">
        <img alt="" src="${ctx}/static/images/registerSuccess.svg" width="120px" style="float: left;"><span style="float: left; font-size: 50px;position: relative;top:14px;left: 18px;">恭喜您注册成功!</span>
    </div>
    <div style="width: 100%"><h3 style="font-size: 25px;margin: 0 auto; margin-top:30px; width: 330px">将在<span id="js" style="color:red">3</span>秒后跳转至首页 </h3><a href="/home">如未跳转请点击这里</a></div>

</div>

<script type="text/javascript">
    var index = 3;
    $(function(){
        ds=setInterval(dsq,1000);
    })
    function dsq(){
        index--;
        $("#js").html("");
        $("#js").append(index);
        if(index==0){
            window.clearTimeout(ds);
            window.location.replace("/home");
        }
    }
</script>
</body>
</html>
