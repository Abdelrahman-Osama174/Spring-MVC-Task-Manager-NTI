package com.mvcdemo.exceptions;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalException {

    @ExceptionHandler(TaskNotFoundException.class)
    public String handleNotFound(TaskNotFoundException ex, Model model) {
        model.addAttribute("message", ex.getMessage());
        return "error/not-found";
    }

    @ExceptionHandler(Exception.class)
    public String handleUnexpected(Exception ex, Model model) {
        model.addAttribute("message", "Something went wrong.\n" + ex.getMessage());
        return "error/general";
    }


}
