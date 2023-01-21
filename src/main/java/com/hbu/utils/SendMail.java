package com.hbu.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * caipuyu
 * 2023/01/21
 * refer to：https://blog.csdn.net/qq_35794278/article/details/80793641
 * https://blog.csdn.net/qq_41151659/article/details/96475739
 */
public class SendMail {
    public static int sendMessage(String receiver,String messagecontent){
        //Do the preparatory work before linking, that is, parameter initialization
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host","smtp.qq.com");//Send mail server
        properties.setProperty("mail.smtp.port","465");//send port
        properties.setProperty("mail.smtp.auth","true");//whether to enable permission control
        properties.setProperty("mail.debug","true");//true print information to the console
        properties.setProperty("mail.transport","smtp");//The protocol sent is a simple mail transfer protocol
        properties.setProperty("mail.smtp.ssl.enable","true");
        //create a link between two points
        System.out.println("executed 2");
        Session session = Session. getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("qq mailbox","key");
            }
        });
        System.out.println("executed 3");
        //Create mail object
        Message message = new MimeMessage(session);
        // set sender
        try {
            message.setFrom(new InternetAddress("qq mailbox"));

            // set the recipient
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));//Recipient
            // set the theme
            message.setSubject("The result of your application for the conference room management system of the School of Management has come out, please pay attention to check!");
            //Set the mail body The second parameter is the type of mail sending
            message.setContent(messagecontent,"text/html;charset=UTF-8");
            //send an email
            Transport transport = session. getTransport();
            transport.connect("QQ mailbox","Key");
            Transport. send(message);
            System.out.println("executed");
        } catch (MessagingException e) {
            e.printStackTrace();
        }finally {

        }
        return 1;

    }
    public static int sendMessage(String receiver,String messagecontent,String title){
        //Do the preparatory work before linking, that is, parameter initialization
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host","smtp.qq.com");//Send mail server
        properties.setProperty("mail.smtp.port","465");//send port
        properties.setProperty("mail.smtp.auth","true");//whether to enable permission control
        properties.setProperty("mail.debug","true");//true print information to the console
        properties.setProperty("mail.transport","smtp");//The protocol sent is a simple mail transfer protocol
        properties.setProperty("mail.smtp.ssl.enable","true");
        //create a link between two points
        System.out.println("executed 2");
        Session session = Session. getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("qq mailbox","key");
            }
        });
        System.out.println("executed 3");
        //Create mail object
        Message message = new MimeMessage(session);
        // set sender
        try {
            message.setFrom(new InternetAddress("qq mailbox"));

            // set the recipient
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));//Recipient
            // set the theme
            message.setSubject("The result of your application for the conference room management system of the School of Management has come out, please pay attention to check!");
            //Set the mail body The second parameter is the type of mail sending
            message.setContent(messagecontent,"text/html;charset=UTF-8");
            //send an email
            Transport transport = session. getTransport();
            transport.connect("mailbox","key");
            Transport. send(message);
            System.out.println("executed");
        } catch (MessagingException e) {
            e.printStackTrace();
        }finally {

        }
        return 1;
    }
}
