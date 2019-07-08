<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div class="bg-top">
    <div id="user_bg"
         style="width: 100%;height: 100px;background-image: url('../../static/images/bg_transparent.png') ">
        <div style="width: 100%;margin-left: 20px;padding-top: 10px;">
            <div style="width: 70px;height: 70px;float: left;border: 2px solid hsla(0,0%,100%,.4);border-radius: 52px;">
                <a  id="replacehead"  style=" background: url('${user.headshot}'); background-size:100% 100%;"
                   href="javascript:;">
                    <c:if test="${not empty loginUser}">
                        <c:if test="${loginUser.id eq user.id}">
                            <span class="replace_bg layui-anim layui-anim-upbit">更换头像</span>
                        </c:if>
                    </c:if>
                </a>
            </div>
            <div style="width: 750px;float: left;margin-left: 20px;margin-top: 10px;color: #FFFFFF">
                <div>
                    <span style="font-weight: 700;font-size: 24px;color: #FFFFFF; vertical-align: middle">${user.username}</span>
                    <c:if test="${not empty loginUser}">
                        <c:if test="${loginUser.id eq user.id}">
                            <span>
                                <c:if test="${user.sex == '男'}"><i style="color: #18a2ff;font-size: 18px;"
                                                                   class="layui-icon layui-icon-male"></i></c:if>
                                <c:if test="${user.sex =='女'}"><i style="color: rgba(227,120,203,0.83)"
                                                                  class="layui-icon layui-icon-female"></i></c:if>
                                <c:if test="${user.sex == '保密'}">保密</c:if>
                            </span>
                        </c:if>
                        <c:if test="${loginUser.id !=user.id}">
                            <c:if test="${setting.sex}">
                                <span>
                                    <c:if test="${user.sex == '男'}"><i style="color: #18a2ff;font-size: 18px;"
                                                                       class="layui-icon layui-icon-male"></i></c:if>
                                    <c:if test="${user.sex =='女'}"><i style="color: rgba(227,120,203,0.83)"
                                                                      class="layui-icon layui-icon-female"></i></c:if>
                                    <c:if test="${user.sex == '保密'}">保密</c:if>
                                </span>
                            </c:if>
                        </c:if>
                    </c:if>

                    <c:if test="${empty loginUser}">
                        <c:if test="${setting.sex}">
                                <span>
                                    <c:if test="${user.sex == '男'}"><i style="color: #18a2ff;font-size: 18px;"
                                                                       class="layui-icon layui-icon-male"></i></c:if>
                                    <c:if test="${user.sex =='女'}"><i style="color: rgba(227,120,203,0.83)"
                                                                      class="layui-icon layui-icon-female"></i></c:if>
                                    <c:if test="${user.sex == '保密'}">保密</c:if>
                                </span>
                        </c:if>
                    </c:if>

                </div>
                <div style="margin-top: 5px">
                    个性签名：
                </div>
            </div>
        </div>
        <c:if test="${not empty loginUser}">
            <c:if test="${loginUser.id eq user.id}">
                <div style="float: right;height: 80px;width: 130px;margin-top: 37px">
                    <a class="bg-setting" href="javascript:;" style="">
                        <i class="fa fa-cog"></i>
                        <span>更换背景</span>
                    </a>
                </div>
            </c:if>
        </c:if>
    </div>
</div>