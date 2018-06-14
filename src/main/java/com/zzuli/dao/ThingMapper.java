package com.zzuli.dao;

import com.zzuli.pojo.Image;
import com.zzuli.pojo.Thing;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ThingMapper {
    List<Thing> selectAllThings();

    int deleteByPrimaryKey(Integer tid);

    int insert(Thing record);

    Thing selectByPrimaryKey(Integer tid);

    /**
     * 通过主键更改信息，包括大文本信息
     * @param thing
     * @return
     */
    int updateByPrimaryKeyWithBLOBs(Thing thing);

    /**
     * 根据描述进行搜索
     *  List<Thing> searchThing(@Param("name") String name); 原本这样写
     */
    List<Thing> searchThing(String name);

    //根据用户id进行搜索
    List<Thing> getThingsByUserId(Integer uid);

    List<Thing> getThingByCatelog(Integer cid);

    List<Thing> getThingByPlace(String taddress);

    List<Thing> getThingByTime(String ttime);

}