package cn.hnzxl.base.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import cn.hnzxl.trip.project.model.SysUser;

/**
 * 获取session 中的一些信息
 * @author ZXL
 * @date 2014年11月10日 上午12:08:29
 *
 */
public class SessionUtil {
	/**
	 * 获取属性值
	 * @param attr
	 * @return
	 */
	public static Object getAttribute(String attr){
		return getSession().getAttribute(attr);
	}
	/**
	 * 获取当前登陆用户的信息
	 * @return
	 */
	public static SysUser getCurrentUser(){
		return (SysUser)getAttribute("currentUser");
	}
	private static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
	private static Session getSession(){
		return getSubject().getSession();
	}
}
