package com.youren.bbs.controller;

import com.youren.bbs.util.EmailUtil;
import com.youren.bbs.util.RandomCode;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;

@Controller
public class EmailController {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private Configuration configuration;
    /**
     * 邮箱发送验证码
     * @return
     */
    @ResponseBody
    @GetMapping("/sendEmail")
    public String  sendMail4Freemarker(String toEmail, HttpSession session){
        MimeMessage mMessage = javaMailSender.createMimeMessage();// 创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String code = RandomCode.RegisteredCode();
        session.setAttribute("eCode",code);//验证码存到session
        try {
            // 从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/email.properties"));
            String from = prop.get("mail.smtp.username") + "";
            mMessageHelper = new MimeMessageHelper(mMessage, true, "UTF-8");
            // 发件人邮箱
            mMessageHelper.setFrom(from);
            // 收件人邮箱
            mMessageHelper.setTo(toEmail);
            // 邮件的主题也就是邮件的标题
            mMessageHelper.setSubject("欢迎注册友人论坛");
            // 解析模板文件
            mMessageHelper.setText(EmailUtil.getText(configuration,code), true);
            javaMailSender.send(mMessage);// 发送邮件
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "ok";
    }


}
