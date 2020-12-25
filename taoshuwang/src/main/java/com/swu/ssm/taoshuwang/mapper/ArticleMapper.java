package com.swu.ssm.taoshuwang.mapper;

import com.swu.ssm.taoshuwang.bean.Article;
import com.swu.ssm.taoshuwang.bean.ArticleVo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface ArticleMapper extends Mapper<Article> {
    List<Map<String, Object>> articleList(ArticleVo articleVo);

    Map<String, Object> queryById(int aid);

    List<Map<String, Object>> latest10();

    List<Map<String, Object>> hotArticles();

    List<Map<String, Object>> articlesByTag(@Param("tid") int tid);
}
