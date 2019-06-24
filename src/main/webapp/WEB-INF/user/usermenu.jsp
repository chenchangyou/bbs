<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div class="bg-top">
        <div id="user_bg" style="width: 100%;height: 100px;background-image: url('../../static/images/bg_transparent.png') ">
            <div style="width: 100%;margin-left: 20px;padding-top: 10px;">
                <div style="width: 70px;height: 70px;float: left;border: 2px solid hsla(0,0%,100%,.4);border-radius: 52px;">
                    <a id="replacehead"  style=" background: url('${ctx}/${user.headshot}'); background-size:100% 100%;" href="javascript:;">
                        <%--<img>--%>
                        <span class="replace_bg layui-anim layui-anim-upbit">更换头像</span>
                    </a>
                </div>
                <div style="width: 750px;float: left;margin-left: 20px;margin-top: 10px;color: #FFFFFF">
                    <div>
                        <span style="font-weight: 700;font-size: 24px;color: #FFFFFF; vertical-align: middle">${user.username}</span>
                    </div>
                    <div style="margin-top: 5px">
                        个性签名：
                    </div>
                </div>
            </div>
            <div style="float: right;height: 80px;width: 130px;margin-top: 37px">
                <a class="bg-setting" href="javascript:;"style="">
                    <i class="fa fa-cog"></i>
                    <span>更换背景</span>
                </a>
            </div>
        </div>
    </div>
    <div style=" width: 100%;margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item <%--layui-this--%>"><a href="/user/index"><i class="fa fa-home fa-1x" style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item <%--layui-this--%>"><a href="/user/post/list?uid=${loginUser.id}"><i class="fa fa-pencil-square-o fa-1x"
                                                                            style="color: #04bdff"></i> 帖子（999+）</a>
                </li>
                <li class="layui-nav-item"><a href=""><i class="fa fa-user-plus fa-1x"></i> 关注（20）</a></li>
                <li class="layui-nav-item"><a href=""><i class="fa fa-star fa-1x" style="color: orange"></i> 收藏（99+）</a>
                </li>
                <li class="layui-nav-item"><a href=""><i class="fa fa-heart fa-1x" style="color: #eeb4c3"></i>
                    粉丝（7800万+）</a></li>
                <li class="layui-nav-item"><a href=""><i class="fa fa fa-cog fa-spin fa-1x" style="color: #041527"></i>
                    设置</a></li>

            </ul>
        </div>
    </div>

