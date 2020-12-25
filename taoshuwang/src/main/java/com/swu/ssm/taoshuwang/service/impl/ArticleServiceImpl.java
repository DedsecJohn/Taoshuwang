package com.swu.ssm.taoshuwang.service.impl;

import com.swu.ssm.taoshuwang.bean.Article;
import com.swu.ssm.taoshuwang.bean.ArticleVo;
import com.swu.ssm.taoshuwang.mapper.ArticleMapper;
import com.swu.ssm.taoshuwang.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/14
 * Description :
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<Map<String, Object>> articleList(ArticleVo articleVo) {
        return articleMapper.articleList(articleVo);
    }

    @Override
    public void addOrUpdateArticle(Article article) {
        article.setVisit_count(0);
        article.setIs_hot(0);
        article.setUpdate_time(new Date());


        if(article.getAid() != null){
            //修改
            articleMapper.updateByPrimaryKeySelective(article);
        }else{
            article.setCreate_time(new Date());
            articleMapper.insertSelective(article);
        }

    }

    @Override
    public Map<String, Object> queryById(int aid) {

        return articleMapper.queryById(aid);
    }

    @Override
    public void deleteBatch(String aids) {
        String[] ids = aids.split(",");
        for (String id : ids) {
            articleMapper.deleteByPrimaryKey(id);
        }
    }

    @Override
    public List<Map<String, Object>> latest10() {
        List<Map<String, Object>> articles =  articleMapper.latest10();
        return articles;
    }

    @Override
    public List<Map<String, Object>> hotArticles() {
        List<Map<String, Object>> articles =  articleMapper.hotArticles();
        return articles;
    }

    @Override
    public List<Map<String, Object>> articlesByTag(int tid) {
        List<Map<String, Object>> articles =  articleMapper.articlesByTag(tid);
        return articles;
    }
}
