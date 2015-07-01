package cn.hnzxl.trip.project.model;

import java.math.BigInteger;

import cn.hnzxl.base.model.BaseModel;

public class SysAttachment extends BaseModel<String>{
    private String attachmentId;

    private String businessId;

    private String businessModel;

    private String businessType;

    private String attachmentName;

    private BigInteger attachmentSize;

    private String attachmentType;

    private String attachmentPath;
    
    private boolean multi = true;
    
    
	public boolean isMulti() {
		return multi;
	}

	public void setMulti(boolean multi) {
		this.multi = multi;
	}

	public String getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(String attachmentId) {
        this.attachmentId = attachmentId == null ? null : attachmentId.trim();
    }

    public String getBusinessId() {
        return businessId;
    }

    public void setBusinessId(String businessId) {
        this.businessId = businessId == null ? null : businessId.trim();
    }

    public String getBusinessModel() {
        return businessModel;
    }

    public void setBusinessModel(String businessModel) {
        this.businessModel = businessModel == null ? null : businessModel.trim();
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType == null ? null : businessType.trim();
    }

    public String getAttachmentName() {
        return attachmentName;
    }

    public void setAttachmentName(String attachmentName) {
        this.attachmentName = attachmentName == null ? null : attachmentName.trim();
    }

    public BigInteger getAttachmentSize() {
        return attachmentSize;
    }

    public void setAttachmentSize(BigInteger attachmentSize) {
        this.attachmentSize = attachmentSize;
    }

    public String getAttachmentType() {
        return attachmentType;
    }

    public void setAttachmentType(String attachmentType) {
        this.attachmentType = attachmentType == null ? null : attachmentType.trim();
    }

    public String getAttachmentPath() {
        return attachmentPath;
    }

    public void setAttachmentPath(String attachmentPath) {
        this.attachmentPath = attachmentPath == null ? null : attachmentPath.trim();
    }
    
    @Override
    public String getId() {
    	return attachmentId;
    }
    @Override
    public void setId(String modelId) {
    	this.attachmentId = modelId;
    }
}