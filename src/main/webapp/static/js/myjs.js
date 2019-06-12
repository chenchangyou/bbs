$(document).ready(function () {

    $(window).scroll(function () {
        // 200是header的高度
        if ($(document).scrollTop() >= 387) {
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
                        top: '60px'
                    })
                }
            }
        } else if ($(document).scrollTop() < 387) {
            $('.articlelist').css({
                position: 'static'
            });
        }
    });
});

