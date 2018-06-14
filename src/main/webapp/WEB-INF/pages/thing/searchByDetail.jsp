<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>寻物小站->校园寻物</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/search.css" />
    <script type="text/javascript" src="../js/search.js"></script>
    <style>
        .simplefilter1 li a, .simplefilter2 li a, .simplefilter3 li a, .sortandshuffle li a{
            color: white ;
            cursor: pointer;
            text-decoration: none;
        }
    </style>


</head>

<body>
<br />
<div><img id="logoimg2" src="../img/logo3.jpg" /></div>
<div class="input-group retrieva1">
    <form:form action="/thing/search" method="post">
        <input style="width: 400px" type="text" name="info" value="<c:out value="${searchinfo}"/>" required="required" class="form-control" placeholder="请输入需要寻找物品">
        <span class="input-group-btn">
					<button type="submit"  class="btn btn-primary">开始寻物</button>
				</span>
    </form:form>
</div>
<!--搜索框-->
<br />
<div class="container" style="background: #fff;padding: 2em;">
    <div id="ConditionRetrieval" style="margin-left: 20% ">
        <div class="row">
            <ul class="simplefilter1">
                选择发布时间：
                <li value="0" <c:if test="${timeId=='0'}">class="active"</c:if> ><a href="#">不限</a></li>
                <li value="1" <c:if test="${timeId=='1'}">class="active"</c:if> ><a href="#">一天之内</a></li>
                <li value="2" <c:if test="${timeId=='2'}">class="active"</c:if> ><a href="#">三天之内</a></li>
                <li value="3" <c:if test="${timeId=='3'}">class="active"</c:if> ><a href="#">一周之内</a></li>
                <li value="4" <c:if test="${timeId=='4'}">class="active"</c:if> ><a href="#">两周之内</a></li>
                <li value="5" <c:if test="${timeId=='5'}">class="active"</c:if> ><a href="#">一个月之内</a></li>
                <li value="6" <c:if test="${timeId=='6'}">class="active"</c:if> ><a href="#">一个月之上</a></li>
            </ul>
        </div>

        <div class="row">
            <ul class="simplefilter2">
                丢&nbsp;&nbsp;失&nbsp;&nbsp;地&nbsp;&nbsp;点&nbsp;：
                <li value="0" <c:if test="${placeId=='0'}">class="active"</c:if> ><a href="#">不限</a></li>
                <li value="1" <c:if test="${placeId=='1'}">class="active"</c:if> ><a href="#">宿舍区</a></li>
                <li value="2" <c:if test="${placeId=='2'}">class="active"</c:if> ><a href="#">教学楼</a></li>
                <li value="3" <c:if test="${placeId=='3'}">class="active"</c:if> ><a href="#">餐厅</a></li>
                <li value="4" <c:if test="${placeId=='4'}">class="active"</c:if> ><a href="#">操场</a></li>
                <li value="5" <c:if test="${placeId=='5'}">class="active"</c:if> ><a href="#">图书馆</a></li>
                <li value="6" <c:if test="${placeId=='6'}">class="active"</c:if> ><a href="#">校园周边</a></li>
            </ul>
        </div>

        <div class="row">
            <ul class="simplefilter3">
                物&nbsp;&nbsp;品&nbsp;&nbsp;类&nbsp;&nbsp;别&nbsp;：
                <li value="0" <c:if test="${catelogId==0}">class="active"</c:if> ><a href="#">不限</a></li>
                <li value="1" <c:if test="${catelogId==1}">class="active"</c:if> ><a href="#">手机/充电宝</a></li>
                <li value="2" <c:if test="${catelogId==2}">class="active"</c:if> ><a href="#">书籍/眼镜</a></li>
                <li value="3" <c:if test="${catelogId==3}">class="active"</c:if> ><a href="#">卡类</a></li>
                <li value="4" <c:if test="${catelogId==4}">class="active"</c:if> ><a href="#">钥匙/U盘</a></li>
                <li value="5" <c:if test="${catelogId==5}">class="active"</c:if> ><a href="#">学习用品</a></li>
                <li value="6" <c:if test="${catelogId==6}">class="active"</c:if> ><a href="#">伞/衣服</a></li>
                <li value="7" <c:if test="${catelogId==7}">class="active"</c:if> ><a href="#">其他</a></li>
            </ul>
        </div>
    </div>
    <!--条件筛选-->


    <div class="row">
        <div class="filtr-container">
            <c:forEach items="${thingSet}" var="s">
                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2 filtr-item">
                    <a href="#">
                        <img  class="thingIcon" class="img-responsive" src="../upload/${s.image[0].iurl}" alt="sample image">
                        <span class="item-desc">${s.thing.tname}</span></a>
                </div>
            </c:forEach>
        </div>
    </div>




</div>
</body>
</html>
<script>
    $(function () {
        //定义3个变量用来存取状态值
        var time =0;
        var place = 0;
        var catelog = 0;
        var result = 0;
        $('.simplefilter1 li').click(function() {
            time = $(this).val();
            result = time+":"+place+":"+catelog;
            $.ajax({
                type : "get",
                cache : false,
                url : "/thing/complexValue",
                data : {ttime : time,taddress:place,cid:catelog},
                dataType:"json",
                success:function (data) {
                    var json_data = JSON.stringify(data);  //系列化对象(把数据转换成字符串类型)
                    window.location.href= "/thing/searchComplex?aa="+json_data;
                }
            });
        });
        $('.simplefilter2 li').click(function () {
            place = $(this).val();
            result = time+":"+place+":"+catelog;
            $.ajax({
                type : "get",
                cache : false,
                url : "/thing/complexValue",
                data : {ttime : time,taddress:place,cid:catelog},
                dataType:"json",
                success:function (data) {
                    var json_data = JSON.stringify(data);  //系列化对象(把数据转换成字符串类型)
                    window.location.href= "/thing/searchComplex?aa="+json_data;
                }
            });
        });
        $('.simplefilter3 li').click(function () {
            catelog = $(this).val();
            result = time+":"+place+":"+catelog;
            $.ajax({
                type : "get",
                cache : false,
                url : "/thing/complexValue",
                data : {ttime : time,taddress:place,cid:catelog},
                dataType:"json",
                success:function (data) {
                    var json_data = JSON.stringify(data);  //系列化对象(把数据转换成字符串类型)
                    window.location.href= "/thing/searchComplex?aa="+json_data;
                }
            });

        });
    })
</script>