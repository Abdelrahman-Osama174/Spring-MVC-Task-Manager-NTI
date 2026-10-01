package com.mvcdemo.interceptors;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.logging.Logger;

public class RequestTimingInterceptor implements HandlerInterceptor {

    Logger logger = Logger.getLogger(RequestTimingInterceptor.class.getName());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        request.setAttribute("startTime", System.currentTimeMillis());
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        long startTime = (Long) request.getAttribute("startTime");
        long duration = System.currentTimeMillis() - startTime;

        logger.info( request.getRequestURI()+  + duration + " ms");
        logger.info( request.getMethod() + " " + request.getRequestURI() + " - Response timing: " + duration + " ms" );
    }
}