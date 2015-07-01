package cn.hnzxl.trip.system.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.hnzxl.base.util.MD5Util;
import cn.hnzxl.trip.project.model.SysUser;

@Controller
public class FileController {
	@RequestMapping("/upload")
	public ModelAndView upload(HttpServletRequest request, HttpServletResponse response) {
		Subject subject = SecurityUtils.getSubject();
		if(!subject.isAuthenticated()){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String md5Password = MD5Util.MD5(username+password);
		    UsernamePasswordToken token = new UsernamePasswordToken(username, md5Password);
		    try {
		    	subject.login(token);
		    	SysUser user = (SysUser)subject.getSession().getAttribute("currentUser");
		    	String identity = user.getUserRole();
		    	if("sys".equals(identity)){
		    		return new ModelAndView("redirect:admin");
		    	}
			} catch (AccountException e) {
				return new ModelAndView("login","msg",e.getMessage());
			} catch (Exception e) {
				return new ModelAndView("login","msg","用户名或者密码错误");
			}
		}
	    return new ModelAndView("redirect:index");
	}
	
	@RequestMapping("/download")
	public ModelAndView download(HttpServletRequest request, HttpServletResponse response) {
		
	    return new ModelAndView("login");
	}
}
