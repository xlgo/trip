package cn.hnzxl.trip.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hnzxl.base.controller.BaseController;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.model.TripSubscription;
import cn.hnzxl.trip.project.service.TripSubscriptionService;
@Controller
@RequestMapping("/trip/tripsubscription/")
public class TripSubscriptionController  extends BaseController<TripSubscription, String> {
	@Autowired
	private TripSubscriptionService tripSubscriptionService;
	
	@Override
	public BaseService<TripSubscription, String> getBsetService() {
		return tripSubscriptionService;
	}

	@Override
	public Class<TripSubscription> getModelClass() {
		return TripSubscription.class;
	}
}