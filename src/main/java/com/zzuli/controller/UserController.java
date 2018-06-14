package com.zzuli.controller;

import com.zzuli.pojo.Image;
import com.zzuli.pojo.Thing;
import com.zzuli.pojo.ThingsExtend;
import com.zzuli.pojo.User;
import com.zzuli.service.ImageService;
import com.zzuli.service.ThingService;
import com.zzuli.service.UserService;
import com.zzuli.util.sendMsg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value="/user")
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private ThingService thingService;
    @Resource
    private ImageService imageService;
    //添加用户
    @RequestMapping(value = "/addUser")
    public String addUser(HttpServletRequest httpServletRequest, @ModelAttribute("user")User user1){
        /*
         * 只是此处多了一个注解@ModelAttribute("user")，
         * 它的作用是将该绑定的命令对象以“user”为名称添加到模型对象中供视图页面展示使用。
         * 我们此时可以在视图页面使用${user.username}来获取绑定的命令对象的属性。
         * */
        String url = httpServletRequest.getHeader("Referer");  //获取来源网页后文件信息。便于后续重定向
        User user = userService.getUserByPhone(user1.getUtelephone());
        if(user==null){
                String userInput = httpServletRequest.getParameter("inputCode");  //用户输入的
                String buildCode = httpServletRequest.getSession().getAttribute("buildCode").toString();
                System.out.println("verifyCode:"+userInput);
                System.out.println("resultCode:"+buildCode);
                if(userInput.equals(buildCode)){
                    userService.addUser(user1);
                    System.out.println("添加成功");
                }
                else{
                    System.out.println("验证码不相符:");
                }
        }
        return "redirect:"+url;
    }

    //用户登陆验证
    @RequestMapping(value = "/login")
    public ModelAndView loginValidate(HttpServletRequest httpServletRequest,User user){
        User cur_user = userService.getUserByPhone(user.getUtelephone());
        String url = httpServletRequest.getHeader("Referer");
        if(cur_user!=null){
            String inputedPwd = user.getUpassword();
            if(inputedPwd.equals(cur_user.getUpassword())){
                httpServletRequest.getSession().setAttribute("cur_user",cur_user);
            }else{
                httpServletRequest.getSession().setAttribute("loginState",0);
                System.out.println("密码错误:");
            }
        }
    return new ModelAndView("redirect:"+url);
    }

    //获取验证码
    @RequestMapping(value = "/getCode")
    public ModelAndView getCode(HttpServletRequest httpServletRequest){
            String url = httpServletRequest.getHeader("Referer");
            String tel = httpServletRequest.getParameter("phone");
            ModelAndView mod = new ModelAndView();
            System.out.println("tel:"+tel);
            //send.code(tel);
            sendMsg s = new sendMsg();
            //以下代码可以在有短信功能后进行删除
            int code2 = s.postCode();  //产生验证码
            System.out.println("验证码是-------------:"+code2);
            httpServletRequest.getSession().setAttribute("buildCode",code2);
            mod.addObject("buildCode",code2);
            mod.setViewName("index");
        return mod;
    }

    //用户退出
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().setAttribute("cur_user",null);
        return "redirect:/";
    }

    //用户查看自己的信息,传递给前台所有有关的信息
    @RequestMapping(value = "/minePage" )
    public ModelAndView minePage(HttpServletRequest httpServletRequest){
        User user = (User)httpServletRequest.getSession().getAttribute("cur_user"); //获取用户对象
        ModelAndView mod = new ModelAndView();
        if(user!=null){
            List<Thing> thingsList = thingService.getThingsByUserId(user.getUid());
            List<ThingsExtend> thingsAndImage = new ArrayList<ThingsExtend>();
            for(int i=0;i<thingsList.size();i++){
                //将用户信息和image信息封装到GoodsExtend类中，传给前台
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing thing =thingsList.get(i);   //获取商品
                List<Image> image = imageService.getImageByPrimaryKey(thing.getTid());
                thingsExtend.setImage(image);
                thingsExtend.setThing(thing);
                thingsAndImage.add(i,thingsExtend);
            }
            mod.addObject("thingList",thingsAndImage);
        }
        mod.setViewName("mine/Homemine");
        return mod;
    }

    //修改用户信息
    @RequestMapping(value = "/updateInfo")
    public ModelAndView updateInfo(HttpServletRequest request,User user) {
        //从session中获取出当前用户
        ModelAndView modelAndView = new ModelAndView();
        String url = request.getHeader("Referer");
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        String pwd =  request.getParameter("upassword");
        if(pwd.equals("")){
            cur_user.setUpassword(cur_user.getUpassword());  //如果输入的为空，则默认还是原来的密码
            cur_user.setUname(user.getUname());
            cur_user.setUtelephone(user.getUtelephone());
        }else{
            cur_user.setUpassword(pwd);
            cur_user.setUname(user.getUname());
            cur_user.setUtelephone(user.getUtelephone());
        }
        userService.updateUserInfo(cur_user);//执行修改操作
        request.getSession().setAttribute("cur_user",null);//修改session值
        //modelAndView.addObject("state",1);   //两种设置修改信息的状态值的方法
        modelAndView.setViewName("modify_to");
        //return new ModelAndView("redirect:/user/minePage");
        return modelAndView;
    }

    /*
    * 在SpringMVC后台控制层获取参数的方式主要有两种:
      一种是request.getParameter("name")，另外一种是用注解@RequestParam直接获取
    * */
    @RequestMapping(value = "/deleteThing/{tid}")
    public String deleteGoods(HttpServletRequest httpServletRequest, @PathVariable("tid") Integer tid) throws Exception {
        thingService.deleteThingByPrimaryKey(tid);  //删除
        imageService.deleteImageByPrimaryKey(tid);  //删除用户商品对应的图片
        return "redirect:/user/minePage";
    }


}
