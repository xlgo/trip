package cn.hnzxl.trip.project.model;

import cn.hnzxl.base.model.BaseModel;

public class TripTourGuide extends BaseModel<String>{
    private String guideId;

    private String guideName;

    private String guideEnName;

    private String guideResidential;

    private String guideIntro;

    private String guideDetails;

    private String guideServiceArea;

    private String guideCity;

    private Double guidePrice;

    private String guideLable;

    private Integer guideStatus;

    private String guideRemark;
    
    private String guideFromPlace;
    
    public String getGuideFromPlace() {
		return guideFromPlace;
	}

	public void setGuideFromPlace(String guideFromPlace) {
		this.guideFromPlace = guideFromPlace;
	}

	public String getGuideId() {
        return guideId;
    }

    public void setGuideId(String guideId) {
        this.guideId = guideId == null ? null : guideId.trim();
    }

    public String getGuideName() {
        return guideName;
    }

    public void setGuideName(String guideName) {
        this.guideName = guideName == null ? null : guideName.trim();
    }

    public String getGuideEnName() {
        return guideEnName;
    }

    public void setGuideEnName(String guideEnName) {
        this.guideEnName = guideEnName == null ? null : guideEnName.trim();
    }

    public String getGuideResidential() {
        return guideResidential;
    }

    public void setGuideResidential(String guideResidential) {
        this.guideResidential = guideResidential == null ? null : guideResidential.trim();
    }

    public String getGuideIntro() {
        return guideIntro;
    }

    public void setGuideIntro(String guideIntro) {
        this.guideIntro = guideIntro == null ? null : guideIntro.trim();
    }

    public String getGuideDetails() {
        return guideDetails;
    }

    public void setGuideDetails(String guideDetails) {
        this.guideDetails = guideDetails == null ? null : guideDetails.trim();
    }

    public String getGuideServiceArea() {
        return guideServiceArea;
    }

    public void setGuideServiceArea(String guideServiceArea) {
        this.guideServiceArea = guideServiceArea == null ? null : guideServiceArea.trim();
    }

    public String getGuideCity() {
        return guideCity;
    }

    public void setGuideCity(String guideCity) {
        this.guideCity = guideCity == null ? null : guideCity.trim();
    }

    public Double getGuidePrice() {
        return guidePrice;
    }

    public void setGuidePrice(Double guidePrice) {
        this.guidePrice = guidePrice;
    }

    public String getGuideLable() {
        return guideLable;
    }

    public void setGuideLable(String guideLable) {
        this.guideLable = guideLable == null ? null : guideLable.trim();
    }

    public Integer getGuideStatus() {
        return guideStatus;
    }

    public void setGuideStatus(Integer guideStatus) {
        this.guideStatus = guideStatus;
    }

    public String getGuideRemark() {
        return guideRemark;
    }

    public void setGuideRemark(String guideRemark) {
        this.guideRemark = guideRemark == null ? null : guideRemark.trim();
    }
    
    @Override
    public String getId() {
    	return this.guideId;
    }
    @Override
    public void setId(String modelId) {
    	this.guideId = modelId;
    }
}