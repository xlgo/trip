package cn.hnzxl.trip.project.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.SysUserMapper;
import cn.hnzxl.trip.project.model.SysUser;

@Service
public class SysUserService  extends BaseService<SysUser, String> {
	
	@Resource
	private SysUserMapper sysUserMapper = null;
	
	@Override
	public BaseMapper<SysUser, String> getBaseMapper() {
		return sysUserMapper;
	}
}