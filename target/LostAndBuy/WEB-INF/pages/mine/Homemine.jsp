<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhaoyy_PC
  Date: 2018/6/9
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <!--引用bootstrap的CSS文件-->
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <!--引用jQuery文件-->
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <!--引用jquery-ui文件-->
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/search.css"/>
    <link rel="stylesheet" href="../css/Homemine.css"/>
    <script type="text/javascript" src="../js/Homemine.js"></script>

    <!--引用bootstrap的JS文件-->
</head>
<body>
        <c:if test="${empty cur_user}">
            <p style="text-align: center; margin-top: 100px;">登陆~才能查看信息</p>
        </c:if>

        <c:if test="${!empty cur_user}">
            <div id="info_title">我的信息</div>
            <hr color="#f00">

            <div class="my_info">
                <form:form method="post" action="/user/updateInfo">
                <div>
                    <div>
                        用户名:<input type="text" name="uname" value="${cur_user.uname}">
                    </div>
                    <div>
                        手机号:<input type="text" pattern="^1[0-9]{10}$" name="utelephone" value="${cur_user.utelephone}">
                    </div>
                    <div>
                        密&nbsp&nbsp&nbsp码: <input type="text"  name="upassword" placeholder="不填此栏表不修改密码">
                    </div>
                    <input type="hidden" value="${cur_user.uid}" name="uid">
                    <div>
                        <button type="submit" class="btn btn-primary" onclick="">提交修改</button>
                    </div>
                </div>
                </form:form>
            </div>

            <hr color="#f00">
            <div id="info_title">我的物品</div>
            <hr color="#f00">
            <div class="row">
                <div class="filtr-container">
                    <c:forEach items="${thingList}" var="t">
                        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2 filtr-item" style="margin-left: 30px">
                            <a href="<%=basePath%>thing/detailThing/${t.thing.tid}">
                                <img class="thingIcon" class="img-responsive" src="../../upload/${t.image[0].iurl}" alt="sample image">
                                <span class="item-desc">${t.thing.tname}</span></a>
                            <a href="<%=basePath%>user/deleteThing/${t.thing.tid}" onclick="return confirm('确定删除物品吗?');" ><img title="删除物品" alt="删除物品" src="../img/delete1.png" class="deleteIcon"></a>
                            <a href="<%=basePath%>thing/toUpdateThing/${t.thing.tid}" onclick="return confirm('确定修改物品吗?');" ><img style="width: 25px;height: 25px; position: relative;bottom: 32px;left: 154px" title="修改物品信息" alt="修改物品信息" src="../img/modify.png" class="updateIcon"></a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>


</body>
</html>
