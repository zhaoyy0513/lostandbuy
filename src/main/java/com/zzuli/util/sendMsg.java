package com.zzuli.util;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class sendMsg {
    /**
     * @author Zhaoyy_PC
     *通过sms实现短信的发放
     *http://sms.webchinese.cn/default.shtml
     */
    public void code(String tel) throws UnsupportedEncodingException, IOException {
        int randomNum = (int) (Math.random() * 899998 + 100001);   //产生随机数
        String smsText = "感谢您的支持！，您的验证码为:" + String.valueOf(randomNum) + "(注册验证码)";  //将随机数转变为字符串验证码
        HttpClient client = new HttpClient();
        PostMethod post = new PostMethod("http://utf8.api.smschinese.cn");
        post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");//在头文件中设置转码
//uname:cms网站用户名,      key:接口安全秘钥,     tel:要发送的手机号 ,yan:发送的验证码
        NameValuePair[] data = {new NameValuePair("Uid", "zhao86603185"), new NameValuePair("Key", "d41d8cd98f00b204e980"), new NameValuePair("smsMob", tel), new NameValuePair("smsText", smsText)};
        post.setRequestBody(data);

        client.executeMethod(post);
        Header[] headers = post.getResponseHeaders();
        int statusCode = post.getStatusCode();
        System.out.println("statusCode:" + statusCode);
        for (Header h : headers) {
            System.out.println(h.toString());
        }
        String result = new String(post.getResponseBodyAsString().getBytes("utf-8"));
        System.out.println(result); //打印返回消息状态
        post.releaseConnection();
    }

    public int postCode(){
        int randomNum = (int) (Math.random() * 899998 + 100001);   //产生随机数
        return randomNum;
    }


}