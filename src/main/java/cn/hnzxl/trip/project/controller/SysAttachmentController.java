package cn.hnzxl.trip.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.hnzxl.base.controller.BaseController;
import cn.hnzxl.base.util.GUIDUtil;
import cn.hnzxl.trip.project.model.SysAttachment;
import cn.hnzxl.trip.project.service.SysAttachmentService;

@Controller
@RequestMapping("/trip/sysattachment/")
public class SysAttachmentController extends BaseController<SysAttachment, String> {
	@Value("#{conf['fileupload.path']}")
	private String filepath;
	@Autowired
	private SysAttachmentService sysAttachmentService;

	@Override
	public SysAttachmentService getBsetService() {
		return sysAttachmentService;
	}

	@Override
	public Class<SysAttachment> getModelClass() {
		return SysAttachment.class;
	}

	@RequestMapping("/upload")
	@ResponseBody
	public Object upload(MultipartFile file,SysAttachment sysAttachment,HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		Map<String, Object> res = new HashMap<String, Object>();
		if(file.isEmpty()){
			res.put("id", null);
		}else{
			if(!sysAttachment.isMulti()){
				Map<String , Object> param = new HashMap<String, Object>();
				param.put("businessId", sysAttachment.getBusinessId());
				param.put("businessModel", sysAttachment.getBusinessModel());
				param.put("businessType", sysAttachment.getBusinessType());
				this.getBsetService().deleteByParam(param);
			}
			sysAttachment.setAttachmentId(GUIDUtil.getUUID());
			sysAttachment.setAttachmentName(file.getOriginalFilename());
			sysAttachment.setAttachmentSize(BigInteger.valueOf(file.getSize()));
			sysAttachment.setAttachmentType(new MimetypesFileTypeMap().getContentType(sysAttachment.getAttachmentName()));
			String extName = sysAttachment.getAttachmentName().replaceAll(".*[.]", "");
			Date currDae = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("-yyyy-MM-dd-");
			String path = sdf.format(currDae).replace("-", "\\"+File.separator)+GUIDUtil.getUUID()+"."+extName;
			sysAttachment.setAttachmentPath(path);
			File newFile = new File(filepath+path);
			if(!newFile.getParentFile().exists()){
				newFile.getParentFile().mkdirs();
			}
			file.transferTo(newFile);
			this.getBsetService().insert(sysAttachment);
			res.put("id", sysAttachment.getAttachmentId());
			res.put("name", sysAttachment.getAttachmentName());
		}
		
		return res;
	}
	
	@RequestMapping("/download")
	public void download(SysAttachment sysAttachment,HttpServletRequest request, HttpServletResponse response) throws IOException {
		SysAttachment sa =null;
		if(StringUtils.isNotEmpty(sysAttachment.getAttachmentId())){
			sa = this.getBsetService().selectByPrimaryKey(sysAttachment.getAttachmentId());
		}else {
			Map<String , Object> param = new HashMap<String, Object>();
			param.put("businessId", sysAttachment.getBusinessId());
			param.put("businessModel", sysAttachment.getBusinessModel());
			param.put("businessType", sysAttachment.getBusinessType());
			List<SysAttachment> sas = this.getBsetService().selectAll(param);
			if(sas.size()==1){
				sa = sas.get(0);
			}
			
		}
		if(sa==null){
			return;
		}
		InputStream is = new FileInputStream(filepath+sa.getAttachmentPath());
		byte[] buff = new byte[1024];
		int len =0;
		response.setContentType(sa.getAttachmentType());
		while ((len = is.read(buff)) > 0) {
			response.getOutputStream().write(buff,0,len);
		}
	}
}