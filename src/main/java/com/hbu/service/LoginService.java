package com.hbu.service;

public interface LoginService {

    int frontlogin(String username, String password);//Unsuccessful return 0

    int userforgetpw(String username, String mailbox);//user forgot password

    int userregister(String username, String mailbox,String pw,String name,String department);//user registration
}
