package com.swu.ssm.taoshuwang.service;

import com.bjpowernode.ssm.blog.bean.Article;
import com.bjpowernode.ssm.blog.bean.ArticleVo;

import java.util.List;
import java.util.Map;

public interface ArticleService {
    List<Map<String, Object>> articleList(ArticleVo articleVo);

    void addOrUpdateArticle(Article article);

    Map<String, Object> queryById(int aid);

    void deleteBatch(String aids);

    List<Map<String, Object>> latest10();

    List<Map<String, Object>> hotArticles();

    List<Map<String, Object>> articlesByTag(int tid);
}
