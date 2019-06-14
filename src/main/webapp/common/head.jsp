<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script>
    $(function(){
        var data = $('#form1').serialize()
            $("#login").click(function(){
                $.ajax({
                    url:"${ctx}/user/login",// 发送请求的URL字符串。
                    // 发送到服务器的数据。
                    data:$('#form1').serialize(),
                    type : "post", //  请求方式 POST或GET
                    dataType : "json", // 预期服务器返回的数据类型。
                    async:  true , // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
                    // 请求成功后的回调函数。
                    success :function(data){
                        if(data.ok){
                            $("#error").html("登录成功");
                            window.location.reload();
                        }else {
                            $("#error").html(data.error);
                        }
                    },
                    // 请求出错时调用的函数
                    error:function(){
                        $("#error").html("登录失败！")
                    }
                });
            });
    })
</script>

<nav class="navbar navbar-default navbar-fixed-top" style="background-color:rgba(247, 247, 247, 0.8);z-index: 100;border: none;box-shadow: 2px 2px 2px #888888;">
    <div class="container-fluid" style="width: 1180px;">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}/home">友人BBS</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="${ctx}/home">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">新帖</a></li>
                <li><a href="#">标签</a></li>
                <li><a href="#">类别</a></li>
                <li><a href="#">留言</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${empty loginUser}">
                    <li><a class="btn" id="denglu" data-toggle="modal" data-target="#myModal">登陆</a></li>
                    <li><a href="${ctx}/user/register">注册</a></li>
                    <li><a href="#">关于</a></li>
                </c:if>
                <c:if test="${not empty loginUser}">
                    <li><a href="${ctx}/user/index">欢迎你，${loginUser.username}</a></li>
                     <li> </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${ctx}/user/index">个人中心</a></li>
                            <li><a href="#">信息</a></li>
                            <li><a href="#">关于</a></li>
                            <li><a href="${ctx}/user/logout">注销</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 99999" >
    <div class="modal-dialog" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <span class="modal-title" id="myModalLabel" style="font-size: 25px;font-weight: bolder">用户登录</span>
                <span id="error" style="color: red;text-align: center;font-size: 15px;margin-left: 70px;"></span>
            </div>
            <form id="form1" method="post" style="width: 380px;margin: 5px auto">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input id="loginuser" type="text" name="username" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input id="loginpassword" type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" type="button" id="login">立即登陆</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="gb" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
