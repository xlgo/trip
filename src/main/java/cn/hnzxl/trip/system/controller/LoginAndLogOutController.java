package cn.hnzxl.trip.system.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.hnzxl.base.util.MD5Util;
import cn.hnzxl.trip.project.model.SysUser;

@Controller
public class LoginAndLogOutController {
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
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
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
	    return new ModelAndView("login");
	}
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("redirect:page/index");
	}
	@RequestMapping("/admin")
	public ModelAndView admin(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("admin");
	}
	
	@RequestMapping("heartbeat")
	@ResponseBody
	public Object heartbeat(){
		Map<String,Object> res =new HashMap<String,Object>();
		res.put("timestamp", new Date().getTime());
		res.put("status", "success");
		return res;
	}
}
