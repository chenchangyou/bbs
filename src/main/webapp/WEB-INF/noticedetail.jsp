<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@include file="../common/javascript.jsp"%>
</head>
<body>
<div class="admin-global" style="max-width: 1100px;margin: 0 auto">
<form class="layui-form" action="">
    <input value="${notice.nid}" name="nid" type="hidden">
    <input value="${loginUser.id}" name="uid" type="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input value="${notice.title}" type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea id="editText" name="content" placeholder="请输入内容" class="layui-textarea">${notice.content}</textarea>
        </div>
    </div>
    <div style="text-align: right" class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    //Demo
    var index = parent.layer.getFrameIndex(window.name);
    layui.use(['form','layedit'], function(){
        var form = layui.form;
        var layedit = layui.layedit;

        //建立编辑器
        var index =layedit.build('editText',{
            uploadImage: {url: 'http://119.23.52.230/SSM/uploads/', type: 'post'}
        });
        //监听提交
        form.on('submit(formDemo)', function(data){

            var nid = data.field.nid;
            var uid = data.field.uid;
            var title = data.field.title;
            var content = layedit.getContent(index);

            $.post("/admin/notice/add"
                ,{nid:nid,uid:uid,title:title,content:content}
                ,function (data) {
                if(data!=null&&data!=""){
                    parent.layer.msg('保存成功！', {
                        icon: 1,
                        time: 1000 //1秒关闭（如果不配置，默认是3秒）
                    },function () {
                        parent.layer.close(index);
                        parent.location.reload();
                    });
                }else {
                    layer.msg("保存失败！",{
                        icon: 2
                    })
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
