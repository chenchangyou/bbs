package com.youren.bbs.util;


import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

public class UploadFileUtil {

    public static String files(MultipartFile file){

        String originalFilename = file.getOriginalFilename();
        //获取上传文件的后缀名
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        //新文件名
        String newName =  UUID.randomUUID().toString() + suffix;

        return newName;
    }
}
