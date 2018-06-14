package com.zzuli.pojo;

public class Admin {
    private Integer aid;

    private String aname;

    private String apassword;

    private Boolean issuper;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname == null ? null : aname.trim();
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword == null ? null : apassword.trim();
    }

    public Boolean getIssuper() {
        return issuper;
    }

    public void setIssuper(Boolean issuper) {
        this.issuper = issuper;
    }
}