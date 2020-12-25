package com.swu.ssm.taoshuwang.bean;

import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Company :  北京动力节点
 * Author :   Andy
 * Date : 2020/2/21
 * Description :
 */
@Table(name = "t_user")
public class User {

    @Id
    @KeySql(useGeneratedKeys = true)//可以获取自增的主键
    private String id;
    private String username;
    private String password;
    private Integer role;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
