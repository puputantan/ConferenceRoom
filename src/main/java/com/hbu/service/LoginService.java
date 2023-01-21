package com.hbu.service;

public interface LoginService {
     int backlogin(String username, String password);//If the login fails, return 0

     int frontlogin(String username, String password);//Unsuccessful return 0

    int admineforgetpw(String username, String mailbox);//Administrator forgot password

    int userforgetpw(String username, String mailbox);//user forgot password

    int userregister(String username, String mailbox,String pw,String name,String department);//user registration
}
