package com.swu.ssm.taoshuwang.controller;

import com.swu.ssm.taoshuwang.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/20
 * Description :
 */
@Controller
public class HomeController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping({"/","/index","/home"})
    public String home(Model model, Integer tid){

        //查询最新发布的文章
        List<Map<String,Object>> latestArticles = articleService.latest10();

        int type = 0;
        List<Map<String,Object>> articlesByTag = null;
        if(tid != null){
            //根据标签主键查询该标签下的文章
          articlesByTag = articleService.articlesByTag(tid);
            type = 1;
        }
        //查询热门文章
        List<Map<String,Object>> hotArticles = articleService.hotArticles();


        model.addAttribute("latestArticles",latestArticles);
        model.addAttribute("hotArticles",hotArticles);
        model.addAttribute("articlesByTag",articlesByTag);
        model.addAttribute("type",type);
       return "../../mby/home";
    }



}
