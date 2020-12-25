package com.swu.ssm.taoshuwang.constants;

/**
 * 定义项目中的消息内容和类型
 * 消息类型:和业务有关系
    业务状态码,001 002 003
 * 登录业务:
 * 文章增删改
 */
public enum BookEnum {


    AUTH_ERROR("001","验证码错误"),
    LOGIN_ERROR("001","用户名或密码错误"),
    TYPE_MISMATCH("001","只能上传png,jpg,gif格式的图片"),
    MAX_SIZE("001","上传文件大小不能>2M");

    private String code;
    private String mess;


    BookEnum(String code, String mess){
        this.code = code;
        this.mess = mess;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
}
