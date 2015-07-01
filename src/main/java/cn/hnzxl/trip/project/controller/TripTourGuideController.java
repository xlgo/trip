package cn.hnzxl.trip.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.hnzxl.base.controller.BaseController;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.model.SysArea;
import cn.hnzxl.trip.project.model.SysAttachment;
import cn.hnzxl.trip.project.model.TripTourGuide;
import cn.hnzxl.trip.project.service.SysAreaService;
import cn.hnzxl.trip.project.service.SysAttachmentService;
import cn.hnzxl.trip.project.service.TripTourGuideService;
@Controller
@RequestMapping("/trip/triptourguide/")
public class TripTourGuideController extends BaseController<TripTourGuide, String> {
	@Autowired
	private TripTourGuideService tripTourGuideService;
	@Autowired
	private SysAttachmentService sysAttachmentService;
	@Autowired
	private SysAreaService sysAreaService;
	
	@Override
	public BaseService<TripTourGuide, String> getBsetService() {
		return tripTourGuideService;
	}

	@Override
	public Class<TripTourGuide> getModelClass() {
		return TripTourGuide.class;
	}
	 @RequestMapping("add")
	 public ModelAndView add(HttpServletRequest request, HttpServletResponse response) throws InstantiationException, IllegalAccessException{
		 Map<String , Object> saParams = new HashMap<String, Object>();
		saParams.put("areaType", "2");
		List<SysArea> sa2 = sysAreaService.selectAll(saParams);
		saParams.put("areaType", "4");
		List<SysArea> sa4 = sysAreaService.selectAll(saParams);
		return super.add(request, response).addObject("sa2", sa2).addObject("sa4", sa4);
	 }
	@RequestMapping("edit")
	 public ModelAndView edit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String , Object> params = new HashMap<String, Object>();
		params.put("businessId", request.getParameter("id"));
		params.put("businessModel", this.getModelClass().getName());
		params.put("businessType", "photoExt");
		List<SysAttachment> sas = sysAttachmentService.selectAll(params);
		Map<String , Object> saParams = new HashMap<String, Object>();
		saParams.put("areaType", "2");
		List<SysArea> sa2 = sysAreaService.selectAll(saParams);
		saParams.put("areaType", "4");
		List<SysArea> sa4 = sysAreaService.selectAll(saParams);
		return super.edit(request, response).addObject("photoExt", sas).addObject("sa2", sa2).addObject("sa4", sa4);
	}
}