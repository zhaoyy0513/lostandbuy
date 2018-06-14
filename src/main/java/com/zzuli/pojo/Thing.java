package com.zzuli.pojo;

public class Thing {
    private Integer tid;  //物品id

    private Integer cid;  //物品类型

    private String tname;  //物品民

    private String taddress;  //物品地点

    private String ttime; //物品发布时间

    private String tdescription;   //物品描述

    private Integer uid;  //发表物品的用户id

    private String utelephone;  //联系电话

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUId() {
        return uid;
    }

    public void setUId(Integer uid) {
        this.uid = uid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public String getTaddress() {
        return taddress;
    }

    public void setTaddress(String taddress) {
        this.taddress = taddress == null ? null : taddress.trim();
    }

    public String getTtime() {
        return ttime;
    }

    public void setTtime(String ttime) {
        this.ttime = ttime == null ? null : ttime.trim();
    }

    public String getTdescription() {
        return tdescription;
    }

    public void setTdescription(String tdescription) {
        this.tdescription = tdescription == null ? null : tdescription.trim();
    }


    public String getUtelephone() {
        return utelephone;
    }

    public void setUtelephone(String utelephone) {
        this.utelephone = utelephone == null ? null : utelephone.trim();
    }
}