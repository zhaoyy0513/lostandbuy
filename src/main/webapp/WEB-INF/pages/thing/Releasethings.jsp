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
	<link rel="stylesheet" href="../css/font-awesome.min.css" />
	<!-- jquery -->
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<!-- bootstrap -->
	<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		  href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />

	<link rel="stylesheet" href="../css/bootstrap-select.css" />
	<script type="text/javascript" src="../js/bootstrap-select.js"></script>

	<link rel="stylesheet" href="../css/Releasethings.css" />
	<!-- 图片上传即使预览插件 -->
	<link rel="stylesheet" href="../css/fileinput.min.css" />
	<script type="text/javascript" src="../js/fileinput.min.js"></script>
	<script type="text/javascript" src="../js/zh.js"></script>
	<title>寻物启事->发布启事</title>
	<style>
		.form-control{
			display: inline;
		}
	</style>

</head>

<body>
<c:if test="${empty cur_user}">
	<p style="text-align: center; margin-top: 100px;">登陆~才能发布信息</p>
</c:if>
<c:if test="${!empty cur_user}">
	<div class="container">
		<div class="row">
			<div id="lostThing" class="col-md-6">
				<form:form action="/thing/releaseThing" method="post" enctype="multipart/form-data">
					<fieldset>
					<div class="form-group">
						<label for="title" class="prompt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;物品名：</label>
						<input type="text" name="tname" required="required" class="form-control titleInput" id="title" placeholder="输入丢失/捡到的物品名称" />
					</div>
					<div class="form-group">
						<label for="category">丢失/捡到的物品种类：</label>
						<select id="category" name="cid" class="selectpicker" title="请输入物品类型">
							<option value="1">手机/充电宝</option>
							<option value="2">书籍/眼镜</option>
							<option value="3">卡类</option>
							<option value="4">钥匙/优盘</option>
							<option value="5">学习用品</option>
							<option value="6">伞/衣服</option>
							<option value="7">其他</option>
						</select>
					</div>
					<div class="form-group">
						<label for="place">丢失/捡到物品的地点：</label>
						<select id="place" name="taddress" class="selectpicker" title="请输入地点">
							<option value="1">宿舍区</option>
							<option value="2">教学楼</option>
							<option value="3">餐厅</option>
							<option value="4">操场</option>
							<option value="5">图书馆</option>
							<option value="6">校园周围</option>
						</select>
					</div>
					<div class="form-group">
						<label for="time">丢失/捡到物品的时间：</label>
						<select id="time" name="ttime" class="selectpicker" title="请输入时间">
							<option value="1">一天之内</option>
							<option value="2">三天之内</option>
							<option value="3">一周之内</option>
							<option value="4">两周之内</option>
							<option value="5">一个月之内</option>
							<option value="6">三个月之内</option>
						</select>
					</div>
					<div class="form-group">
						<label  class="prompt">联系方式：</label>
						<input type="text" name="utelephone" class="form-control " placeholder="不写默认为当前用户手机号" />
					</div>
					<div class="form-group">
						<label for="description" id="description_text" class="prompt">详细描述：</label>
						<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<textarea name="tdescription" required="required" class="form-control" id="description" cols="10" placeholder="详细描述时间、地点、物品特征等。"></textarea>
					</div>
					<div class="form-group">
						<label class="prompt">上传图片：</label>
						<input type="file" name="myfile" class="col-sm-10 myfile" data-ref="iurl" id="file0" value="" />
						<input type="text" name="iurl" value="">
					</div>
					<br />
					<div class="form-group" id="last">
						<input class="btn btn-info" type="submit" value="确认发布"></input>
					</div>
				</fieldset>
			</form:form>
			</div>
		</div>
	</div>
</c:if>
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
<script>
	function toast(){
        alert("发布成功，请返回个人中心查看!(图片加载可能会有延迟)");
	}
</script>

</body>
</html>