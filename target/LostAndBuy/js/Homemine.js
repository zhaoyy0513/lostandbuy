window.onload=IFrameResize;



function IFrameResize(){
    var obj = parent.document.getElementById("icontent"); //取得父页面IFrame对象
    obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度
}//设置加载页面的高度

