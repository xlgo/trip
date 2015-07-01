package cn.hnzxl.base.controller;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.hnzxl.base.model.BaseModel;
import cn.hnzxl.base.model.DWZResult;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.base.util.GUIDUtil;
import cn.hnzxl.base.util.PageUtil;
import cn.hnzxl.base.util.QueryUtil;

public abstract class BaseController<MODEL extends BaseModel<PK>,  PK extends Serializable> {
	 public abstract BaseService<MODEL, String> getBsetService();
	 public abstract Class<MODEL> getModelClass();
	 public String getModelPath(){
		 RequestMapping rm =this.getClass().getAnnotation(RequestMapping.class);
		 return rm.value()[0];
	 }
	 @RequestMapping("list")
	 public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		 QueryUtil queryUtil = new QueryUtil(request);
		 PageUtil<MODEL> list = getBsetService().selectAll(queryUtil);
		 return new ModelAndView(getRequestPath(request)).addObject("modelPath",getModelPath()).addObject("pageList", list).addObject("searchParam", queryUtil.getParams());
	 }
	 
	 @RequestMapping("edit")
	 public ModelAndView edit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		 String id = request.getParameter("id");
		 MODEL model = getBsetService().selectByPrimaryKey(id);
		 if(model == null){
			 return add(request,response);
		 }
		 model.setMETHOD(BaseModel.METHOD_EDIT);
		 return new ModelAndView(getRequestPath(request)).addObject("modelPath",getModelPath()).addObject("model", model);
	 }
	 
	 @RequestMapping("add")
	 public ModelAndView add(HttpServletRequest request, HttpServletResponse response) throws InstantiationException, IllegalAccessException{
		 MODEL model = this.getModelClass().newInstance();
		 model.setId((PK)GUIDUtil.getUUID());
		 model.setMETHOD(BaseModel.METHOD_ADD);
		 return new ModelAndView(getRequestPath(request).replaceFirst("/add$", "/edit")).addObject("modelPath",getModelPath()).addObject("model", model);
	 }
	 
	 @RequestMapping("delJSON")
	 @ResponseBody
	 public DWZResult delJSON(HttpServletRequest request, HttpServletResponse response){
		 DWZResult dwzResult = new DWZResult();
		 String[] ids = request.getParameterValues("id");
		 int delCount = getBsetService().deleteByPrimaryKeyBatch(ids);
		 dwzResult.setMessage("删除成功"+(delCount>1?"("+delCount+"条)":"")+"！");
		 return dwzResult;
	 }
	 
	 @RequestMapping("saveJSON")
	 @ResponseBody
	 public DWZResult saveJSON(MODEL model, HttpServletRequest request, HttpServletResponse response){
		 DWZResult dwzResult = new DWZResult();
		 if(BaseModel.METHOD_EDIT.equals(model.getMETHOD())){
			 //没有的字段不进行更改
			 getBsetService().updateByPrimaryKeySelective(model);
			 dwzResult.setMessage("保存成功！");
		 }else{
			 getBsetService().insert(model);
			 dwzResult.setMessage("创建成功！");
		 }
		 dwzResult.setCallbackType(DWZResult.CALLBACKTYPE_CLOSE);
		 dwzResult.setNavTabId(request.getParameter("navTabId"));
		 return dwzResult;
	 }
	 /**
	  * 获取不带项目名的路径
	  * @param request
	  * @return
	  */
	 public String getRequestPath(HttpServletRequest request){
		 return request.getRequestURI().substring(request.getContextPath().length());
	 }
	 
	 
}
