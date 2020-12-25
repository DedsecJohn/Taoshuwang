package com.swu.ssm.taoshuwang.controller;

import com.swu.ssm.taoshuwang.bean.Tag;
import com.swu.ssm.taoshuwang.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/16
 * Description :
 */
@Controller
public class TagController {

    @Autowired
    private TagService tagService;

    @RequestMapping("/queryTags")
    @ResponseBody
    public List<Tag> queryTags(){
        List<Tag> tags = tagService.queryTags();
        return tags;
    }

    //根据标签查询文章


}
