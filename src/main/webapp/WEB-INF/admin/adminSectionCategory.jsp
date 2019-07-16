<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>版块专区</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/mycss.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js" type="text/javascript"></script>
    <style>
        .sectionbody {
            text-align: center;
            margin-left: 50px;
        }
        .sectionbg{
            background-color: #f2f2f2;
        }
        .sectionbg:hover{
            background-color: rgba(222, 222, 222, 0.04);
        }
        .breadcrumb{
            margin-bottom: 5px;
            background-color: #FFFFFF;
        }
        a:hover{
            text-decoration: none;
            color: cornflowerblue;
        }
        a:link{
            text-decoration: none;
            /*color: #000000;*/
        }
        a:visited{
            /*color: #000000;*/
        }

         #footer {
             clear: both;
             width: 100%;
             height: 150px;
             background: #494949;
         }

        .list-group {
            display: block;
        }

        .list-group li {
            border: none;
            padding: 4px 14px;
            display: block;
        }

        .span1 span {
            margin-left: 25px;
            color: #A9A9A9;
            font-size: 10px;
        }

        .contentbox {
            display: block;
            background-color: #FFFFFF;
        }

        .contentbox:hover .titlebox {
            color: #3461ff;
        }

        .contentbox:hover {
            cursor: pointer;
        }
        .sectionback{
            background-color: rgba(30, 159, 255, 0.5);
            color: #ffffff;
        }

    </style>
</head>
<body>


    <blockquote class="layui-elem-quote " style="background-color: #FFFFFF;margin-bottom: 5px">版块下的类型 (<span style="color: red" id="number"></span>)
        <button type="button" class="layui-btn layui-btn-sm" id="addcaregory" data-type="addRow">
            <i class="layui-icon layui-icon-add-1"></i> 添加类型
        </button>
    </blockquote>
    <div class="layui-col-md12">
        <c:forEach items="${section.sectionCategory}" var="category">
            <button id="${category.id}" type="button" class="layui-btn category">${category.name}</button>
        </c:forEach>
        <c:if test="${empty section.sectionCategory}">
            <p>暂无类型</p>
        </c:if>
    </div>

    <div class="layui-row" id="Section" style="background-color: #ffffff; overflow: auto;min-height: 20%;max-height: 60%;padding: 5px">

    </div>
<script>

    layui.use(['laypage', 'layer','util'], function () {
        var laypage = layui.laypage
             ,layer = layui.layer
              ,util = layui.util;

        $(function () {


        });

    });
    $(function () {
        getSection();
    });
    function getSection() {
        $.get("/section/getAllSection",function (data) {
            var content="";
            var number = 0;
            for (var i=0;i<data.length ;i++){
                number++;
                content+="" +
                "<div class=\"layui-col-md2 sectionbody\">\n" +
                "            <a class='thisSection' id='"+data[i].id+"' href='javascript:'\">\n" +
                "            <div class=\"panel panel-default\">\n" +
                "                <div class=\"panel-body sectionbg\">\n" +
                "                   "+data[i].name+" <span class=\"layui-badge\">  "+data[i].sectionCategory.length+"</span>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "            </a>\n" +
                "        </div>"
            }
            $("#Section").html(content);
            $("#number").text(number+"个");
        });
    }
    $(function () {
        $("#addcaregory").click(function () {
            var sectionId=${section.id};
            layer.prompt({
                    title: '请输入类型名称'},
                function(val, index){
                    $.post("/section//addcategory",{cname:val,sectionId:sectionId},function (date) {
                        if(date != null ){
                            layer.msg("添加成功！",{
                                time:800
                            },function () {

                            })
                        }else {
                            layer.msg('添加失败', {
                                offset: '150',
                                icon: 2
                            });
                        }
                    });
                    layer.close(index);
                });
        })
    });
    $(function () {

        $('#Section').on("click",".sectionbg",function(){
            var $this = $(this);
            var id = $this.attr("id");
            // layer.msg("id为"+$this.attr("id"));

            /*$("#Section").siblings('.sectionbg').removeClass('sectionback');
            $this.addClass('sectionback');
*/
            /*$.ajax({
                url: '/user/album/add/',
                data: {
                    uid:uid,
                    url:res.data.src,
                    acid:elemid
                },
                type: 'post',
                dataType: 'json',
                beforeSend: function () {
                    $("#load").remove();
                    $this.parent().prev().append('<div id="load" style="position: relative;top:30%;z-index:999999;background:url(/static/images/transition.gif) top center no-repeat;width:100%;height:140px;margin:auto auto;"></div>');

                },
                complete: function () {
                    $this.parent().prev().append('<div id="load" style="position: relative;top:30%;z-index:999999;background:url(/static/images/transition.gif) top center no-repeat;width:100%;height:140px;margin:auto auto;"></div>');
                    $("#load").remove();
                },
                success:function(state){
                    $("#load").remove();
                    $this.parent().prev().prepend('<img layer-pid="'+state.id+'" layer-src="'+state.url+'" src="'+state.url+'" alt="'+state.createTime+'">')
                    layer.msg('上传成功');
                    ind.readable()
                },
                error:function(){
                    $("#load").remove();
                }
            });*/
        });

    })
</script>

</body>
</html>
