package com.wstro.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 * 
 * @author wangwh
 * @date 2017-09-27
 * @decription //@ControllerAdvice 捕捉@RequestMapping 注解的方法抛出的异常，
 *                          所有的异常处理返回json，则可用@RestControllerAdvice代替，省略@ResponseBody
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

	// public static final String DEFAULT_404_VIEW = "/pages/404";
	private Logger logger = LoggerFactory.getLogger(getClass());

	@ExceptionHandler(RRException.class)
	public R handleRRException(RRException e) {
		R r = new R();
		r.put("code", e.getCode());
		r.put("msg", e.getMessage());
		return r;
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public R handleDuplicateKeyException(DuplicateKeyException e) {
		logger.error(e.getMessage(), e);
		return R.error("数据库中已存在该记录");
	}

	@ExceptionHandler(AuthorizationException.class)
	public R handleAuthorizationException(AuthorizationException e) {
		logger.error(e.getMessage(), e);
		return R.error("没有权限，请联系管理员授权");
	}

	// 添加全局异常处理流程，根据需要设置需要处理的异常
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public Object MethodArgumentNotValidHandler(HttpServletRequest request, Exception exception) throws Exception {// 记录异常日志
		logger.error(exception.getMessage(), exception);
		return R.error();
	}

	// @ExceptionHandler(value = NoHandlerFoundException.class)
	// @ResponseStatus(HttpStatus.NOT_FOUND)
	// public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception
	// e) throws Exception {
	// logger.info("找不到页面...");
	// ModelAndView mav = new ModelAndView();
	// mav.addObject("exception", e);
	// mav.addObject("url", req.getRequestURL());
	// mav.setViewName(DEFAULT_404_VIEW);
	// return mav;
	// }

}