package trip.project;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import cn.hnzxl.trip.project.model.SysUser;
import cn.hnzxl.trip.project.service.SysUserService;
import base.BaseTestMybatis;

public class SysUserTest extends BaseTestMybatis{
	@Autowired
	private SysUserService sysUserService;
	
	@Test
	@Rollback(false)
	public void testAdd(){
		SysUser user = new SysUser();
		user.setId("001");
		user.setUserName("张三丰");
		sysUserService.insert(user);
	}
}
