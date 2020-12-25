package com.swu.ssm.taoshuwang.service.impl;

import com.swu.ssm.taoshuwang.bean.Tag;
import com.swu.ssm.taoshuwang.mapper.TagMapper;
import com.swu.ssm.taoshuwang.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/16
 * Description :
 */
@Service("tagService")
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    public List<Tag> queryTags() {
        return tagMapper.selectAll();
    }
}
