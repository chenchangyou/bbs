<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <title>${post.title}</title>
    <%@include file="../common/style.jsp"%>
    <script type="text/javascript">
        $(function(){
            //页面加载完毕后开始执行的事件
            $(".reply_btn").click(function(){
                $(".reply_textarea").remove();
                $(this).parent().parent().parent().parent().append("<div class='reply_textarea'><textarea id='user_reply' class='form-control' name='content' rows='3'></textarea><br/><button type='submit' class='btn btn-info btn-right' id='publish' style='position: relative;left: 94%'>回复</button></div></form>");
            });
        });
      function respond(){
          if($("#user_reply").val().length < 0){
              alert("请输入内容！")
          }else {
            $(this).parent().parent().parent().submit();
          }
       }
    </script>
</head>
<body  onload="load()">

<div id="loading" class="loader" >
</div>
<!-- 引入头部 --->
<%@include file="../common/head.jsp"%>

<div style="width: 1180px;margin:60px auto 0 auto;">
    <ol class="breadcrumb">
        <li><a href="home">首页</a></li>
        <li class="active">帖子详情</li>
    </ol>
    <div class="box-left articlelist">
        <p><img src="${ctx}/${user.headshot}" alt="..." class="img-circle" width="70px" height="70px" style="text-align: center"></p>
        <p>${user.username}</p>
        <p>个人信息</p>
        <button type="button" class="btn btn-info btn-right"><i class="fa fa-plus"></i> 关注</button>
    </div>
    <div>

        <div class="box-middle articledetail" style="width: 980px">
            <div>
                <div class="panel panel-default">
                    <div class="panel-body">
                       <h2> ${post.title} </h2>
                    </div>
                    <div style="width: 100%;height: 30px;padding: 0 5px;">
                        <div style="height: 30px;text-align: center;line-height: 30px;float: left">作者：${user.username}</div>
                        <div style="width: 100px;font-size: 12px;color: #A9A9A9;float: right;line-height: 30px;"><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd hh:mm"/></div>
                    </div>
                    <hr style="color: #93D1FF;height: 3px">
                    <div style=" background-color: #F2F2F2;min-height:300px;overflow: hidden;word-wrap:break-word;word-break:break-all;padding: 5px 10px">
                        ${post.content}
                    </div>
                </div>
            </div>
           <div style="width: 100%;height: 40px;padding: 2px;">
               <div style="width: 100px;height: 100%;font-size: 25px;font-weight: bolder;float: left">评论区</div>
               <div style="width: 58px;float: right;height: 100%"><a class="btn btn-default" href="#replys" role="button">回复</a></div>
           </div>
            <c:forEach items="${replyList}" var="reply" varStatus="number">
                <div class="panel panel-default" style="background-color: rgba(0,255,255,0.02);border: 1px red solid">
                    <!-- 评论区 -->
                    <form action="/replyComment/add" method="post" class="reply1">
                    <div class="panel-body" style="padding: 5px;">
                        <div style="height: 35px;width: 100%">
                            <div style="width: 50px;float: left"><img src="${ctx}/${reply.user.headshot}" alt="..." class="img-circle" width="35px" height="35px" style="text-align: center"></div>
                            <div style="float: left;margin-left: 2px;width: 100px;text-align: center">
                                <c:if test="${reply.user.id == post.user.id}"><span style="color:#1E9FFF;font-weight: bolder">楼主 </span></c:if>
                                    ${reply.user.username}
                            </div>
                            <span style="float: right;width: 70px;text-align: center">#${number.count}</span>
                        </div>
                        <div style="padding: 5px 10px 10px 60px;overflow: hidden;min-height:35px">${reply.content}</div>
                        <div style="width: 100%;height: 25px;" class="comment">
                            <div style="width: 150px;float: left;font-size: 12px;color: #A9A9A9;"><fmt:formatDate value="${reply.createTime}" pattern="yyyy-MM-dd hh:mm"/>
                            </div>
                            <div style="width: 40px;float: right;margin-left: 3px;">
                                <c:if test="${reply.user.id == loginUser.id}"><a href="javascript:;" style="color:#1E9FFF;font-weight: bolder">删除</a></c:if>
                            </div>
                            <div style="width: 130px;float:right;margin-left: 5px">
                                <a href="javascript:;"><i class="fa fa-thumbs-o-up"></i>
                                    <span style="margin-left: 3px">999+</span></a>
                                <a style="margin-left: 5px" href="javascript:;"><i class="fa fa-thumbs-o-down"></i>
                                    <span style="margin-left: 3px">250</span></a>
                            </div>
                                <div style="float: right;width: 50px">
                                    <input type="hidden" name="replyId" value="${reply.id}">
                                    <c:if test="${not empty loginUser}">
                                        <a href="javascript:;" class="reply_btn" >回复</a>
                                    </c:if>
                                    <c:if test="${empty loginUser}">
                                        <a href="javascript:;" data-toggle="modal" data-target="#myModal" >回复</a>
                                    </c:if>
                                </div>
                        </div>
                    </div>
                    </form>

                    <%--回复区--%>

                    <c:forEach items="${reply.replyCommentList}" var="comment">
                        <div class="panel panel-default" style="margin-right: 6px;background:none;border:none">
                            <div class="panel-body"style="padding: 5px;margin-left: 60px">
                               <sapn style="float: left"><img src="${ctx}/${comment.user.headshot}" style="width: 35px;height: 35px; border-radius:50%"></sapn>
                               <div style="width: 100%;">
                                   <c:if test="${reply.user.id == comment.user.id}"><span style="color:#1E9FFF;font-weight: bolder;float: left">楼主：</span></c:if>
                                   <span style="float: left">${comment.user.username}：&nbsp;</span>
                                   <%--<span style="color: #1E9FFF">回复&nbsp;${reply.user.username}：</span>--%>
                                   <span style="width: 500px;float: left">${comment.content}</span>
                                   <span style="width: 50px;float: right"><a href="javascript:;">回复</a></span>
                                   <%--<div style="width: 100%"><span style="float: right;padding: 2px 5px"><fmt:formatDate value=">" pattern="yyyy-MM-dd hh:mm"/></span></div>--%>
                               </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
            
            <c:if test="${empty replyList}">
                <div class="panel panel-default" style="background-color: rgba(0,255,255,0.02);height: 100px; text-align: center">
                        <p style="line-height: 100px">趁没人赶紧抢沙发吧</p>
                </div>
            </c:if>
            <hr>
            <h3>发表一下看法吧</h3>
            <c:if test="${not empty loginUser}">
                <div id="replys" style="width: 100%;height: 200px;margin-top: 50px">
                    <form action="addReply" method="post">
                        <div id="editor"></div>
                        <input type="hidden" name="postId" value="${post.id}">
                        <textarea id="content" name="content" style="display: none;"></textarea></br>
                        <button class="btn btn-danger" style="width:100px;float: right" type="submit" > 发表</button>
                    </form>
                </div>
            </c:if>

            <c:if test="${empty loginUser}">
                <div id="replys" style="width: 100%;height: 200px;margin-top: 50px;border: 1px silver solid;margin-bottom: 10px;text-align: center;">
                    <button href="javascript:;" data-toggle="modal" data-target="#myModal" style="width: 150px;text-align: center;height: 30px;margin:85px auto">登陆后才可发表</button>
                </div>
            </c:if>

        </div>
    </div>
</div>
<div id="footer"  style="width: 100%;height: 150px"></div>
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



</script>


</body>
</html>
