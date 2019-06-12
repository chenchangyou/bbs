<link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
<link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${ctx}/static/css/mycss.css" rel="stylesheet">
<script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/myjs.js" type="text/javascript"></script>
<script>
    $(function () {
        //由于模块都一次性加载，因此不用执行 layui.use() 来加载对应模块，直接使用即可：
        ;!function(){
            var layer = layui.layer
                ,form = layui.form
                ,carousel = layui.carousel
                ,$ = layui.jquery;

            //建造实例
            carousel.render({
                elem: '#test1'
                ,width: '100%' //设置容器宽度
                ,arrow: 'hover' //始终显示箭头
                // ,anim: 'updown' //切换动画方式
                ,height:"330px"
                ,autoplay:"false"
            })
        }();
    })
</script>
<script>
    function load() {
        $("#loading").fadeOut("slow");
    }
</script>
<style>
    .divs{
        position:absolute;
        top: 35%; left:50%;
        transform: translate(-50%, -50%);
        text-align: center ;
        width: 150px;line-height: 60px;
        font-size: 12px;
        z-index: 999999;
        color:#ffffff;
        background-color: rgba(41, 41, 41, 0.85);
    }
    .navbar-nav li:hover{
        background: rgba(0,0,0,0.1);
    }
    .loader {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 9999;
        background: url('https://img-blog.csdn.net/20161205162919763') 50% 50% no-repeat rgb(249,249,249);
    }
</style>
