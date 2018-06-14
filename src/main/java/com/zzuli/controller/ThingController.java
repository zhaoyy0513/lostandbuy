package com.zzuli.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zzuli.pojo.*;
import com.zzuli.service.ImageService;
import com.zzuli.service.ThingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping(value="/thing")
public class ThingController {
    @Autowired
    private ThingService thingService;
    @Autowired
    private ImageService imageService;
    @RequestMapping(value= "/search")
    public ModelAndView search(@RequestParam(value="info",required = false) String info){
        String detail = info.trim();  //去除输入的空格
        List<ThingsExtend> thingsExtendList = new ArrayList<ThingsExtend>();
        List<Thing> thingsList= thingService.searchThing(detail);
        for(int i = 0;i<thingsList.size();i++) {
            ThingsExtend thingsExtend = new ThingsExtend();
            Thing thing = thingsList.get(i);
            List<Image> imageList = imageService.getImageByPrimaryKey(thing.getTid());
            thingsExtend.setThing(thing);
            thingsExtend.setImage(imageList);
            thingsExtendList.add(i,thingsExtend);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("thingsExtendList", thingsExtendList);
        modelAndView.addObject("searchinfo",info);
        modelAndView.setViewName("thing/Searchthings");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/complexValue")
    public String complexValue(String ttime,String taddress,Integer cid){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("inputTime",ttime);
        map.put("inputPlace",taddress);
        map.put("inputCatelog",cid);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/searchComplex")
    public String searchComplex(String aa,Model model, Thing thing) throws Exception{
        JSONObject jsonObject = JSON.parseObject(aa);  //解析对象
        String inputTime = jsonObject.getString("inputTime");
        String inputPlace =jsonObject.getString("inputPlace");
        int inputCatelog = jsonObject.getInteger("inputCatelog");
        Set<ThingsExtend> set = new HashSet<ThingsExtend>();
        if(inputCatelog==0&&!inputTime.equals("0")&&!inputPlace.equals("0")){
            List<Thing> Bytime = thingService.getThingsByTime(inputTime);
            List<Thing> ByPlace = thingService.getThingsByPlace(inputPlace);
            System.out.println("分类为0,其他不为0");
            for(int i=0;i<Bytime.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing time = Bytime.get(i);
                List<Image> imageTime = imageService.getImageByPrimaryKey(time.getTid());
                thingsExtend.setThing(time);
                thingsExtend.setImage(imageTime);
                set.add(thingsExtend);
            }
            for(int i=0;i<ByPlace.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing place = ByPlace.get(i);
                List<Image> imagePlace = imageService.getImageByPrimaryKey(place.getTid());
                thingsExtend.setThing(place);
                thingsExtend.setImage(imagePlace);
                set.add(thingsExtend);
            }
        }
        if(inputPlace.equals("0")&&inputCatelog!=0&&!inputTime.equals("0")){
            List<Thing> Bytime = thingService.getThingsByTime(inputTime);
            List<Thing> ByCatelog = thingService.getThingsByCatelog(inputCatelog);
            System.out.println("地点为0,其他不为0");
            for(int i=0;i<Bytime.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing time = Bytime.get(i);
                List<Image> imageTime = imageService.getImageByPrimaryKey(time.getTid());
                thingsExtend.setThing(time);
                thingsExtend.setImage(imageTime);
                set.add(thingsExtend);
            }
            for(int i=0;i<ByCatelog.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing catelog = ByCatelog.get(i);
                List<Image> imageCatelog = imageService.getImageByPrimaryKey(catelog.getTid());
                thingsExtend.setThing(catelog);
                thingsExtend.setImage(imageCatelog);
                set.add(thingsExtend);
            }
        }
     if(inputTime.equals("0")&&inputCatelog!=0&&!inputPlace.equals("0")){
         List<Thing> ByPlace = thingService.getThingsByPlace(inputPlace);
         List<Thing> ByCatelog = thingService.getThingsByCatelog(inputCatelog);
         System.out.println("时间为0,其他不为0");
            for(int i=0;i<ByPlace.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing place = ByPlace.get(i);
                List<Image> imagePlace = imageService.getImageByPrimaryKey(place.getTid());
                thingsExtend.setThing(place);
                thingsExtend.setImage(imagePlace);
                set.add(thingsExtend);
            }
            for(int i=0;i<ByCatelog.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing catelog = ByCatelog.get(i);
                List<Image> imageCatelog = imageService.getImageByPrimaryKey(catelog.getTid());
                thingsExtend.setThing(catelog);
                thingsExtend.setImage(imageCatelog);
                set.add(thingsExtend);
            }
        }

        if(inputCatelog==0&&inputPlace.equals("0")){
            List<Thing> Bytime = thingService.getThingsByTime(inputTime);
            System.out.println("分类,地点为0");
            for(int i=0;i<Bytime.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing time = Bytime.get(i);
                List<Image> imageTime = imageService.getImageByPrimaryKey(time.getTid());
                thingsExtend.setThing(time);
                thingsExtend.setImage(imageTime);
                set.add(thingsExtend);
            }
        }

        if(inputTime.equals("0")&&inputCatelog==0){
            List<Thing> ByPlace = thingService.getThingsByPlace(inputPlace);
            System.out.println("时间,分类为0");
            for(int i=0;i<ByPlace.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing place = ByPlace.get(i);
                List<Image> imageTime = imageService.getImageByPrimaryKey(place.getTid());
                thingsExtend.setThing(place);
                thingsExtend.setImage(imageTime);
                set.add(thingsExtend);
            }
        }

         if(inputCatelog==0&&inputTime.equals("0")){
             List<Thing> ByPlace = thingService.getThingsByPlace(inputPlace);
            for(int i=0;i<ByPlace.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing place = ByPlace.get(i);
                List<Image> imagePlace = imageService.getImageByPrimaryKey(place.getTid());
                thingsExtend.setThing(place);
                thingsExtend.setImage(imagePlace);
                set.add(thingsExtend);
            }
        }
        if(inputTime.equals("0")&&inputPlace.equals("0")){
            List<Thing> ByCatelog = thingService.getThingsByCatelog(inputCatelog);
            System.out.println("时间,地点为0");
            for(int i=0;i<ByCatelog.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing catelog = ByCatelog.get(i);
                List<Image> imageCatelog = imageService.getImageByPrimaryKey(catelog.getTid());
                thingsExtend.setThing(catelog);
                thingsExtend.setImage(imageCatelog);
                set.add(thingsExtend);
            }
        }
        if(inputCatelog==0&&inputPlace.equals("0")&&inputTime.equals("0")) {
            System.out.println("都为0");
            List<ThingsExtend> thingsAndImage = new ArrayList<ThingsExtend>();
            List<Thing> thingsList = thingService.selectAllThings();
            for (int i = 0; i < thingsList.size(); i++) {
                //将用户信息和image信息封装到GoodsExtend类中，传给前台
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing thingss = thingsList.get(i);   //获取商品
                List<Image> image = imageService.getImageByPrimaryKey(thingss.getTid());
                thingsExtend.setImage(image);
                thingsExtend.setThing(thingss);
                thingsAndImage.add(i, thingsExtend);
                set.add(thingsExtend);
            }
        }

        if(inputCatelog!=0&&!inputPlace.equals("0")&&!inputTime.equals("0")){
            List<Thing> Bytime = thingService.getThingsByTime(inputTime);
            List<Thing> ByPlace = thingService.getThingsByPlace(inputPlace);
            List<Thing> ByCatelog = thingService.getThingsByCatelog(inputCatelog);
            System.out.println("都不为0");
            for(int i=0;i<Bytime.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing time = Bytime.get(i);
                List<Image> imageTime = imageService.getImageByPrimaryKey(time.getTid());
                thingsExtend.setThing(time);
                thingsExtend.setImage(imageTime);
                set.add(thingsExtend);
            }
            for(int i=0;i<ByPlace.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing place = ByPlace.get(i);
                List<Image> imagePlace = imageService.getImageByPrimaryKey(place.getTid());
                thingsExtend.setThing(place);
                thingsExtend.setImage(imagePlace);
                set.add(thingsExtend);
            }
            for(int i=0;i<ByCatelog.size();i++){
                ThingsExtend thingsExtend = new ThingsExtend();
                Thing catelog = ByCatelog.get(i);
                List<Image> imageCatelog = imageService.getImageByPrimaryKey(catelog.getTid());
                thingsExtend.setThing(catelog);
                thingsExtend.setImage(imageCatelog);
                set.add(thingsExtend);
            }
        }
        model.addAttribute("thingSet",set);
        model.addAttribute("catelogId",inputCatelog);
        model.addAttribute("placeId",inputPlace);
        model.addAttribute("timeId",inputTime);
        return "thing/searchByDetail";
    }

    @RequestMapping(value = "/thingsHome")
    public ModelAndView getAllThings(){
        ModelAndView mod = new ModelAndView();
        List<ThingsExtend> thingsAndImage = new ArrayList<ThingsExtend>();
        List<Thing> thingsList =  thingService.selectAllThings();
        for(int i=0;i<thingsList.size();i++){
            //将用户信息和image信息封装到GoodsExtend类中，传给前台
            ThingsExtend thingsExtend = new ThingsExtend();
            Thing thing =thingsList.get(i);   //获取商品
            List<Image> image = imageService.getImageByPrimaryKey(thing.getTid());
            thingsExtend.setImage(image);
            thingsExtend.setThing(thing);
            thingsAndImage.add(i,thingsExtend);
        }

        mod.addObject("allThings",thingsAndImage);
        mod.setViewName("thing/Homethings");
        return mod;
    }

    @RequestMapping("/toReleasePage")
    public ModelAndView toReleasePage(){
        return new ModelAndView("thing/Releasethings");
    }

    /**
     * 上传物品
     * @param httpServletRequest
     * @param myfile
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value = "/uploadFile")
    public Map<String,Object> uploadFile(HttpServletRequest httpServletRequest, HttpSession session, MultipartFile myfile) throws IllegalStateException, IOException{
        //原始名称
        String oldFileName = myfile.getOriginalFilename(); //获取上传文件的原名
        //存储图片的物理路径
        //getSession(),这个有风险，很可以使没有session，不要使用session来得到servletContext。
       // String file_path = httpServletRequest.getSession().getServletContext().getRealPath("upload");
        String file_path = "D:/workplace/ideaPlace/LostAndBuy/src/main/webapp/upload";
        //没办法只能用绝对路径
        System.out.println("file_path:"+file_path);
        //上传图片
        if(myfile!=null && oldFileName!=null && oldFileName.length()>0){
            //新的图片名称
            String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
            //新图片
            File newFile = new File(file_path+"/"+newFileName);
            System.out.println("newFile:"+newFile);
            //将内存中的数据写入磁盘
            myfile.transferTo(newFile);
            //将新图片名称返回到前端
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("success", "成功啦");
            map.put("iurl",newFileName);
            return  map;
        }else{
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("error","图片不合法");
            return map;
        }
    }

    @RequestMapping(value = "/releaseThing")
    public String releaseThing(HttpServletRequest httpServletRequest,Image ima,Thing thing,MultipartFile image)
            throws Exception{    //这里的ima的url通过之前已经传过来了
        //查询出当前用户cur_user,需要用到其userId
        User cur_user = (User)httpServletRequest.getSession().getAttribute("cur_user");
         String phoneNumber = (String)httpServletRequest.getParameter("utelephone");
         if(phoneNumber.equals("")){
            thing.setUtelephone(cur_user.getUtelephone());//如果用户没有填电话这一栏，默认就用用户自己的手机号
         }
        thing.setUId(cur_user.getUid());  //获取当前用户Id
        thingService.addThing(thing);
        //返回插入的该物品id
        Integer thingId = thing.getTid();

        ima.setTid(thingId);  //给图片设置相对应的物品Id
        imageService.addImage(ima); //在image表中插入商品图片
        return "redirect:/user/minePage";
    }

    @RequestMapping(value = "/detailThing/{tid}")
    public ModelAndView detailThing(HttpServletRequest httpServletRequest, @PathVariable("tid") Integer tid) throws Exception {
        Thing thing = thingService.getThingByPrimaryKey(tid);
        List<Image> imageList = imageService.getImageByPrimaryKey(tid);
        ThingsExtend thingsExtend = new ThingsExtend();
        thingsExtend.setImage(imageList);  //为物品扩展对象设置图片信息
        thingsExtend.setThing(thing);  //为物品扩展对象设置物品信息
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("thingExtend",thingsExtend);
        modelAndView.setViewName("/thing/Detailthings");
        return modelAndView;
    }

    @RequestMapping(value = "/toUpdateThing/{tid}")
    public ModelAndView toUpdateThing(@PathVariable("tid") Integer tid) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        Thing thing = thingService.getThingByPrimaryKey(tid);
        modelAndView.addObject("modifiedThing",thing);
        modelAndView.setViewName("/thing/Updatethings");
        return modelAndView;
    }

    @RequestMapping(value = "/updateThing")
     public String updateThing(HttpServletRequest httpServletRequest,Image ima,Thing thing) throws Exception{
        //Integer tId = Integer.valueOf(httpServletRequest.getParameter("tid"));
        thingService.updateThingByPrimaryKey(thing.getTid(),thing);  //修改物品信息
        imageService.updateImageByPrimary(thing.getTid(),ima);
        return "redirect:/user/minePage";
     }




}
