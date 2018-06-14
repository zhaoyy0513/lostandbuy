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
    <link rel="stylesheet" href="../../css/font-awesome.min.css" />
    <!-- jquery -->
    <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
    <!-- bootstrap -->
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />

    <link rel="stylesheet" href="../../css/bootstrap-select.css" />
    <script type="text/javascript" src="../../js/bootstrap-select.js"></script>

    <link rel="stylesheet" href="../../css/Releasethings.css" />
    <!-- 图片上传即使预览插件 -->
    <link rel="stylesheet" href="../../css/fileinput.min.css" />
    <script type="text/javascript" src="../../js/fileinput.min.js"></script>
    <script type="text/javascript" src="../../js/zh.js"></script>
    <title>更新物品</title>
    <style>
        .form-control{
            display: inline;
        }
    </style>
    <!-- 下面的代码以后改
    <script type="text/javascript">
        $(document).ready(function(){
            var catelogId = "${modifiedThing.cid}";
            var placeId ="${modifiedThing.taddress}";
            var timeId = "${modifiedThing.ttime}";
            //根据值让option选中
            $("#category option[value='"+catelogId+"']").attr("selected","selected");
            $("#place option[value='"+placeId+"']").attr("selected","selected");
            $("#time option[value='"+timeId+"']").attr("selected","selected");
        });
    </script>
    -->

</head>
</head>
<body>
    <div class="container">
        <div class="row">
            <div id="lostThing" class="col-md-6">
                <form:form action="/thing/updateThing" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <div class="form-group">
                            <label for="title" class="prompt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;物品名：</label>
                            <input type="text" name="tname" required="required" class="form-control titleInput" id="title" value="${modifiedThing.tname}" />
                        </div>
                        <input type="hidden" name="tid" value="${modifiedThing.tid}">
                        <input type="hidden" name="UId" value="${modifiedThing.UId}">
                        <div class="form-group">
                            <label for="category">丢失/捡到的物品种类：</label>
                            <select id="category" name="cid" class="selectpicker" title="请输入物品类型">
                                <option value="1" <c:if test="${modifiedThing.cid==1}">selected="selected"</c:if>  >手机/充电宝</option>
                                <option value="2" <c:if test="${modifiedThing.cid==2}">selected="selected"</c:if>  >书籍/眼镜</option>
                                <option value="3" <c:if test="${modifiedThing.cid==3}">selected="selected"</c:if>  >卡类</option>
                                <option value="4" <c:if test="${modifiedThing.cid==4}">selected="selected"</c:if>  >钥匙/优盘</option>
                                <option value="5" <c:if test="${modifiedThing.cid==5}">selected="selected"</c:if>  >学习用品</option>
                                <option value="6" <c:if test="${modifiedThing.cid==6}">selected="selected"</c:if>>伞/衣服</option>
                                <option value="7" <c:if test="${modifiedThing.cid==7}">selected="selected"</c:if>>其他</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="place">丢失/捡到物品的地点：</label>
                            <select id="place" name="taddress" class="selectpicker" title="请输入地点">
                                <option value="1" <c:if test="${modifiedThing.taddress==1}">selected="selected"</c:if>  >宿舍区</option>
                                <option value="2" <c:if test="${modifiedThing.taddress==2}">selected="selected"</c:if>  >教学楼</option>
                                <option value="3" <c:if test="${modifiedThing.taddress==3}">selected="selected"</c:if>  >餐厅</option>
                                <option value="4" <c:if test="${modifiedThing.taddress==4}">selected="selected"</c:if>  >操场</option>
                                <option value="5" <c:if test="${modifiedThing.taddress==5}">selected="selected"</c:if>  >图书馆</option>
                                <option value="6" <c:if test="${modifiedThing.taddress==6}">selected="selected"</c:if>  >校园周围</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="time">丢失/捡到物品的时间：</label>
                            <select id="time" name="ttime" class="selectpicker" title="请输入时间">
                                <option value="1" <c:if test="${modifiedThing.ttime==1}">selected="selected"</c:if>  >一天之内</option>
                                <option value="2" <c:if test="${modifiedThing.ttime==2}">selected="selected"</c:if>  >三天之内</option>
                                <option value="3" <c:if test="${modifiedThing.ttime==3}">selected="selected"</c:if>  >一周之内</option>
                                <option value="4" <c:if test="${modifiedThing.ttime==4}">selected="selected"</c:if>  >两周之内</option>
                                <option value="5" <c:if test="${modifiedThing.ttime==5}">selected="selected"</c:if>  >一个月之内</option>
                                <option value="6" <c:if test="${modifiedThing.ttime==6}">selected="selected"</c:if>  >三个月之内</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label  for="connection" class="prompt">联系方式：</label>
                            <input type="text" id="connection" name="utelephone" class="form-control "  value="${modifiedThing.utelephone}" />
                        </div>
                        <div class="form-group">
                            <label for="description" id="description_text" class="prompt">详细描述：</label>
                            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <textarea name="tdescription" required="required" class="form-control" id="description" cols="10">${modifiedThing.tdescription}</textarea>
                        </div>
                        <div class="form-group">
                            <label class="prompt">上传图片：</label>
                            <input type="file" name="myfile" class="col-sm-10 myfile" data-ref="iurl" id="file0" value="" />
                            <input type="text" name="iurl" value="">
                        </div>
                        <br />
                        <div class="form-group" id="last">
                            <input class="btn btn-info" type="submit" onclick="popInfo()" value="提交修改" />
                        </div>
                    </fieldset>
                </form:form>
            </div>
        </div>
    </div>

  <script>
      function popInfo() {
          alert("修改成功,请返回个人中心查看(图片加载可能会有延迟)！");
      }

  </script>



<script>
    $(".myfile").fileinput({
        language : 'zh',
        uploadUrl:"<%=basePath%>thing/uploadFile",//上传的地址
        uploadAsync:true, //默认异步上传
        showUpload: true, //是否显示上传按钮,跟随文本框的那个
        showRemove : true, //显示移除按钮,跟随文本框的那个
        showCaption: true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled: true,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 3, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        allowedFileTypes: ['image'],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ]//控制被预览的所有mime类型

    })
    //异步上传返回结果处理
    $('.myfile').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $(".myfile").on("fileuploaded", function (event, data, previewId, index) {
        console.log("fileuploaded");
        var ref=$(this).attr("data-ref");
        $("input[name='"+ref+"']").val(data.response.iurl);
    });

    //同步上传错误处理
    $('.myfile').on('filebatchuploaderror', function(event, data, msg) {
        console.log("filebatchuploaderror");
        console.log(data);
    });

    //同步上传返回结果处理
    $(".myfile").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        console.log("filebatchuploadsuccess");
        console.log(data);
    });

    //上传前
    $('.myfile').on('filepreupload', function(event, data, previewId, index) {
        console.log("filepreupload");
    });
</script>

<script>
    window.onload = IFrameResize;
    function IFrameResize() {
        var obj = parent.document.getElementById("icontent"); //取得父页面IFrame对象
        obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度
    } //设置加载页面的高度
</script>
</body>
</html>