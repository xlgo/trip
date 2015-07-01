package cn.hnzxl.trip.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hnzxl.base.controller.BaseController;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.model.SysUser;
import cn.hnzxl.trip.project.service.SysUserService;
@Controller
@RequestMapping("/trip/sysuser/")
public class SysUserController  extends BaseController<SysUser, String> {
	@Autowired
	private SysUserService sysUserService;
	
	@Override
	public BaseService<SysUser, String> getBsetService() {
		return sysUserService;
	}

	@Override
	public Class<SysUser> getModelClass() {
		return SysUser.class;
	}
}