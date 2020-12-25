package com.swu.ssm.taoshuwang.service;


import com.swu.ssm.taoshuwang.bean.User;

public interface AdminService {

    User login(String authCode, String code, User user);
}
