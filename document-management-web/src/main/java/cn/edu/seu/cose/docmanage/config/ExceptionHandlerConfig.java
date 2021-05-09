package cn.edu.seu.cose.docmanage.config;

import cn.edu.seu.cose.docmanage.exception.SimpleException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ControllerAdvice
@Slf4j
public class ExceptionHandlerConfig {

    public static final String DEFAULT_ERROR_VIEW = "/error/simple";

    @ExceptionHandler(SimpleException.class)
    public ModelAndView simpleExceptionHandler(HttpServletRequest request, HttpServletResponse response, SimpleException e) {
        log.warn(String.format("%s %s : %s", request.getMethod(), request.getRequestURI(), e.getMessage()));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("error", e.getMessage());
        modelAndView.addObject("url", request.getRequestURL());
        modelAndView.setViewName(DEFAULT_ERROR_VIEW);
        return modelAndView;
    }

}
