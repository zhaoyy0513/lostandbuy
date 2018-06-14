package com.zzuli.service;


import com.zzuli.pojo.Thing;

import java.util.List;

public interface ThingService {

   /*
    *获取所有物品
    * @author zyy
    * @date 2018/6/6 15:11
    */
    public List<Thing> selectAllThings();

    /*
     *添加物品
     * @author zyy
     * @date 2018/6/6 15:12
     * @param [thing] 要添加的物品
     * @return int
     */
    public int addThing(Thing thing);

    /*
     *通过id获取物品信息
     * @author zyy
     * @date 2018/6/6 15:15
     * @param [thingId]
     * @return com.zzuli.pojo.Thing
     */
    public Thing getThingByPrimaryKey(int thingId);

    /*
     *更新物品
     * @author zyy
     * @date 2018/6/6 15:16
     * @param
     * @return
     */
    public void updateThingByPrimaryKey(int thingId,Thing thing);

    /*
     *通过id删除物品
     * @author zyy
     * @date 2018/6/6 15:17
     * @param [thingId]
     * @return void
     */
    public void deleteThingByPrimaryKey(int thingId);

    /*
     *通过搜索框搜索物品
     * @author zyy
     * @date 2018/6/6 15:19
     * @param [describle]
     * @return java.util.List<com.zzuli.pojo.Thing>
     */
    public List<Thing> searchThing(String info);

    /*
     *通过分类获取物品
     * @author zyy
     * @date 2018/6/6 15:27
     * @param [catelogId]
     * @return java.util.List<com.zzuli.pojo.Thing>
     */
    public List<Thing> getThingsByCatelog(int catelogId);

    /*
     *通过地点获取物品
     * @author zyy
     * @date 2018/6/6 15:50
     * @param [placeId]
     * @return java.util.List<com.zzuli.pojo.Thing>
     */
    public List<Thing> getThingsByPlace(String placeId);

   /*
    *通过时间获取物品
    * @author zyy
    * @date 2018/6/6 15:50
    * @param [timeId]
    * @return java.util.List<com.zzuli.pojo.Thing>
    */
   public List<Thing> getThingsByTime(String timeId);





    /*
     *通过用户id获取用户发布的所有物品
     * @author zyy
     * @date 2018/6/6 15:51
     * @param [userId]
     * @return java.util.List<com.zzuli.pojo.Thing>
     */
    public List<Thing> getThingsByUserId(int userId);


}
