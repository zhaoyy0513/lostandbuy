package com.zzuli.service;

import com.zzuli.pojo.Image;

import java.util.List;

public interface ImageService {
    /*
     * 通过id获取图片
     * @author zyy
     * @date 2018/6/7 16:43
     * @param [imageId]
     * @return com.zzuli.pojo.Image
     */
    public int addImage(Image image);
    public List<Image> getImageByPrimaryKey(int imageId);

    public List<Image> selectAllImages();

    public void deleteImageByPrimaryKey(int iid);

    //更新物品图片
    public void updateImageByPrimary(int tid,Image image);

}
