package com.youren.bbs.util;


import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 发送验证码
 */
@Service
public class EmailUtil {

    public static String getText(Configuration freeMarkerConfiguration,String code) {
        String txt = "";
        try {
            Template template = freeMarkerConfiguration.getTemplate("email.ftl");
            // 通过map传递动态数据
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("username", "用户");
            map.put("validCode", code);
            map.put("dateTime",new Date());
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


