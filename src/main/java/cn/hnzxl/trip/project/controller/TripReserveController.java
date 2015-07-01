package cn.hnzxl.trip.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hnzxl.base.controller.BaseController;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.model.TripReserve;
import cn.hnzxl.trip.project.service.TripReserveService;
@Controller
@RequestMapping("/trip/tripreserve/")
public class TripReserveController  extends BaseController<TripReserve, String> {
	@Autowired
	private TripReserveService tripReserveService;
	
	@Override
	public BaseService<TripReserve, String> getBsetService() {
		return tripReserveService;
	}

	@Override
	public Class<TripReserve> getModelClass() {
		return TripReserve.class;
	}
}