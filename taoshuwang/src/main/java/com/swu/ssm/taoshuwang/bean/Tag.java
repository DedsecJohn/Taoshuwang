package com.swu.ssm.taoshuwang.bean;

import javax.persistence.Table;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/7/19
 * Description :
 */
@Table(name ="t_tag")
public class Tag {
    private Integer tid;
    private String tname;
    private String tag_icon;

    @Override
    public String toString() {
        return "Tag{" +
                "tid=" + tid +
                ", tname='" + tname + '\'' +
                ", tag_icon='" + tag_icon + '\'' +
                '}';
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTag_icon() {
        return tag_icon;
    }

    public void setTag_icon(String tag_icon) {
        this.tag_icon = tag_icon;
    }
}
