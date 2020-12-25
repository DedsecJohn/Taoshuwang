package com.swu.ssm.taoshuwang.service.impl;


import com.swu.ssm.taoshuwang.bean.User;
import com.swu.ssm.taoshuwang.constants.BookEnum;
import com.swu.ssm.taoshuwang.exception.TaoShuWangException;
import com.swu.ssm.taoshuwang.mapper.UserMapper;
import com.swu.ssm.taoshuwang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.print.Book;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/8/13
 * Description :
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String authCode, String code, User user) {

        if(code.equalsIgnoreCase(authCode)){
            //验证码输入正确，校验用户登录
            user = userMapper.selectOne(user);
           if(user == null){
                throw new TaoShuWangException(BookEnum.LOGIN_ERROR);
            }
        }else{
            throw new TaoShuWangException(BookEnum.AUTH_ERROR);
        }
        return user;
    }
}
