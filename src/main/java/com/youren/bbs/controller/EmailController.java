package com.youren.bbs.controller;


import com.youren.bbs.entity.User;
import com.youren.bbs.mapper.UserMapper;
import com.youren.bbs.service.UserService;
import com.youren.bbs.util.RandomCode;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Controller
public class EmailController

{
    private JavaMailSender javaMailSender;
    private Configuration configuration;

    public void init() {
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.javaMailSender = (JavaMailSender)classPathXmlApplicationContext.getBean(org.springframework.mail.javamail.JavaMailSenderImpl.class);
        this.configuration = (Configuration)classPathXmlApplicationContext.getBean(Configuration.class);
    }

    @Autowired
    private UserMapper userMapper;


    @ResponseBody
    @PostMapping("/sendEmail")
    public int sendMail(HttpSession session, String toEmail,String username) throws IOException {
        if (toEmail == null || toEmail.equals("")) {
            return  0;
        }
        if (!toEmail.contains("@")) {
            return 1;
        }
        String validCode = RandomCode.RegisteredCode();
        session.setAttribute("validCode", validCode);
        init();
        sendMail4Freemarker(toEmail, validCode,username);
        return 2;
    }
    @ResponseBody
    @PostMapping("/resetSendEmail")
    public Map<String,Object> resetSendMail(HttpSession session, String toEmail,String username) throws IOException {

        User byUsername = userMapper.findByUsername(username);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("ok",false);

        if(byUsername!=null){
            if(byUsername.getEmail().equals(toEmail)){
                map.put("ok",true);
                String validCode = RandomCode.RegisteredCode();
                session.setAttribute("validCode", validCode);
                init();
                sendMail4Freemarker(toEmail, validCode,username);
            }else {
                map.put("error","邮箱与账户名绑定的不一致");
            }
        }else {
            map.put("error","账户名不存在，请确认");
        }
        return map;
    }

    public void sendMail4Freemarker(String email, String validCode,String username) {
        MimeMessage mMessage = this.javaMailSender.createMimeMessage();

        Properties prop = new Properties();

        try {
            prop.load(getClass().getResourceAsStream("/email.properties"));
            String from = prop.get("mail.smtp.username") + "";
            MimeMessageHelper mMessageHelper = new MimeMessageHelper(mMessage, true, "UTF-8");

            mMessageHelper.setFrom(from);

            mMessageHelper.setTo(email);

            mMessageHelper.setSubject("邮箱验证");

            mMessageHelper.setText(getText(this.configuration, email, validCode,username), true);
            this.javaMailSender.send(mMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private String getText(Configuration freeMarkerConfiguration, String email, String validCode,String username) {
        String txt = "";
        try {
            Template template = freeMarkerConfiguration.getTemplate("email.ftl");

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("username", username);
            map.put("validCode", validCode);

            txt = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return txt;
    }

    /*public String getRandomString() {
        String str = "0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 6; i++) {
            int number = random.nextInt(6);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }*/
}
