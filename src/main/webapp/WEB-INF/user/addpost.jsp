<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>发表新帖</title>
    <%@include file="../../common/style.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <style>
        #demo1 {
            width: 400px;
            height: 180px;
        }

        .layui-form-select dl {
            z-index: 999999;
        }

        .w-e-toolbar {
            overflow: auto;
        }
        .w-e-droplist{
            position: absolute;
            z-index: 999999;
        }
        body{
            /*background-color: #71caf7;*/
        }
    </style>
</head>
<body>
<%@include file="../../common/head.jsp" %>
<div class="layui-container" style="background-color: rgba(255,255,255,0.8); margin: 65px auto">
    <ol class="breadcrumb">
        <li><a href="home">首页</a></li>
        <li class="active">发表新帖</li>
    </ol>
    <blockquote class="layui-elem-quote">发布帖子</blockquote>
    <form action="addpost" method="post" class="layui-form" enctype="multipart/form-data">
        <div class="layui-col-md8">
            <div class="layui-form-item">
                <input type="hidden" name="act" value="add"/>
                <label class="layui-form-label" style="width: 110px">
                    <i style="color: red;font-size: 18px"></i><B style="font-size: 15px;color:grey">用户名</B>

                </label>
                <div class="layui-input-inline">
                    ${loginUser.username}
                </div>
            </div>
            <div class="layui-form-item">

                <label class="layui-form-label" style="width: 110px">
                    <i style="color: red;font-size: 18px">* </i><B style="font-size: 15px;color:grey">标题</B>
                </label>
                <div class="layui-input-inline" style="width: 85%;margin: 0">
                    <input style="" type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div>
                <div style="width: 100%">
                    <div style="">
                        <hr>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label" style="width: 110px">
                                <i style="color: red;font-size: 18px">* </i><B style="font-size: 15px;color:grey">简介</B>
                            </label>
                            <div class="layui-input-block">
                                <textarea name="synopsis" placeholder="请输入内容" class="layui-textarea"
                                          id="accepted_answer" lay-verify="required"></textarea>
                                <span style="position: absolute;right: 10px; bottom: 7px;opacity: 0.5;">
                                       <span style="color: #0000FF" id="word">100</span>
                                       <span>/100</span>
                                      </span>
                            </div>
                        </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 110px">
                                    <i style="color: red;font-size: 18px">* </i><B style="font-size: 15px;color:grey">投稿分类</B>
                                </label>
                                <div class="layui-input-inline">
                                    <select lay-filter="test" name="section" id="partition" >
                                        <option  value="">请选择</option>
                                        <c:forEach items="${categoryList}" var="category">
                                        <option  value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="layui-input-inline">
                                    <select name="category" id="field" class="field">

                                    </select>
                                </div>
                            </div>
                    </div>
                    <div style="margin-top:  26px;">
                        <h3>上传封面图（可选）</h3>
                        <hr>
                        <input type="file" name="file">
                        <p>请选择文件</p>
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
        </div>
        <hr>
        <h2>正文内容</h2>
        <hr>
        <div class="form-group">
            <div id="editor"></div>
            <textarea id="detail" name="content" style="width:100%; height:200px;display:none;"></textarea>
        </div>
        <div class="layui-form-item" style="float: right">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" style="background-color: #0cc1f7">立即发表
                </button>
            </div>
        </div>
    </form>
</div>
<div id="footer"></div>
<script>
    var E = window.wangEditor;
    var editor = new E("#editor");
    var $detail = $('#detail');

    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $detail.val(html)
    };
    // 配置服务器端图片上传地址
    editor.customConfig.uploadImgServer = '/global/postimage';

    editor.customConfig.uploadFileName = 'file';
    // 将图片大小限制为 5M
    editor.customConfig.uploadImgMaxSize = 5 * 1024 * 1024;
    // 限制一次最多上传 （5） 张图片
    editor.customConfig.uploadImgMaxLength = 10000;//不限制
    editor.create();
    // 初始化 textarea 的值
    $detail.val(editor.txt.html());
</script>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;
        form.render();
        $(function () {
            form.on('select(test)',function(data){
                var id=data.value;
                $.get("/section/user/sectionCategory?id="+id,function (date,status) {
                    var  str="";
                    $.each(date,function(k,v){
                        str+="<option value="+v.id+">"+v.name+"</option>";
                    });
                    $("#field").html(str);
                    form.render();
                });
            });
            $('select[name="partition"]').next().find('.layui-anim-upbit').find('.layui-this').click();
            form.render();
        });
    });
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;
        upload.render({
            elem: '#test10'
            , url: '/global/postimage'
            , auto: false
            , bindAction: 'btn-danger'
            , choose: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）直接将图片地址赋值给img的src属性
                });
            }
        });
    });

</script>
<script>
    $(function () {
        $("#accepted_answer").keyup(function () {
            var len = $(this).val().length;
            if (len > 99) {
                $(this).val($(this).val().substring(0, 100));
                $("#word").text(0);
            }
            var num = 100 - len;
            if (num < 0) {
                layer.msg('不能再写了哦');
                return false;
                $("#word").text(0);
            } else {
                $("#word").text(num);
            }
        });
    });

</script>
</body>
</html>
