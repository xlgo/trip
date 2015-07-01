package cn.hnzxl.trip.project.dao;

import java.util.Map;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.trip.project.model.SysAttachment;

public interface SysAttachmentMapper extends BaseMapper<SysAttachment, String>{
	int deleteByParam(Map<String, Object> params);
}