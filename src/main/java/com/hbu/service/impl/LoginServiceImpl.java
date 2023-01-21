package com.hbu.service.impl;

import com.hbu.dao.TUserMapper;
import com.hbu.entity.TUser;
import com.hbu.service.LoginService;
import com.hbu.utils.SendMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl  implements LoginService {
    @Autowired
    private TUserMapper tUserMapper;

    @Override
    public int frontlogin(String username, String password){
        String pw = tUserMapper.selectByUsername(username);
        if (pw == null){
            return -1;
        }
        else if(!pw.equals(password)){
            return 0;
        }else{
            return 1;
        }

    }

    @Override
    public int userforgetpw(String username, String mailbox) {

        String mail = tUserMapper.selectMailByUsername(username);
        System.out.println(mail);
        if (mail == null){
            return -1;
        }
        else if(!mail.equals(mailbox)){
            return 0;
        }else{
            String pw=tUserMapper.selectByUsername(username);
            SendMail.sendMessage(mail,"your password is："+pw);
            return 1;
        }
    }
    @Override
    public int userregister(String username, String mailbox,String pw,String name,String department){
        TUser user = tUserMapper.selectAllByUsername(username);
        if (user == null){
            //null means no registration
            TUser t = new TUser();
            t.setUsername(username);
            t.setMailbox(mailbox);
            t.setPassword(pw);
            t.setDepartment(department);
            t.setName(name);
            t.setIsdel(true);
            t.setStatus((short) 0);
        //Cannot be registered directly, need review (default is unprocessed)
            // return 1;
            if(tUserMapper.insert(t) !=0 ){
                return 1;
            }else{
                return 0;
            }
        } else{
            return 0;
        }

    }
}
