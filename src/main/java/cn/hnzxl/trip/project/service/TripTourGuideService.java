package cn.hnzxl.trip.project.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.TripTourGuideMapper;
import cn.hnzxl.trip.project.model.TripTourGuide;

@Service
public class TripTourGuideService  extends BaseService<TripTourGuide, String> {
	
	@Resource
	private TripTourGuideMapper tripTourGuideMapper = null;
	
	@Override
	public BaseMapper<TripTourGuide, String> getBaseMapper() {
		return tripTourGuideMapper;
	}
}