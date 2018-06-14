window.onload = initial1;

var Images1 = new Array("../img/logo1.jpg", "../img/logo2.jpg");
var thisImages1 = 0;


function initial1() {

	thisImages1++;
	if(thisImages1 == Images1.length) {
		thisImages1 = 0;
	}
	document.getElementById("logoimg1").src = Images1[thisImages1];

	setTimeout(initial1, 5000);
	//广告条循环
}

$(function() {
	$("ul li").click(function() {
		$("ul li").removeClass('active');
		$(this).addClass('active');
	});
}); //导航栏点击样式

//弹出层
function show_Win(div_Win, tr_Title, event) {
	var s_Width = document.documentElement.scrollWidth; //滚动 宽度
	var s_Height = document.documentElement.scrollHeight; //滚动 高度
	var js_Title = $(document.getElementById(tr_Title)); //标题
	js_Title.css("cursor", "move");
	//获取弹出层
	var msgObj = $("#" + div_Win);
	msgObj.css('display', 'block'); //必须先弹出此行，否则msgObj[0].offsetHeight为0，因为"display":"none"时，offsetHeight无法取到数据；如果弹出框为table，则为'',如果为div，则为block，否则textbox长度无法充满td
	//y轴位置
	var js_Top = -parseInt(msgObj.height()) / 2 + "px";
	//x轴位置
	var js_Left = -parseInt(msgObj.width()) / 2 + "px";
	msgObj.css({
		"margin-left": js_Left,
		"margin-top": js_Top
	});
	//使弹出层可移动
	msgObj.draggable({
		handle: js_Title,
		scroll: false
	});
}

function closeLogin(){
	var closeRegisterPageLayerButton1= document.getElementById("register"); 
	var closeRegisterPageLayerButton2= document.getElementById("Login"); //根据ID获取登录弹窗对象
	//closeRegisterPageLayerButton.style.visibility="hidden"; 
	//这里关闭后还会占用图层位置，影响后面组件的的观感，因此不用这个方法，用下面的方法
	closeRegisterPageLayerButton1.style.display="none";  //给弹窗对象设置关闭操作
	closeRegisterPageLayerButton2.style.display="none";
}
