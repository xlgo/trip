package cn.hnzxl.trip.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.hnzxl.base.controller.BaseController;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.model.TripArticle;
import cn.hnzxl.trip.project.service.TripArticleService;
import cn.hnzxl.trip.project.service.TripArticleTypeService;
@Controller
@RequestMapping("/trip/triparticle/")
public class TripArticleController  extends BaseController<TripArticle, String> {
	@Autowired
	private TripArticleService tripArticleService;
	@Autowired
	private TripArticleTypeService tripArticleTypeService;
	@Override
	public BaseService<TripArticle, String> getBsetService() {
		return tripArticleService;
	}

	@Override
	public Class<TripArticle> getModelClass() {
		return TripArticle.class;
	}
	
	@Override
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
			IllegalAccessException {
		return super.add(request, response).addObject("type",tripArticleTypeService.selectAll(new HashMap()));
	}
	
	@Override
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return super.edit(request, response).addObject("type",tripArticleTypeService.selectAll(new HashMap()));
	}
}