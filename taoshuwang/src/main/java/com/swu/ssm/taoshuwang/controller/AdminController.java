package com.swu.ssm.taoshuwang.controller;


import com.swu.ssm.taoshuwang.bean.User;
import com.swu.ssm.taoshuwang.constants.BookConstants;
import com.swu.ssm.taoshuwang.exception.TaoShuWangException;
import com.swu.ssm.taoshuwang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/toLogin")
    public String toLogin(){
        return "/login";
    }

    //登录校验 request session servletContext
    @RequestMapping("/login")
    public String login(HttpSession session, String authCode, User user, Model model){
        //从session中获取正确的验证码
        String code = (String) session.getAttribute("authCode");
        try {
            user = adminService.login(authCode, code, user);
            session.setAttribute(BookConstants.LOGIN_USER,user);
        }catch (TaoShuWangException e1){
            model.addAttribute("message",e1.getMessage());
            model.addAttribute("message",user);
            //转发到登录页面
            return "/login";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/articleList";
    }


    //登出
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        //将登录用户移除session
        session.removeAttribute(BookConstants.LOGIN_USER);
        //转发到登录页面
        return "/login";
    }
}
