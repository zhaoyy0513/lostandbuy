window.onload = initial;
window.onload = IFrameResize;

var Images2 = new Array("../img/logo3.jpg", "../img/logo4.jpg");
var thisImages2 = 0;

function initial() {
    thisImages2++;
    if(thisImages2 == Images2.length) {
        thisImages2 = 0;
    }
    document.getElementById("logoimg2").src = Images2[thisImages2];

    setTimeout(initial, 2000);
    //广告条循环
}

$(function() {
    $('.simplefilter1 li').click(function() {
        $('.simplefilter1 li').removeClass('active');
        $(this).addClass('active');
    });
    $('.simplefilter2 li').click(function() {
        $('.simplefilter2 li').removeClass('active');
        $(this).addClass('active');
    });
    $('.simplefilter3 li').click(function() {
        $('.simplefilter3 li').removeClass('active');
        $(this).addClass('active');
    });
    $('.shuffle-btn').click(function() {
        $('.sort-btn').removeClass('active');
    });
    $('.sort-btn').click(function() {
        $('.sort-btn').removeClass('active');
        $(this).addClass('active');
    });
});//条件筛选的点击样式设置
function IFrameResize(){
    var obj = parent.document.getElementById("icontent"); //取得父页面IFrame对象
    obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度
}//设置加载页面的高度