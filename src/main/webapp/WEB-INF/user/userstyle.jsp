<style>
    body {
        background-color: #F4F5F7;
    }

    .layui-nav .layui-nav-item a {
        color: #3b3b3b;
        font-size: 14px;
    }

    /*.layui-nav li{
        float: left;
    }*/
    .layui-nav .layui-nav-item a i {
        line-height: 20px;
    }

    .layui-nav .layui-nav-item a:hover {
        color: rgba(29, 131, 255, 0.88);
        /*font-weight: bolder;*/
        text-decoration: none;
    }
    .bg-setting{
        background-color: rgba(0,0,1,0.2);
        text-align: center;
        width: 110px;
        line-height: 28px;
        border: 1px solid hsla(0,0%,100%,.3);
        border-radius: 25px;
        color: #c3c3c3;
        display:none ;
    }
    .bg-setting:hover{
        background-color: rgba(0,0,1,0.4);
        color: #f4fcff;
    }
    a:hover{
        text-decoration: none;
        /*color: cornflowerblue;*/
    }
    a:link{
        text-decoration: none;
        /*color: #000000;*/
    }
    a:visited{
        /*color: snow;*/
    }
    .bg-top:hover .bg-setting{
        display:block;
    }
    .layui-upload{
        margin: 10px auto;
    }
    #user_bg{

    }
    .bg-top{
        width: 100%;
        height: 280px;
        padding-top: 180px;
        background-size: 100% 100%;
    <c:if test="${not empty userbg}">
        background-image: url('${userbg.url}');
    </c:if>
    <c:if test="${empty userbg}">
        background-image: url('../../static/images/userback.png');
    </c:if>

    }
    #replacehead{
        border-radius: 52px;
        width: 65px;
        height: 65px;
        display: block;
    }
    .replace_bg{
        text-align: center;
        line-height: 65px;
        border-radius: 52px;
        font-size: 12px;
        width:100%;
        height:100%;
        color: #dadada;
        background-color: rgba(0,0,1,0.4);
        display: none;
    }
    .postmsg{
        width: 100%;
    }
    .postmsg span{
        min-width: 50px;

    }
    .postmsg >.post_r{
        min-width: 80px;
        float: right;
        display: none;
    }
    .list-group-item:hover .postmsg >.post_r{
        display: block;
    }
    #replacehead:hover .replace_bg{
        display: block;
    }
    .left_boxs span{
        margin-left: 5px;
    }
</style>