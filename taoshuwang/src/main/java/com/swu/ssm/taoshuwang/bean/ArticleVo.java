package com.swu.ssm.taoshuwang.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/16
 * Description :
 * 专门封装文章列表页面复杂查询
 */
public class ArticleVo {

    private Integer tid;
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date end;

    @Override
    public String toString() {
        return "ArticleVo{" +
                "tid=" + tid +
                ", title='" + title + '\'' +
                ", start=" + start +
                ", end=" + end +
                '}';
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }
}
