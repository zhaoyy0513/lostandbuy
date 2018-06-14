<%@ page contentType="text/html;charset=UTF-8" language="java" import="javax.servlet.http.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--响应式布局-->
	<title>寻物小站</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<!--引用bootstrap的CSS文件-->
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<!--引用jQuery文件-->
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<!--引用jquery-ui文件-->
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	<!--引用bootstrap的JS文件-->
	<link rel="stylesheet" href="../css/index.css" />
	<!--链接外部CSS文件-->
	<script type="text/javascript" src="../js/index.js"></script>
	<!--链接外部JS文件-->

	<script type="text/javascript">
        function login_confirm(){
            var pwd1 = document.getElementById("pwd1").value;
            var pwd2 = document.getElementById("pwd2").value;
            if(pwd1==pwd2){
                var buildCode = "${buildCode}";
                var input = document.getElementById("inputCode").value;
                if(input!=buildCode){
                    document.getElementById("verifyState").style.display="block";
                    alert("验证码错误!");
					return false ;

                }else{
                    alert("注册成功，请登陆！");
                    return true;
                }
			}
            else{
                //document.getElementById('verifyState').innerHTML = "密码不一致！";
                //document.getElementById('verifyState').style.display="block";
                alert("两次输入的密码不一致！");
					return false;
				}

        }
	</script>

	<%-- 验证码 --%>
	<script type="text/javascript">
        function sendCode(obj){
            var phone = document.getElementById("phone");
            var value = phone.value.trim();
            if(value && value.length == 11){
                $.ajax({
                    type : "POST",
                    cache : false,
                    url : "/user/getCode",
                    data : {phone : value}
                });
				// 1分钟内禁止点击
                for (var i = 1; i <= 60; i++) {
                    // 1秒后显示
                    window.setTimeout("updateTime(" + (60 - i) + ")", i * 1000);
                }
            }else{
                alert("请输入正确的手机号码");
                phone.focus();
            }
            alert("验证码已发送，请查看！")
        }

        function updateTime(i){
            // setTimeout传多个参数到function有点麻烦，只能重新获取对象
            var obj = document.getElementById("validationCode");
            if(i > 0){
                obj.innerHTML  = "距离下次获取还有" + i + "秒";
                obj.disabled = true;
            }else{
                obj.innerHTML = "获取验证码";
                obj.disabled = false;
            }
        }

        function checkTime(){
            var sendCodeTime = <%=(Long)session.getAttribute("SEND_CODE_TIME")%>;
            if(sendCodeTime){
                var nowTime = new Date().getTime();
                var flag = Math.floor((nowTime - sendCodeTime)/1000);
                if(flag < 60){
                    var end = 60 - flag;
                    // 进页面马上开始，选i为0
                    for (var i = 0; i <= end; i++) {
                        window.setTimeout("updateTime(" + (end - i) + ")", i * 1000);
                    }
                }
            }
        }

	</script>

</head>

<body>
<div id="box">
	<div><img id="logoimg1" src="../img/logo1.jpg" /></div>
	<!--放置海报图片-->
	<div class="container nav1">
		<div class="row">
			<div class="col-xs-3 col-sm-3 col-md-3 col-lg-2 navigation1">
				<a class="navigation1-a" href="#">郑州轻工业学院</a>
			</div>
			<div class=" col-xs-1 col-sm-1 col-md-3  col-lg-6 navigation1">
				<a class="navigation1-a" href="#"> </a>
			</div>
			<!- 如果没有登陆，则显示登陆和注册两个按钮->
			<c:if test="${empty cur_user}">
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2 navigation1">
					<a class="navigation1-a" onclick="show_Win('register', 'movingbar1', event)" href="#">注册</a>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2 navigation1">
					<a class="navigation1-a" onclick="show_Win('Login', 'movingbar2', event)" href="#">登录</a>
				</div>
			</c:if>
			<c:if test="${!empty cur_user}">
				<div class="col-xs-8 col-sm-8 col-md-6 col-lg-4 navigation1">
					<a style=" text-decoration: none;color:white;position: relative;top: 8px;right: 10px;">欢迎你！${cur_user.uname}</a>
					<a href="/user/logout" style=" color:white;position: relative;top: 8px;left: 20px">退出</a>
				</div>
			</c:if>
		</div>
	</div>
	<!--栅格布局，导航1-->
	<br />
	<ul class="nav nav-tabs navigation2">
		<li class="active col-lg-2 navli">
			<a href="../../normal/homePage.jsp" target="icontent">首页</a>
		</li>
		<li class="col-lg-2 navli">
			<a href="/thing/thingsHome" target="icontent">校园寻物</a>
		</li>
		<li class="col-lg-2 navli">
			<a href="campusTaobao" target="icontent">校园淘宝</a>
		</li>
		<li class="col-lg-2 navli">
			<a href="/thing/toReleasePage" target="icontent">发布启事</a>
		</li>
		<li class="col-lg-2 navli">
			<a href="releaseOld" target="icontent">发布好物</a>
		</li>
		<li class="col-lg-2 navli">
			<a href="/user/minePage" target="icontent">个人中心</a>
		</li>
	</ul>
	<!--导航2-->
	<iframe src="../../normal/homePage.jsp" name="icontent" id="icontent" scrolling="no"></iframe>
	<iframe src="../../normal/pageFooter.html" name="icontent" id="icontent1" scrolling="no"></iframe>
	<!--导航栏点击后页面加载内容处-->

	<div id="register">
		<div id="movingbar1">
			<p>
				欢迎注册
				<a>
					<img class="minimize" style="cursor: pointer;" onclick="closeLogin()" src="../img/closeIcon.jpg" />
				</a>
			</p>
		</div>
		<div class="registerBg">
			<img src="../img/broadcast1.png">
		</div>
		<form:form action="/user/addUser" id="form"  style="margin-bottom: -40px;" method="post">
			<%-- name里的值要与mapper.xml文件里的名字相同--%>
			<input type="text" required=required" name="uname" class="form-control text1" placeholder="用户名">
			<br />
			<input type="text" id="phone" required=required" pattern="^1[0-9]{10}$" name="utelephone" class="form-control text1" placeholder="请输入手机号">
			<br />
			<div class="text1">
				<input type="text" required="required" id="inputCode" name="inputCode" class="form-control verification1" placeholder="请输入验证码">
				<input class="verification2 btn btn-small btn btn-primary" id="validationCode"  onclick="sendCode(this)"  type="button" value="获取验证码" />
			</div>
			<br />
			<input type="password" id="pwd1" name="upassword"  required=required" class="form-control text1" placeholder="请输入密码">
			<br />
			<input type="password"  id="pwd2" required=required" class="form-control text1" placeholder="请再次输入密码">
			<br />
			<input type="submit" class="btn btn-success" onclick="return login_confirm()" value="立即注册" />
			<br />
			<a href="#" onclick="show_Win('Login', 'movingbar2', event)" style="position:relative;top: 5px;left: 22px;">已有帐号？去登录</a>
			<br />
			<div id="verifyState" style="
			margin-bottom: -10px;
			display: none;color: black;text-align: center;
			font-size: 32px;
			font-weight: 700;
			">验证码错误</div>
		</form:form>
	</div>


	<div id="Login">
		<div id="movingbar2">
			<p>
				欢迎登录
				<a>
					<img class="minimize" style="cursor: pointer;" onclick="closeLogin()" src="../img/closeIcon.jpg" />
				</a>
			</p>
		</div>
		<div class="registerBg">
			<img src="../img/broadcast1.png">
		</div>
		<form:form action="/user/login" id="form1">
			<input type="text" required="required" name="utelephone" class="form-control text2" placeholder="请输入手机号">
			<br />
			<br />
			<input type="password" required="required" name="upassword" class="form-control text2" placeholder="请输入密码">
			<span>忘记密码</span>
			<br />
			<br />
			<input type="submit" class="btn btn-success"  value="登录" />
			<br />

			<div id="loginState" style="
			margin-bottom: -10px;
			display: none;color: black;text-align: center;
			font-size: 32px;    <!-- 用来以后将内容显示在注册窗口 -->
			font-weight: 700;
			">密码不正确</div>
		</form:form>
	</div>

</div>
</body>

</html>