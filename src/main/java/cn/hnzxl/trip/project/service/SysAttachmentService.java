package cn.hnzxl.trip.project.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.SysAttachmentMapper;
import cn.hnzxl.trip.project.model.SysAttachment;

@Service
public class SysAttachmentService  extends BaseService<SysAttachment, String> {
	
	@Resource
	private SysAttachmentMapper sysAttachmentMapper = null;

	@Override
	public SysAttachmentMapper getBaseMapper() {
		return sysAttachmentMapper;
	}
	
	public int deleteByParam(Map<String, Object> params){
		return this.getBaseMapper().deleteByParam(params);
	}
}