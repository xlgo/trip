package cn.hnzxl.trip.project.controller;

import java.text.ParseException;
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
import cn.hnzxl.base.model.BaseModel;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.base.util.GUIDUtil;
import cn.hnzxl.base.util.PageUtil;
import cn.hnzxl.base.util.QueryUtil;
import cn.hnzxl.trip.project.model.SysArea;
import cn.hnzxl.trip.project.service.SysAreaService;
@Controller
@RequestMapping("/trip/sysarea/")
public class SysAreaController  extends BaseController<SysArea, String> {
	@Autowired
	private SysAreaService sysAreaService;
	
	@Override
	public BaseService<SysArea, String> getBsetService() {
		return sysAreaService;
	}

	@Override
	public Class<SysArea> getModelClass() {
		return SysArea.class;
	}
	@RequestMapping("list")
	 public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws ParseException{
		 QueryUtil queryUtil = new QueryUtil(request);
		 queryUtil.addParam("areaType", "2");
		 PageUtil<SysArea> list = getBsetService().selectAll(queryUtil);
		 return new ModelAndView(getRequestPath(request)).addObject("modelPath",getModelPath()).addObject("pageList", list).addObject("searchParam", queryUtil.getParams());
	 }
	 @RequestMapping("list4")
	 public ModelAndView list4(HttpServletRequest request, HttpServletResponse response) throws ParseException{
		 QueryUtil queryUtil = new QueryUtil(request);
		 queryUtil.addParam("areaType", "4");
		 PageUtil<SysArea> list = getBsetService().selectAll(queryUtil);
		 Map<String,Object> gm = new HashMap<String, Object>();
		 gm.put("areaType", "2");
		 List<SysArea> sas = this.getBsetService().selectAll(gm);
		 return new ModelAndView(getRequestPath(request)).addObject("sysArea2", sas).addObject("modelPath",getModelPath()).addObject("pageList", list).addObject("searchParam", queryUtil.getParams());
	 }
	 
	 @RequestMapping("edit4")
	 public ModelAndView edit4(HttpServletRequest request, HttpServletResponse response) throws Exception{
		 String id = request.getParameter("id");
		 SysArea model = getBsetService().selectByPrimaryKey(id);
		 if(model == null){
			 return add(request,response);
		 }
		 model.setMETHOD(BaseModel.METHOD_EDIT);
		 QueryUtil queryUtil = new QueryUtil(request);
		 queryUtil.addParam("areaType", "2");
		 List<SysArea> sas = this.getBsetService().selectAll(queryUtil.getFilter());
		 return new ModelAndView(getRequestPath(request)).addObject("sysArea2", sas).addObject("modelPath",getModelPath()).addObject("model", model);
	 }
	 
	 @RequestMapping("add4")
	 public ModelAndView add4(HttpServletRequest request, HttpServletResponse response) throws InstantiationException, IllegalAccessException, ParseException{
		 SysArea model = new SysArea();
		 model.setId(GUIDUtil.getUUID());
		 model.setMETHOD(BaseModel.METHOD_ADD);
		 QueryUtil queryUtil = new QueryUtil(request);
		 queryUtil.addParam("areaType", "2");
		 List<SysArea> sas = this.getBsetService().selectAll(queryUtil.getFilter());
		 return new ModelAndView(getRequestPath(request).replaceFirst("/add4$", "/edit4")).addObject("sysArea2", sas).addObject("modelPath",getModelPath()).addObject("model", model);
	 }
	 
}