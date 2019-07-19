<!--
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>邮件模板</title>
</head>
<body>
<h1 style="color:darkmagenta;">你好，</h1>
<h3 style="color: red;">你的验证码：</h3>
</body>
</html>-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>邮件验证码</title>
    　　
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--<script type="text/javascript">-->
    <!--//        var para = function () {-->
    <!--//        }-->
    <!--var url = document.location.toString();-->
    <!--var arrUrl = url.split("?");-->
    <!--var para = arrUrl[1];-->
    <!--alert('===='+url);-->
    <!--</script>-->
</head>

<body style="margin: 0; padding: 0;">

<table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">

    　
    <tr>
        <td>
            <div style="margin: 20px;text-align: center;margin-top: 50px">
<#--                <img src="https://cxbres.oss-cn-beijing.aliyuncs.com/CTSP/mail/header/20180904115147.png" border="0" style="display:block;width: 100%;height: 100%">-->
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div style="border: #36649d 1px dashed;margin: 30px;padding: 20px">
                <label style="font-size: 22px;color: #36649d;font-weight: bold">欢迎来到友人论坛！</label>
               <#-- <p style="font-size: 16px">亲爱的&nbsp;<label style="font-weight: bold"> 先生/女士</label>&nbsp; 您好！欢迎加入xxx。
                </p>-->
              <#--  <p style="font-size: 16px">您已于2018年10月1日充值成功，希望更好的为您服务！</p>-->
                <p>尊敬的：“<span style="color: #0cc1f7">${username}</span>” 你好</p>
                <p>你的验证是：<span style="color: red">${validCode}</span></p>
            </div>
        </td>
    </tr>
    　
    <tr>
        <td>
            <div style="margin: 40px">
                <#--<p style="font-size: 16px">xxx管理团队</p>-->
                <p style="color:red;font-size: 14px ">（这是一封自动发送的邮件，请勿回复。）</p>

            </div>
        </td>
    </tr>

    <!--<tr>-->
    <!--<td>-->
    <!--<div style="font-size:14px;margin-left: 30px;margin-right: 30px;padding: 20px">-->
    <!--<img src="tile-wide.png" alt="" style="width: 100px;height: 100px"/>-->
    <!--<label style="font-size: 12px;display:block;"> 关注公众号了解更多</label>-->
    <!--&lt;!&ndash;<p style="font-size: 12px">&ndash;&gt;-->
    <!--&lt;!&ndash;如有任何问题，可以与我们联系，我们将尽快为你解答。<br/>&ndash;&gt;-->
    <!--&lt;!&ndash;电话：4008-622-333&ndash;&gt;-->
    <!--&lt;!&ndash;</p>&ndash;&gt;-->
    <!--</div>-->
    <!--</td>-->
    <!--</tr>-->

    <tr>
        <td>
            <div align="right" style="margin: 40px;border-top: solid 1px gray" id="bottomTime">
                <p style="margin-right: 20px">友人论坛</p>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
