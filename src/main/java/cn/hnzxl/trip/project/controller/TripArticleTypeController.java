package cn.hnzxl.trip.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hnzxl.base.controller.BaseController;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.model.TripArticleType;
import cn.hnzxl.trip.project.service.TripArticleTypeService;
@Controller
@RequestMapping("/trip/triparticletype/")
public class TripArticleTypeController  extends BaseController<TripArticleType, String> {
	@Autowired
	private TripArticleTypeService tripArticleTypeService;
	
	@Override
	public BaseService<TripArticleType, String> getBsetService() {
		return tripArticleTypeService;
	}

	@Override
	public Class<TripArticleType> getModelClass() {
		return TripArticleType.class;
	}
}