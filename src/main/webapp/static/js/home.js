layui.use('util', function(){
    var util = layui.util;
    //执行
});
function getNewPost() {
    layui.use('flow', function () {
        var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var flow = layui.flow;
        var util = layui.util;
        var postImg;
        flow.load({
            elem: '#NewPost' //指定列表容器
            , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/getpostlist?page=' + page, function (res) {
                    //假设你的列表返回在data集合中
                    layui.each(res.date, function (index, item) {
                        if(item.coverImage!=null){
                            postImg = '<div class="layui-hide-xs">' +
                                '<a href="postdetails?postlistId=' + item.id + '" target="_blank" class="thumbnail" style="width: 93%;height: 100%">' +
                                '<img style="max-height: 100%;width:100%;height:100%' +
                                '" src="'+item.coverImage+'" alt="...">'+
                                '</a> ' +
                                '</div>'
                        }else {
                            postImg = '';
                        }
                        if(item.state ==1){
                            lis.push('' +
                                '<div class="contentbox layui-row" style="height: 120px;margin:0 auto;border-bottom: 1px solid #f4f5f7;">' +
                                ' <a class="layui-col-xs12 layui-col-md9" href="postdetails?postlistId=' + item.id + '"  target="_blank" style="display: block">' +
                                '        <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" style="float: left">' +
                                '            <ul class="list-group" style="border: none">' +
                                '                <li class="list-group-item" style="text-overflow:ellipsis;overflow: hidden"><span class="titlebox" style="font-size: 20px;white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;font-weight: bolder;">' + item.title + '</span></li>' +
                                '                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden">' +
                                '               <span style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 10px">'+item.synopsis+'</span></li>' +
                                '                <li class="list-group-item span1">' +
                                '                    <span style="margin: 0;vertical-align: middle;">' +
                                '                        <img class="layui-circle" border="1px red" width="22px" height="22xp" src="' + item.user.headshot + '">' +
                                '                        ' + item.user.username + ' ' +
                                '                    </span>' +
                                '                    <span>发表于：'+ util.toDateString(item.createTime,'yyyy-MM-dd HH:mm') +'</span>' +
                                '                    <span>'+item.category.name+'</span>' +
                                '                    <span><i class="fa fa-eye"></i>  ' + item.browse + '</span>' +
                                '                    <span><i class="fa fa-thumbs-o-up"></i>  ' + item.collectCount + '</span>' +
                                '                    <span><i class="fa fa-commenting"></i>  ' + item.replynumber + '</span>' +
                                '                </li>' +
                                '            </ul>' +
                                '        </div>' +
                                '       </a>' +
                                '        <div class="layui-hide-xs layui-col-md3 layui-col-sm3" style="width:22%;height: 100%;margin-left:15px;float: left;padding: 8px">' +
                                ''+postImg+'' +
                                '        </div>' +
                                '    </div>' +
                                '');
                        }

                    });
                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.pages);
                });
            }
        });
    });
}
function getPopularPost(){

    layui.use('flow', function () {
        var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var flow = layui.flow;
        var util = layui.util;
        var postImg;
        flow.load({
            elem: '#PopularPost' //指定列表容器
            , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/getpostlistBypopular?page=' + page, function (res) {
                    //假设你的列表返回在data集合中
                    layui.each(res.date, function (index, item) {
                        if(item.coverImage!=null){
                            postImg = '<div class="layui-hide-xs">' +
                                '<a href="postdetails?postlistId=' + item.id + '" target="_blank" class="thumbnail" style="width: 93%;height: 100%">' +
                                '<img style="max-height: 100%;width:100%;height:100%' +
                                '" src="'+item.coverImage+'" alt="...">'+
                                '</a> ' +
                                '</div>'
                        }else {
                            postImg = '';
                        }
                        if(item.state ==1){
                            lis.push('' +
                                '<div class="contentbox layui-row" style="height: 120px;margin:0 auto;border-bottom: 1px solid #f4f5f7;">' +
                                ' <a class="layui-col-xs12 layui-col-md9" href="postdetails?postlistId=' + item.id + '"  target="_blank" style="display: block">' +
                                '        <div class="layui-col-xs12 layui-col-sm12 layui-col-md12" style="float: left">' +
                                '            <ul class="list-group" style="border: none">' +
                                '                <li class="list-group-item" style="text-overflow:ellipsis;overflow: hidden"><span class="titlebox" style="font-size: 20px;white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;font-weight: bolder;">' + item.title + '</span></li>' +
                                '                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden">' +
                                '               <span style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 10px">'+item.synopsis+'</span></li>' +
                                '                <li class="list-group-item span1">' +
                                '                    <span style="margin: 0;vertical-align: middle;">' +
                                '                        <img class="layui-circle" border="1px red" width="22px" height="22xp" src="' + item.user.headshot + '">' +
                                '                        ' + item.user.username + ' ' +
                                '                    </span>' +
                                '                    <span>发表于：'+ util.toDateString(item.createTime,'yyyy-MM-dd HH:mm') +'</span>' +
                                '                    <span>'+item.category.name+'</span>' +
                                '                    <span><i class="fa fa-eye"></i>  ' + item.browse + '</span>' +
                                '                    <span><i class="fa fa-thumbs-o-up"></i>  ' + item.collectCount + '</span>' +
                                '                    <span><i class="fa fa-commenting"></i>  ' + item.replynumber + '</span>' +
                                '                </li>' +
                                '            </ul>' +
                                '        </div>' +
                                '       </a>' +
                                '        <div class="layui-hide-xs layui-col-md3 layui-col-sm3" style="width:22%;height: 100%;margin-left:15px;float: left;padding: 8px">' +
                                ''+postImg+'' +
                                '        </div>' +
                                '    </div>' +
                                '');
                        }

                    });
                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.pages);
                });
            }
        });
    });
}
$("#clicknewpost").click();
// getNewPost();
/*公告点击事件*/
$(".notice").click(function () {
    var nid = $(this).attr("id");
    var title = $(this).text();
    var index = layer.open({
        type: 2,
        title :'友人公告-'+title,
        content: '/notice/detail?nid='+nid,
        area: ['700', '100%'],
        maxmin: false
    });
    layer.full(index);
});