package cn.hnzxl.trip.project;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import cn.hnzxl.trip.project.model.SysUser;
import cn.hnzxl.trip.project.service.SysUserService;

public class LoginRealm extends AuthorizingRealm {

	@Autowired
	private SysUserService sysUserService;

	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		String currentUsername = (String) super.getAvailablePrincipal(principalCollection);
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("userUsername", currentUsername);
		List<SysUser> users = sysUserService.selectAll(param);
		if (users.size() > 0 ) {
			SysUser user = users.get(0);
			SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
			if (StringUtils.isNoneBlank(user.getUserRole())) {
				simpleAuthorInfo.addStringPermissions(Arrays.asList(user.getUserRole().split("\\|")));
			}
			return simpleAuthorInfo;
		}
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {

		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		if (StringUtils.isEmpty(token.getUsername())) {
			throw new AccountException("");
		}
		// 此处无需比对,比对的逻辑Shiro会做,我们只需返回一个和令牌相关的正确的验证信息
		// 说白了就是第一个参数填登录用户名,第二个参数填合法的登录密码(可以是从数据库中取到的,本例中为了演示就硬编码了)
		// 这样一来,在随后的登录页面上就只有这里指定的用户和密码才能通过验证
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("userUsername", token.getUsername());
		List<SysUser> users = sysUserService.selectAll(param);
		if (users.size() == 0) {
			throw new AccountException("用户名不存在");
		}
		SysUser user = sysUserService.selectByPrimaryKey(token.getUsername());
		AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUserName(), user.getUserPassword(),
				this.getName());
		this.setSession("currentUser", user);
		return authcInfo;
	}

	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}

}
