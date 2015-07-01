package cn.hnzxl.trip.project.model;

import cn.hnzxl.base.model.BaseModel;

public class TripArticle extends BaseModel<String>{
    private String articleId;

    private String articleTypeId;

    private Integer articleDays;

    private String articleStartTime;

    private String articleGuideId;

    private String articleLabel;

    private String articleRemindArea;

    private String articleTitle;

    private Integer articleElite;

    private String articleCreateBy;

    private Integer articleStatus;

    private String articleContent;
    private String  articleTypeName;
    private String guideName;
    private Double guidePrice;
    
    
    public String getArticleTypeName() {
		return articleTypeName;
	}

	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}

	public String getGuideName() {
		return guideName;
	}

	public void setGuideName(String guideName) {
		this.guideName = guideName;
	}

	public Double getGuidePrice() {
		return guidePrice;
	}

	public void setGuidePrice(Double guidePrice) {
		this.guidePrice = guidePrice;
	}

	public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId == null ? null : articleId.trim();
    }

    public String getArticleTypeId() {
        return articleTypeId;
    }

    public void setArticleTypeId(String articleTypeId) {
        this.articleTypeId = articleTypeId == null ? null : articleTypeId.trim();
    }

    public Integer getArticleDays() {
        return articleDays;
    }

    public void setArticleDays(Integer articleDays) {
        this.articleDays = articleDays;
    }

    public String getArticleStartTime() {
        return articleStartTime;
    }

    public void setArticleStartTime(String articleStartTime) {
        this.articleStartTime = articleStartTime;
    }

    public String getArticleGuideId() {
        return articleGuideId;
    }

    public void setArticleGuideId(String articleGuideId) {
        this.articleGuideId = articleGuideId == null ? null : articleGuideId.trim();
    }

    public String getArticleLabel() {
        return articleLabel;
    }

    public void setArticleLabel(String articleLabel) {
        this.articleLabel = articleLabel == null ? null : articleLabel.trim();
    }

    public String getArticleRemindArea() {
        return articleRemindArea;
    }

    public void setArticleRemindArea(String articleRemindArea) {
        this.articleRemindArea = articleRemindArea == null ? null : articleRemindArea.trim();
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public Integer getArticleElite() {
        return articleElite;
    }

    public void setArticleElite(Integer articleElite) {
        this.articleElite = articleElite;
    }

    public String getArticleCreateBy() {
        return articleCreateBy;
    }

    public void setArticleCreateBy(String articleCreateBy) {
        this.articleCreateBy = articleCreateBy == null ? null : articleCreateBy.trim();
    }

    public Integer getArticleStatus() {
        return articleStatus;
    }

    public void setArticleStatus(Integer articleStatus) {
        this.articleStatus = articleStatus;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }
    
    @Override
    public String getId() {
    	return articleId;
    }
    
    @Override
    public void setId(String modelId) {
    	this.articleId = modelId;
    }
}