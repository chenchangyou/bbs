<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>websocket</title>
    <%@include file="/common/style.jsp"%>
</head>

<body>
<div style="width: 700px;margin: 50px auto;border:1px #1E9FFF solid;">
    <hr/>
        <div style="width: 600px;height: 500px;border:1px red solid;overflow: auto">
            <div id="message"></div>
        </div>
    <hr>
    <input id="text" type="text"/>
    <button onclick="send()">发送消息</button>
    <button onclick="closeWebSocket()">关闭WebSocket连接</button>

</div>
</body>
<script type="text/javascript">
        var websocket = null;
       //判断当前浏览器是否支持WebSocket
        if ('WebSocket' in window) {
            websocket = new WebSocket("ws://localhost:8080/websocket");
        } else {
            alert('当前浏览器 Not support websocket')
        }
      //连接发生错误的回调方法

        websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
        };
        //连接成功建立的回调方法
        websocket.onopen = function () {
            setMessageInnerHTML("WebSocket连接成功");
            }

      //接收到消息的回调方法
       websocket.onmessage = function (event) {
               setMessageInnerHTML(event.data);
            }

      //连接关闭的回调方法
        websocket.onclose = function () {
               setMessageInnerHTML("WebSocket连接关闭");
        }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
     window.onbeforeunload = function () {
              closeWebSocket();
           }

     //将消息显示在网页上
      function setMessageInnerHTML(innerHTML) {
           document.getElementById('message').innerHTML += innerHTML + '<br/>';
           }

     //关闭WebSocket连接
      function closeWebSocket() {
            websocket.close();
          }

      //发送消息
      function send() {
          var message = document.getElementById('text').value;
               websocket.send(message);
               $("#text").val("");
        }
    </script>

</html>
