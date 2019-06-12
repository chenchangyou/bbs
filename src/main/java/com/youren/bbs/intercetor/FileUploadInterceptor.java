package com.youren.bbs.intercetor;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 文件上传拦截器
 */
public class FileUploadInterceptor implements HandlerInterceptor {

    private long maxSize;

    public void setMaxSize(long maxSize) {
        this.maxSize = maxSize;
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        if(request!=null && ServletFileUpload.isMultipartContent(request)) {
            ServletRequestContext ctx = new ServletRequestContext(request);
            long requestSize = ctx.contentLength();
            if (requestSize > maxSize) {
                throw new MaxUploadSizeExceededException(maxSize);
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }

}
