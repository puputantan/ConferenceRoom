package com.hbu.web;

import com.google.gson.Gson;
import com.hbu.models.*;
import com.hbu.service.*;
import com.hbu.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

/**
 * front-controller
 * 2023/1/19
 */
@Controller
@RequestMapping("/front")
public class FrontController extends BaseController{
    private static Gson gson = new Gson();//A tool to convert objects into json type strings
    //Inject service dependencies
    @Autowired
    private LoginService loginService;
    @Autowired
    private UserManageService userManageService;

    //1. Front desk login front/login
    @RequestMapping(value = "userLogin", method = RequestMethod.POST)
    @ResponseBody
    private Result<String> login(@RequestBody HashMap<String, String> map) {
        String username = map.get("username");
        String password = map.get("password");
        System.out.println("$$$$$$ The input parameters of the /front/login method are:username="+username+",password="+password);
        Result<String> result=new Result<String>();
        int tAdmin=loginService.frontlogin(username,password);
        if(tAdmin==-1) {
            result.setCode("999999");
            result.setMessage("User does not exist");
        }else if (tAdmin==0){
            result.setCode("888888");
            result.setMessage("Incorrect password");
        } else {
            result.setCode("000000");
            result.setMessage("login successful");
            /**
             * Set the cookie and save it in redis.
             * But the value of redis is currently the username value. . . . It should actually be uuid (you can also randomize the username)
             */
            String token=getId().replace("-", "");
            RedisUtil.set(token,String.valueOf(username));
            result.setCode("000000");
            result.setMessage("login successful");
            result.setData(token);
        }
        System.out.println("$$$$$$ The input parameters of the /front/login method are:username="+username+",password="+password+"The return parameters of the /front/login method:"+gson.toJson(result));
        return result;
    }

    /**
     * User forgets password, send email interface
     */
    @RequestMapping(value = "userforgetpw", method = RequestMethod.GET)
    @ResponseBody
    private Result<String> forgetpw( @RequestParam("username") String username, @RequestParam("mailbox") String mailbox ) {
        System.out.println("$$$$$$ The input parameters of the /front/login method are: username="+username+",mailbox="+mailbox);
        Result<String> result=new Result<String>();
        int tAdmin=loginService.userforgetpw(username,mailbox);

        if(tAdmin==-1) {
            result.setCode("999999");
            result.setMessage("User does not exist");
        }else if (tAdmin==0){
            result.setCode("888888");
            result.setMessage("Incorrect email");
        } else {
            result.setCode("000000");
            result.setMessage("send successful");
        }
        System.out.println("$$$$$$ The input parameters of the /front/login method are: username="+username+",mailbox="+mailbox+"The return parameters of the /front/login method:"+gson.toJson(result));
        return result;
    }
      /**
     * user registration
     */
    @RequestMapping(value = "register", method = RequestMethod.GET)
    @ResponseBody
    private Result<String> register( @RequestParam("username") String username,@RequestParam("department")String department,@RequestParam("name")String name ,@RequestParam("mailbox") String mailbox ,@RequestParam("password")String password ) {
        Result<String> result=new Result<String>();
        int tAdmin=loginService.userregister(username,mailbox,password,name,department);

        if(tAdmin != 1) {
            result.setCode("999999");
            result.setMessage("User already exists");
        } else {
            result.setCode("000000");
            result.setMessage("registration success");
        }
        return result;
    }
}
