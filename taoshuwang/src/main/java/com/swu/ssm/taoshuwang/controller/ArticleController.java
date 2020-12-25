package com.swu.ssm.taoshuwang.controller;

import com.swu.ssm.taoshuwang.bean.Article;
import com.swu.ssm.taoshuwang.bean.ArticleVo;
import com.swu.ssm.taoshuwang.bean.User;
import com.swu.ssm.taoshuwang.constants.BlogConstants;
import com.swu.ssm.taoshuwang.constants.BookConstants;
import com.swu.ssm.taoshuwang.service.ArticleService;
import com.swu.ssm.taoshuwang.util.FileUploadUtil;
import com.swu.ssm.taoshuwang.util.PageHelpUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/14
 * Description :
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;


    //查询文章列表
    //列表、多条件模糊查询、分页查询
    @RequestMapping("/articleList")
    public String articleList(Model model,
                              @RequestParam(defaultValue = "1") int page,
                              ArticleVo articleVo){
        //参数1:页码    参数2:每页记录数 limit a,b
        //该行代码等同于limit a,b 该行代码得放在查询数据之前
        PageHelper.startPage(page, BookConstants.PAGE_SIZE);
        //查询所有文章列表数据
        List<Map<String,Object>> articles = articleService.articleList(articleVo);
        //PageInfo的泛型:查询结果集的泛型
        PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(articles);


        //使用老师的工具类解决页码显示和查询条件丢失问题
        /*
        参数1:每次点击页码的时候的请求地址
        参数2:pageInfo
        参数3:map:专门用于放置查询条件
         */
        //点击页码查询条件封装
        Map<String,Object> params =  new HashMap<>();
        params.put("tid",articleVo.getTid());
        params.put("title",articleVo.getTitle());
        params.put("start",articleVo.getStart());
        params.put("end",articleVo.getEnd());
        String pages =
                PageHelpUtil.bootStrapPage("/mby/articleList", pageInfo, params);

        //将生成的页码信息传到前台
        model.addAttribute("pages",pages);
        model.addAttribute("articles",pageInfo.getList());

        //将tid回显
        if(articleVo.getTid() != null && articleVo.getTid() != -1){
            model.addAttribute("tid",articleVo.getTid());
        }

        //查询条件回显
        model.addAttribute("articleVo",articleVo);
        return "/article/article_list";
    }

    //跳转到文章添加页面
    @RequestMapping("/toAddArticle")
    public String toAddArticle(){
        return "/article/article_add";
    }

    //上传文件
    @RequestMapping("/fileUpload")
    public @ResponseBody Map<String,Object> fileUpload(MultipartFile img,
                                                       HttpSession session){
        Map<String, Object> mess = FileUploadUtil.fileUpload(img, session);
        return mess;
    }

    //添加或者编辑文章
    @RequestMapping("/addOrUpdateArticle")
    public String addOrUpdateArticle(Article article,HttpSession session){
        try{
            User user = (User) session.getAttribute(BlogConstants.LOGIN_USER);
            article.setUid(user.getId());
            articleService.addOrUpdateArticle(article);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/articleList";
    }

    //跳转到查看或者编辑页面
    @RequestMapping("/queryById/{aid}/{view}")
    public String queryById(@PathVariable("aid") int aid,
                            @PathVariable("view")String view,
                            Model model){
        Map<String,Object> article = articleService.queryById(aid);
        model.addAttribute("article",article);
        return "/article/"+ view;
    }

    //单删或批删
    @RequestMapping("/deleteBatch")
    public String deleteBatch(String aids){
        articleService.deleteBatch(aids);
        return "redirect:/articleList";
    }
}
