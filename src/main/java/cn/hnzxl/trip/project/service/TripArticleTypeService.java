package cn.hnzxl.trip.project.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.TripArticleTypeMapper;
import cn.hnzxl.trip.project.model.TripArticleType;

@Service
public class TripArticleTypeService  extends BaseService<TripArticleType, String> {
	
	@Resource
	private TripArticleTypeMapper tripArticleTypeMapper = null;
	
	@Override
	public BaseMapper<TripArticleType, String> getBaseMapper() {
		return tripArticleTypeMapper;
	}
}