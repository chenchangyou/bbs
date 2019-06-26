package com.youren.bbs.util;

import java.util.Random;

/**
 * @author: Administrator
 * @Description: 生成一个6位的随机数工具（验证码）
 */
public class RandomCode {

    public static String RegisteredCode(){
        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder(6);
        for(int i=0;i<6;i++)
        {
            char ch=str.charAt(new Random().nextInt(str.length()));
            sb.append(ch);
        }
        return sb.toString();
    }
}