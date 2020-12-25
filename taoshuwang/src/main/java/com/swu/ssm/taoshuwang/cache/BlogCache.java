package com.swu.ssm.taoshuwang.cache;

import com.bjpowernode.ssm.blog.bean.Tag;
import com.bjpowernode.ssm.blog.mapper.ArticleMapper;
import com.bjpowernode.ssm.blog.mapper.TagMapper;
import com.bjpowernode.ssm.blog.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/23
 * Description :
 */
@Component
public class BlogCache {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private TagMapper tagMapper;

    @Autowired
    private RedisUtil redisUtil;

    //初始化基本信息，将常见查询的数据缓存到Redis中
    @PostConstruct
    public void initDate(){
        //查询最新发布的文章
        List<Map<String,Object>> latestArticles = articleMapper.latest10();

        //将最新发布的文章数据缓存到Redis中   List<Map<String,Object>>
        redisUtil.writeDateToRedis(latestArticles,"latestArticle",2);


        //将所有栏目数据放入到Redis中 List<T>
        List<Tag> tags = tagMapper.selectAll();
        redisUtil.writeDateToRedis(tags,Tag.class,"tag",2);

    }
}
