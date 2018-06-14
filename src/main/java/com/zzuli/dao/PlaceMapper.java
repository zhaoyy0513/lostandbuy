package com.zzuli.dao;

import com.zzuli.pojo.Place;

public interface PlaceMapper {
    int deleteByPrimaryKey(String pid);

    int insert(Place record);

    int insertSelective(Place record);

    Place selectByPrimaryKey(String pid);

    int updateByPrimaryKeySelective(Place record);

    int updateByPrimaryKey(Place record);
}