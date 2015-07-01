package cn.hnzxl.trip.project.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.TripSubscriptionMapper;
import cn.hnzxl.trip.project.model.TripSubscription;

@Service
public class TripSubscriptionService  extends BaseService<TripSubscription, String> {
	
	@Resource
	private TripSubscriptionMapper tripSubscriptionMapper = null;
	
	@Override
	public BaseMapper<TripSubscription, String> getBaseMapper() {
		return tripSubscriptionMapper;
	}
}