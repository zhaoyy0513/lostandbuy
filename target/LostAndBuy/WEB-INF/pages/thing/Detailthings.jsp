<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <!-- jquery -->
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <!-- bootstrap -->
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />

    <link rel="stylesheet" href="../css/Releasethings.css" />
    <!-- 图片上传即使预览插件 -->
    <title>寻物启事->发布启事</title>
    <style>
        .form-control{
            display: inline;
        }
    </style>

</head>

<body>
<c:if test="${empty cur_user}">
    <p style="text-align: center; margin-top: 100px;">登陆~才能查看详情</p>
</c:if>
<c:if test="${!empty cur_user}">
    <div class="container" style="margin-top: 5%;margin-left: 25%">
        <div class="row">
            <div id="lostThing" class="col-md-6">
                <form:form action="#" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <div class="form-group">
                            <label for="title" class="prompt">&nbsp;&nbsp;&nbsp;&nbsp;物品名：</label>
                            <input type="text" disabled="disabled" class="form-control titleInput" id="title" value="${thingExtend.thing.tname}" />
                        </div>
                        <div class="form-group">
                            <label  class="prompt">联系方式：</label>
                            <input type="text" disabled="disabled" class="form-control " value="${thingExtend.thing.utelephone}" />
                        </div>
                        <div class="form-group">
                            <label for="description" id="description_text" class="prompt">详细描述：</label>
                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <textarea disabled="disabled" class="form-control" id="description" cols="10">${thingExtend.thing.tdescription}</textarea>
                        </div>
                        <div class="form-group">
                            <label class="prompt">图片：</label>
                            <div id="picDetail" style="border:1px dotted red;">
                                <img style="width: 100%; height:500px ;" src="../../upload/${thingExtend.image[0].iurl}">
                            </div>
                        </div>
                        <br />
                    </fieldset>
                </form:form>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>