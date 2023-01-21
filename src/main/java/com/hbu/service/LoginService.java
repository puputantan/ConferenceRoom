package com.hbu.service;

public interface LoginService {
     int backlogin(String username, String password);//登录不成功返回0

     int frontlogin(String username, String password);//登录不成功返回0

    int admineforgetpw(String username, String mailbox);//管理员忘记密码

    int userforgetpw(String username, String mailbox);//用户忘记密码

    int userregister(String username, String mailbox,String pw,String name,String department);//用户注册
}
