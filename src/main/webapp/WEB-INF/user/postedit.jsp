<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>编辑帖子</title>
    <%@include file="../../common/style.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <style>
        #demo1{
            width: 400px;
            height: 180px;
        }
        .layui-form-select dl{
            z-index: 999999;
        }
    </style>
</head>
<body>
<%@include file="../../common/head.jsp"%>
<div style="width: 1180px;margin: 65px auto">
    <ol class="breadcrumb">
        <li><a href="home">首页</a></li>
        <li class="active">发表新帖</li>
    </ol>
    <h2>编辑帖子</h2>
    <form action="/post/edit" method="post" class="layui-form" enctype="multipart/form-data">
        <input type="hidden" name="pid" value="${post.id}">
        <input type="hidden" name="act" value="add" />
        用户名：${post.user.username} <br>
        <%--<input type="text" class="form-control" autocomplete="off"  name="title" /><span id="title1" style="color: red"></span><br/>--%>
        标题：<input style="width: 200px" value="${post.title}"  type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        <div>
            <div style="width: 100%">
                <div style="width: 600px;">

                    <hr>
                    <%--<textarea name="synopsis" class="form-control" rows="4" id="accepted_answer"></textarea>--%>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">简介</label>
                        <div class="layui-input-block">
                            <textarea name="synopsis" placeholder="请输入内容" class="layui-textarea" id="accepted_answer"  lay-verify="required">${post.synopsis}</textarea>
                        </div>
                    </div>
                    <span style="margin-left: 100%;color: #0000FF" id="word">100</span><span>/100</span>
                    <div>
                        <p>选择帖子类型</p>
                        <select name="category" lay-verify="required" class="select_cat">
                            <option value="">请选择类型</option>
                            <c:forEach items="${categoryList}" var="category">
                                <option <c:if test="${post.category.id == category.id}"> selected = "selected"</c:if> value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div style="margin-top:  26px;">
                    <h3>上传封面图（可选）</h3>
                    <hr>
                    <input type="file" name="file">
                    <p>请选择文件</p>
                    <%--<div class="layui-upload-drag" id="test10">
                        <i class="layui-icon"></i>
                        <p>点击封面图，或将文件拖拽到此处</p>
                    </div>--%>
                    <img class="layui-upload-img" id="demo1" src="${post.coverImage}">
                </div>
            </div>
            <div style="clear:both">

            </div>
        </div>
        <hr>
        <h2>正文内容</h2>
        <hr>
        <div id="editor">${post.content}</div>
        <textarea id="content" name="content" style="display: none;" lay-verify="required"></textarea></br>

        <div class="layui-form-item" style="float: right">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" style="background-color: #0cc1f7">保存修改</button>
            </div>
        </div>
    </form>
</div>
<script>
    var E = window.wangEditor
    var editor = new E('#editor');
    var $content = $('#content');

    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $content.val(html)
    };
    // 配置服务器端图片上传地址
    editor.customConfig.uploadImgServer = '${ctx}/global/postimage';

    editor.customConfig.uploadFileName = 'file';
    // 将图片大小限制为 5M
    editor.customConfig.uploadImgMaxSize = 5 * 1024 * 1024;
    // 限制一次最多上传 （5） 张图片
    editor.customConfig.uploadImgMaxLength = 10000;//不限制
    editor.create();
    // 初始化 textarea 的值
    $content.val(editor.txt.html());
    //Demo

    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        upload.render({
            elem: '#test10'
            ,url: '/global/postimage'
            ,auto:false
            ,bindAction:'btn-danger'
            ,choose: function(obj){
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）直接将图片地址赋值给img的src属性
                });
            }
        });
    });


    $(function(){
        $("#accepted_answer").keyup(function(){
            var len = $(this).val().length;
            if(len > 99){
                $(this).val($(this).val().substring(0,100));
                $("#word").text(0);
            }
            var num = 100 - len;
            if(num<0){
                layer.msg('不能再写了哦');
                return false;
                $("#word").text(0);
            }else{
                $("#word").text(num);
            }
        });
    });
</script>
</body>
</html>
