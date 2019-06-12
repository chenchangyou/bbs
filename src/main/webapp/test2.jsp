<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DIV模块随着页面固定和不固定随意切换</title>
</head>
<style>
    header {
        width: 100%;
        height: 200px;
        background: #FFA500;
    }
    #container .article {
        width: 1200px;
        margin: 0 auto;
        overflow: hidden;
    }
    #container .article .articlebox {
        overflow: hidden;
        position: relative;
    }
    #container .article .articlebox .articlelist {
        width: 330px;
        height: 560px;
        background: #8A2BE2;
        float: left;
    }
    #container .article .articlebox .articledetail {
        width: 770px;
        height: 1560px;
        background: #FFB6C1;
        float: right;
    }
    #footer {
        width: 100%;
        height: 500px;
        background: #6495ED;
    }#footer {
         width: 100%;
         height: 500px;
         background: #6495ED;
     }
</style>

<body>
<header>
</header>
<div id="container">
    <div class="article">
        <div class="articlebox">
            <div class="articlelist" style="bottom: auto;top: 0;">
            </div>
            <div class="articledetail">
            </div>
        </div>
    </div>
</div>
<div id="footer"></div>
</body>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
    /**
     * Created by Administrator on 2019/01/18.
     */
    $(document).ready(function () {

        $(window).scroll(function () {
            // 200是header的高度
            if ($(document).scrollTop() >= 200) {
                $('.articlelist').css({
                    position: 'fixed'
                });
                // 判断左边div块的距离滚动条顶部的距离 + 左div块的高度 >= 右边文章详情距滚动条顶部的距离 + 详情页的高度
                if (($('.articlelist').offset().top + $('.articlelist').height()) >= ($('.articledetail').offset().top + $('.articledetail').height())) {
                    // 改变div块的bottom  top设为auto
                    $('.articlelist').css({
                        bottom: ($(window).height() + $(document).scrollTop() - $('#footer').offset().top) + 'px',
                        top: 'auto'
                    })
                    // 判断左边div块的距离滚动条顶部的距离 + 左div块的高度 < 右边文章详情距滚动条顶部的距离 + 详情页的高度
                } else if ((($('.articlelist').offset().top + $('.articlelist').height()) < ($('.articledetail').offset().top + $('.articledetail').height()))) {
                    $('.articlelist').css({
                        bottom: ($(window).height() + $(document).scrollTop() - $('#footer').offset().top) + 'px',
                        top: 'auto'
                    })
                    if (($(window).height() + $(document).scrollTop() - $('#footer').offset().top) <= $(window).height() - $('.articlelist').height()) {
                        $('.articlelist').css({
                            bottom: 'auto',
                            top: '80px'
                        })
                    }
                }
            } else if ($(document).scrollTop() < 200) {
                $('.articlelist').css({
                    position: 'static'
                });
            }
        });
    })
</script>

</html>
