<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>发表新帖</title>
    <%@include file="../../common/style.jsp"%>
</head>
<body>
<%@include file="../../common/head.jsp"%>
           <div style="width: 1180px;margin: 65px auto">
               <ol class="breadcrumb">
                   <li><a href="${ctx}/jsp/index.jsp">首页</a></li>
                   <li class="active">发表新帖</li>
               </ol>
               <h2>${error}</h2>
               <a href="javascript:history.back(-1)" style="width: 180px;margin: 0 auto;" class="btn btn-warning">返回编辑页</a>
           </div>
</body>
</html>
