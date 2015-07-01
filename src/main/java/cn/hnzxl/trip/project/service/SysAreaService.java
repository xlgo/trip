package cn.hnzxl.trip.project.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.SysAreaMapper;
import cn.hnzxl.trip.project.model.SysArea;

@Service
public class SysAreaService  extends BaseService<SysArea, String> {
	
	@Resource
	private SysAreaMapper sysAreaMapper = null;
	
	@Override
	public BaseMapper<SysArea, String> getBaseMapper() {
		return sysAreaMapper;
	}
}