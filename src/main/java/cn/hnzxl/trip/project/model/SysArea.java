package cn.hnzxl.trip.project.model;

import cn.hnzxl.base.model.BaseModel;

public class SysArea  extends BaseModel<String> {
    private String areaId;

    private String areaPId;

    private Integer areaType;

    private String areaName;
    
    private String areaRemark;

    private String areaEnName;

    private String areaPName;
    
    @Override
    public String getId() {
    	return areaId;
    }
    @Override
	public void setId(String modelId) {
		this.areaId = modelId;
	}
    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId == null ? null : areaId.trim();
    }

    public String getAreaPId() {
        return areaPId;
    }

    public void setAreaPId(String areaPId) {
        this.areaPId = areaPId == null ? null : areaPId.trim();
    }

    public Integer getAreaType() {
        return areaType;
    }

    public void setAreaType(Integer areaType) {
        this.areaType = areaType;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    public String getAreaEnName() {
        return areaEnName;
    }

    public void setAreaEnName(String areaEnName) {
        this.areaEnName = areaEnName == null ? null : areaEnName.trim();
    }
	public String getAreaRemark() {
		return areaRemark;
	}
	public void setAreaRemark(String areaRemark) {
		this.areaRemark = areaRemark;
	}
	public String getAreaPName() {
		return areaPName;
	}
	public void setAreaPName(String areaPName) {
		this.areaPName = areaPName;
	}
	
}