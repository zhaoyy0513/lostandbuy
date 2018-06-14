package com.zzuli.service.impl;

import com.zzuli.dao.ImageMapper;
import com.zzuli.pojo.Image;
import com.zzuli.service.ImageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "imageService")
public class ImageServiceImpl implements ImageService {
    @Resource
    private ImageMapper imageMapper;

    @Override
    public int addImage(Image image) {

        return imageMapper.insert(image);
    }

    public List<Image> getImageByPrimaryKey(int imageId){
       List<Image> image = imageMapper.selectByPrimaryKey(imageId);
        return image;
    }

    @Override
    public List<Image> selectAllImages() {
        List<Image> list = imageMapper.selectAllImages();
        return list;
    }

    @Override
    public void deleteImageByPrimaryKey(int iid) {
        imageMapper.deleteByPrimaryKey(iid);
    }

    @Override
    public void updateImageByPrimary(int tid, Image image) {
        image.setTid(tid);
        imageMapper.updateByPrimaryKey(image);
    }

}
