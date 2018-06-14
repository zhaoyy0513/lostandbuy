package com.zzuli.dao;

import com.zzuli.pojo.Image;

import java.util.List;

public interface ImageMapper {
    List<Image> selectAllImages();

    List<Image> selectByPrimaryKey(Integer iid);

    int deleteByPrimaryKey(Integer iid);

    int insert(Image record);

    int updateByPrimaryKey(Image image);
}