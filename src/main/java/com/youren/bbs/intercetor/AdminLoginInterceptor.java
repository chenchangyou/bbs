package com.youren.bbs.intercetor;

import com.youren.bbs.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLoginInterceptor implements HandlerInterceptor {
    //首先会执行的方法
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        //   boolean flag = false;
        //获取请求资源
        String requestURI = request.getRequestURI();
        //指定不拦截的路径


        //指定拦截的路径，需要登录才可以进入的页面
        final String[] PRE_UNIGNORE_URI = {
               "/admin/indexs","/admin/postlist","/admin/reply/","/admin/userlist",
                "/admin/notice/list","/admin/carouse/list","/admin/category/list","/admin/index"
        };

        //jsp获得当前页面名称 sunString：截取一部分   requestURI.lastIndexOf：表示从uri的最后一个/开始截取
        //比如uri是"C:/abc/edf/123.txt" ,结果就是/123   截取最后一个/和.之间的部分
        String uri = requestURI.substring(requestURI.lastIndexOf("/"));
        //这部分url是特定的，不拦截。   return true表示放行
        if (uri.startsWith("/admin/") || uri.startsWith("/admin/out") || uri.startsWith("/register")|| uri.startsWith("/admin/login")) {
            return true;
        }

        //从session中获取对象
        User user = (User) request.getSession().getAttribute("loginAdmin");
        //执行循环，依次取出要拦截的字段，如果请求的url中包含该字段，flag=true
        for (String preURI : PRE_UNIGNORE_URI) {
            if (requestURI.contains(preURI)) {
//                flag = true;
                if(user!=null){
                    return true;
                }else{
                    String loginUrl = "/admin/";
                    response.sendRedirect(request.getContextPath() + loginUrl);

                }
            }
        }

//        //有个页面要拦截，判断一下用户是否已经登录: 登录就放行，未登录就拦截
//        if (flag==true) {  //flag为真，表示是拦截的字段，并且session中没有这个用户，就重定向到登录页面

        return true;

    }

    //返回ModelAndView之前执行的方法，面向切面编程中的体现，已经进入了controller
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
//        System.out.println("进入了postHandle。。。。。。");
    }

    //执行Handle完成之后执行的方法
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
//        System.out.println("进入了afterHandle。。。。。。");
    }

}
