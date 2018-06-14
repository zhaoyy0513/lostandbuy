package com.zzuli.service.impl;

import com.zzuli.dao.ThingMapper;
import com.zzuli.pojo.Thing;
import com.zzuli.service.ThingService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service("thingService")
public class ThingServiceImpl implements ThingService {
    @Resource  //用来装配bean 也可以选择用Autowired
    private ThingMapper thingMapper;

    @Override
    public List<Thing> selectAllThings() {
        List<Thing> things = thingMapper.selectAllThings();
        return things;
    }

    @Override
    public List<Thing> searchThing(String info) {
        List<Thing> list = thingMapper.searchThing(info);
        return list;
    }

    //添加物品
    @Override
    public int addThing(Thing thing) {
        return thingMapper.insert(thing);
    }

    @Override
    public Thing getThingByPrimaryKey(int thingId) {
       Thing thing = thingMapper.selectByPrimaryKey(thingId);
        return thing;
    }

    @Override
    public void deleteThingByPrimaryKey(int thingId) {
        thingMapper.deleteByPrimaryKey(thingId);
    }


    @Override
    public void updateThingByPrimaryKey(int thingId,Thing thing) {
        thing.setTid(thingId);
        thingMapper.updateByPrimaryKeyWithBLOBs(thing);
    }

    @Override
    public List<Thing> getThingsByCatelog(int catelogId) {
        return thingMapper.getThingByCatelog(catelogId);
    }

    @Override
    public List<Thing> getThingsByPlace(String placeId) {
        return thingMapper.getThingByPlace(placeId);
    }

    @Override
    public List<Thing> getThingsByTime(String timeId) {
        return thingMapper.getThingByTime(timeId);
    }



    @Override
    public List<Thing> getThingsByUserId(int userId) {
        return thingMapper.getThingsByUserId(userId);
    }
}
