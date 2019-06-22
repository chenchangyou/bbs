<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>发表新帖</title>
    <%@include file="../../common/style.jsp"%>

    <style>
        #demo1{
            width: 400px;
            height: 180px;
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
                <h2>发布帖子</h2>
                <form action="addpost" method="post" class="layui-form">
                    <input type="hidden" name="act" value="add" />
                    用户名：${loginUser.username} <br>
                    标题：<input type="text" class="form-control" autocomplete="off"  style="width: 200px" name="title" /><span id="title1" style="color: red"></span><br/>
                    <div>
                        <div style="width: 100%">
                           <div style="width: 600px;">
                            <h3>简介 (建议50个字左右)</h3>
                               <hr>
                            <textarea class="form-control" rows="4"></textarea>
                               <div>
                                   <p>选择帖子类型</p>
                                   <select name="city" lay-verify="">
                                       <option value="">请选择类型</option>
                                       <option value="010">北京</option>
                                       <option value="021">上海</option>
                                       <option value="0571">杭州</option>
                                   </select>
                               </div>
                           </div>
                            <div style="margin-top:  26px;">
                                <h3>上传封面图（可选）</h3>
                                <hr>
                                <div class="layui-upload-drag" id="test10">
                                    <i class="layui-icon"></i>
                                    <p>点击封面图，或将文件拖拽到此处</p>
                                </div>
                                <img class="layui-upload-img" id="demo1">
                            </div>
                        </div>
                        <div style="clear:both">

                        </div>
                    </div>
                    <hr>
                    <h2>正文内容</h2>
                    <div id="editor"></div>
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
    };
    // 配置服务器端图片上传地址
    editor.customConfig.uploadImgServer = '${ctx}/global/postimage';

    editor.customConfig.uploadFileName = 'file';
    // 将图片大小限制为 10M
    editor.customConfig.uploadImgMaxSize = 10 * 1024 * 1024;
    // 限制一次最多上传 （5） 张图片
    editor.customConfig.uploadImgMaxLength = 10000;//不限制
    editor.create();
    // 初始化 textarea 的值
    $content.val(editor.txt.html());
</script>
<script>
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
