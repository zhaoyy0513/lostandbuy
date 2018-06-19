<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--响应式布局-->
		<title>寻物小站</title>
		<link rel="stylesheet" href="../../css/bootstrap.min.css">
		<!--引用bootstrap的CSS文件-->
		<script src="../../js/jquery-3.1.1.min.js"></script>
		<!--引用jQuery文件-->
		<script src="../../js/jquery-ui.min.js"></script>
		<!--引用jquery-ui文件-->
		<script src="../../js/bootstrap.min.js"></script>
		<!--引用bootstrap的JS文件-->
		<!--引用materialize的JS文件-->
		<link rel="stylesheet" href="../../css/index2.css">
		<script src="../../js/index.js"></script>
		<!--链接外部CSS文件-->

		<!--链接外部JS文件-->

	</head>
	<body>
	<div id="box">
		<img id="logoimg1" src="../../img/logo1.jpg" />
			<!--放置海报图片-->
			<div class="container nav1">
				<div class="row">
					<div class="col-lg-2 navigation1">
						<img width="100%" height="35px" src="../../img/新logo.PNG" />
					</div>
					<div class="col-lg-2 navigation1">
						<a class="navigation1-a" href="#">郑州轻工业学院</a>
					</div>
					<div class="col-lg-6 navigation1">
						<a class="navigation1-a" href="#"> </a>
					</div>
					<div class="col-lg-1 navigation1">
						<a class="navigation1-a" onclick="show_Win('register', 'movingbar', event)" href="#">注册</a>
					</div>
					<div class="col-lg-1 navigation1">
						<a class="navigation1-a" href="#">登录</a>
					</div>
				</div>
			</div>
			<!--栅格布局，导航1-->
			<br />
			<div><img id="logoimg2" src="../../img/logo3.jpg" /></div>
			<ul class="nav nav-tabs navigation2">
				<li class="active col-lg-2 navli">
					<a href="common/homepage.html" target="icontent">首页</a>
				</li>
				<li class="col-lg-2 navli">
					<a href="common/search.jsp" target="icontent">校园寻物</a>
				</li>
				<li class="col-lg-2 navli">
					<a href="/goods/homeGoods" target="icontent">校园淘宝</a>
				</li>
				<li class="col-lg-2 navli">
					<a href="common/release1.jsp" target="icontent">发布启事</a>
				</li>
				<li class="col-lg-2 navli">
					<a href="common/release2.jsp" target="icontent">发布好物</a>
				</li>
				<li class="col-lg-2 navli">
					<a href="common/mine.jsp" target="icontent">我的</a>
				</li>
			</ul>
			<!--导航2-->
			<iframe src="common/homepage.html" name="icontent" id="icontent" ></iframe>
			<!--导航栏点击后页面加载内容处-->
			<div id="register">
				<div id="movingbar">
					<p>
						欢迎注册
						<a>
							<img id="minimize" style="cursor: pointer;" onclick="closeLogin()" src="../../img/关闭图标.jpg" />
						</a>
					</p>
				</div>
				<div class="registerBg">
					<img src="../../img/轮播1.png">
				</div>
				<form action="#" id="form">
					<input type="text" class="form-control text1" placeholder="请输入手机号">
					<br />
					<div class="text1">
						<input type="text" class="form-control verification1" placeholder="请输入验证码">
						<input class="verification2 btn btn-small btn btn-primary" type="button" value="获取验证码" />
					</div>
					<br />
					<input type="text" class="form-control text1" placeholder="请输入密码">
					<br />
					<input type="text" class="form-control text1" placeholder="请再次输入密码">
					<br />
					<div id="hint">两次密码不一致！</div>
					<br />
					<input type="submit" class="btn btn-success" value="立即注册" />
					<br />
					<br />
				</form>
			</div>
		</div>
	</body>

</html>