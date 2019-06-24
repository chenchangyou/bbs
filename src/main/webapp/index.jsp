<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<!DOCTYPE html>
<head>
    <title>欢迎来到友人论坛</title>
    <style>
        .loader {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background: url('https://img-blog.csdn.net/20161205162919763') 50% 50% no-repeat rgb(249, 249, 249);
        }
    </style>
</head>
<body onload="load()">


<div id="loading" class="loader">
</div>
<!--你的内容-->

</body>
<script type="text/javascript">
    function load() {
        $("#loading").fadeOut("slow");
    }
</script>

<script>
    location.href = "home";
</script>
</html>
