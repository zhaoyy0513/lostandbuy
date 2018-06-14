package com.zzuli.dao;

import com.zzuli.pojo.Catelog;

public interface CatelogMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Catelog record);

    int insertSelective(Catelog record);

    Catelog selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Catelog record);

    int updateByPrimaryKey(Catelog record);
}