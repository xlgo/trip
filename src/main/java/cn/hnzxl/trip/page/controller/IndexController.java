package cn.hnzxl.trip.page.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.hnzxl.base.util.PageUtil;
import cn.hnzxl.base.util.QueryUtil;
import cn.hnzxl.trip.project.model.SysArea;
import cn.hnzxl.trip.project.model.TripArticle;
import cn.hnzxl.trip.project.model.TripArticleType;
import cn.hnzxl.trip.project.model.TripTourGuide;
import cn.hnzxl.trip.project.service.SysAreaService;
import cn.hnzxl.trip.project.service.TripArticleService;
import cn.hnzxl.trip.project.service.TripArticleTypeService;
import cn.hnzxl.trip.project.service.TripTourGuideService;

@Controller
@RequestMapping("/page/")
public class IndexController {
	@Autowired
	private SysAreaService sysAreaService;
	
	@Autowired
	private TripTourGuideService tripTourGuideService;
	
	@Autowired
	private TripArticleTypeService tripArticleTypeService;
	
	@Autowired
	private TripArticleService tripArticleService;
	@RequestMapping("index")
	public ModelAndView area(HttpServletRequest request ,HttpServletResponse response){
		String areaId = request.getParameter("areaId");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("areaType", 2);
		List<SysArea> sas = sysAreaService.selectAll(params);
		
		Map<String, Object> paramsAT = new HashMap<String, Object>();
		List<TripArticleType> tat = tripArticleTypeService.selectAll(paramsAT);
		return new ModelAndView("index").addObject("area", sas).addObject("articleType", tat);
	}
	
	@RequestMapping("tourguide")
	public ModelAndView triptourguide(HttpServletRequest request ,HttpServletResponse response){
		QueryUtil queryUtil = new QueryUtil(request);
		PageUtil<TripTourGuide> tourguide = tripTourGuideService.selectAll(queryUtil);
		return new ModelAndView("/page/triptourguide").addObject("tourguide", tourguide);
	}
	
	@RequestMapping("article")
	public ModelAndView article(HttpServletRequest request ,HttpServletResponse response){
		QueryUtil queryUtil = new QueryUtil(request);
		PageUtil<TripArticle> article = tripArticleService.selectAll(queryUtil);
		return new ModelAndView("/page/triparticle").addObject("article", article);
	}
	
	
	@RequestMapping("tourguideInfo")
	public ModelAndView tourguideInfo(HttpServletRequest request ,HttpServletResponse response){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("areaType", 2);
		List<SysArea> sas = sysAreaService.selectAll(params);
		
		Map<String, Object> paramsAT = new HashMap<String, Object>();
		List<TripArticleType> tat = tripArticleTypeService.selectAll(paramsAT);
		
		TripTourGuide tourguide = tripTourGuideService.selectByPrimaryKey(request.getParameter("id"));
		return new ModelAndView("/page/tourguideInfo").addObject("tourguide", tourguide).addObject("area", sas).addObject("articleType", tat);
	}
	
	@RequestMapping("articleInfo")
	public ModelAndView articleInfo(HttpServletRequest request ,HttpServletResponse response){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("areaType", 2);
		List<SysArea> sas = sysAreaService.selectAll(params);
		
		Map<String, Object> paramsAT = new HashMap<String, Object>();
		List<TripArticleType> tat = tripArticleTypeService.selectAll(paramsAT);
		
		TripArticle tripArticle = tripArticleService.selectByPrimaryKey(request.getParameter("id"));
		return new ModelAndView("/page/articleInfo").addObject("tripArticle", tripArticle).addObject("area", sas).addObject("articleType", tat);
	}
}
