package com.youren.bbs.entity;


import lombok.Data;

/**
 * 帖子图片类
 */

@Data
public class PostImage {

    private String id;
    private Post post;//所属帖子
    private String url;//图片地址

}
