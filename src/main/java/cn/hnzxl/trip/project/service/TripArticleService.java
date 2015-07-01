package cn.hnzxl.trip.project.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.TripArticleMapper;
import cn.hnzxl.trip.project.model.TripArticle;

@Service
public class TripArticleService  extends BaseService<TripArticle, String> {
	
	@Resource
	private TripArticleMapper tripArticleMapper = null;
	
	@Override
	public BaseMapper<TripArticle, String> getBaseMapper() {
		return tripArticleMapper;
	}
}