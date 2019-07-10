$(function () {
    var upload = layui.upload;
    $(".bg-setting").click(function () {

        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['420px', '240px'], //宽高
            content: '<div class="layui-upload">' +
                '  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>' +
                '  <button type="button" class="layui-btn" id="test9">开始上传</button>' +
                '</div>'
        });
        upload.render({
            elem: '#test8'
            , url: '/upload/updatebg/'
            , auto: false
            //,multiple: true
            , bindAction: '#test9'
            , done: function (data) {

                if (data.state === 1) {
                    $(".bg-top").css("background", "url(" + data.data.src + ") no-repeat 0 0");
                    layer.closeAll('page');
                } else if (data.state === 0) {
                    layer.msg("系通出错！更换失败", { //layui弹出层提示
                        offset: '150'
                    });
                } else if (data.state === 2) {
                    layer.msg("请您先登录", {
                        offset: '150',
                        time: 800
                    }, function () {
                        $('#denglu').trigger("click");
                    });
                }
            }
        });
    });
    $("#replacehead1").click(function () {
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['420px', '240px'], //宽高
            content: '<div class="layui-upload">' +
                '  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>' +
                '  <button type="button" class="layui-btn" id="test9">开始上传</button>' +
                '</div>'
        });
        upload.render({
            elem: '#test8'
            , url: '/user/uploadThumbnail/'
            , auto: false
            //,multiple: true
            , bindAction: '#test9'
            , done: function (data) {

                if (data.state === 1) {
                    $("#replacehead").css({
                        "background": "url(" + data.data.src + ")",
                        "background-size": "100% 100%"
                    });
                    layer.closeAll('page');
                } else if (data.state === 0) {
                    layer.msg("系通出错！更换失败", { //layui弹出层提示
                        offset: '150'
                    });
                } else if (data.state === 2) {
                    layer.msg("请您先登录", {
                        offset: '150',
                        time: 800
                    }, function () {
                        $('#denglu').trigger("click");
                    });
                }
            }
        });

    });
});

layui.use('form', function(){
    var form = layui.form;
    //监听提交
    form.on('submit(updatepassword)', function(data){
        $.post("/user/updatepassword",data.field,function (data) {
            if(data === 1){
                layer.msg("修改成功",{
                    icon:1,
                    time:800
                },function () {
                    window.location.reload();
                })
            }else if(data === 2){
                layer.msg("修改失败！系统出错",{
                    icon:2
                })
            }else  if(data === 0){
                layer.msg("您输入的原密码不正确，请重新输入",{
                    icon:2
                })
            }
        });
        return false;
    });
    var uid= $("#user_id").val();
        form.on('switch(switchTest)', function(data){
            $.post("/user/saveUserSetting",{uid:uid,sname:data.elem.name,state:data.elem.checked},function (data) {

            })
        });
});
    function updateuser(uid) {
        layer.open({
            title: '修改个人资料',
            type: 2,
            area: ['450px', '600px'],
            fixed: true, //不固定
            maxmin: false,
            content: '/user/update?uid=' + uid
        });
    }
    function updateuser_m(uid) {
        var index = layer.open({
            title: '修改个人资料',
            type: 2,
            area: ['100%', '100%'],
            fixed: true, //不固定
            maxmin: false,
            content: '/user/update?uid=' + uid
        });
        layer.full(index);
    }