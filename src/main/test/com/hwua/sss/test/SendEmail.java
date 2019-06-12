package com.hwua.sss.test;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

public class SendEmail {

    private JavaMailSender javaMailSender;

    private String toEmail = "1554693372@qq.com";//接收端的邮箱（收件人邮箱）

    private Configuration configuration;

    @Before
    public void init(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        javaMailSender = context.getBean(JavaMailSenderImpl.class);
        configuration = context.getBean(Configuration.class);
    }

    @Test
    public void sendMail() {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();//创建邮件对象
        MimeMessageHelper mimeMessageHelper;
        Properties prop = new Properties();
        Boolean type = true;
        String text = "<h1 style='color:orange;'>嘿嘿嘿</h1>";
        try {
            // 从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/email.properties"));
            String from = prop.get("mail.smtp.username") + "";
            mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            // 发件人邮箱
            mimeMessageHelper.setFrom(from);
            // 收件人邮箱
            mimeMessageHelper.setTo(toEmail);
            // 邮件的主题也就是邮件的标题
            mimeMessageHelper.setSubject("这是普通邮件！");
            // 邮件的文本内容，true表示文本以html格式打开
            if (type) {
                mimeMessageHelper.setText(text, true);
            } else {
                mimeMessageHelper.setText(text, false);
            }

            //添加附件
            FileSystemResource fileSystemResource = new FileSystemResource("D:\\userdata.txt");
            mimeMessageHelper.addAttachment("userdata.txt", fileSystemResource);

            javaMailSender.send(mimeMessage);// 发送邮件
            System.out.println("发送邮箱成功！");
        }catch (MessagingException e) {
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    @Test
    public void sendMail4Freemarker(){
        MimeMessage mMessage = javaMailSender.createMimeMessage();// 创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
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
            mMessageHelper.setSubject("这是freemarker模板邮件！");
            // 解析模板文件
            mMessageHelper.setText(getText(configuration), true);
            javaMailSender.send(mMessage);// 发送邮件
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取freemarker模板的方法
     */
    private String getText(Configuration freeMarkerConfiguration) {
        String txt = "";
        try {
            Template template = freeMarkerConfiguration.getTemplate("email.ftl");
            // 通过map传递动态数据
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("username", "rainmean");
            map.put("validCode", UUID.randomUUID());
            // 解析模板文件
            txt = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
            System.out.println("getText()->>>>>>>>>");// 输出的是HTML格式的文档
            System.out.println(txt);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return txt;
    }
}
