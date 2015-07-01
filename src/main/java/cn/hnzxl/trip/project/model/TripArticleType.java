package cn.hnzxl.trip.project.model;

import cn.hnzxl.base.model.BaseModel;

public class TripArticleType extends BaseModel<String>{
    private String articleTypeId;

    private String articleTypeName;

    private String articleTypePId;

    private String articleTypeRemark;


    public String getArticleTypeId() {
        return articleTypeId;
    }

    public void setArticleTypeId(String articleTypeId) {
        this.articleTypeId = articleTypeId == null ? null : articleTypeId.trim();
    }

    public String getArticleTypeName() {
        return articleTypeName;
    }

    public void setArticleTypeName(String articleTypeName) {
        this.articleTypeName = articleTypeName == null ? null : articleTypeName.trim();
    }

    public String getArticleTypePId() {
        return articleTypePId;
    }

    public void setArticleTypePId(String articleTypePId) {
        this.articleTypePId = articleTypePId == null ? null : articleTypePId.trim();
    }

    public String getArticleTypeRemark() {
        return articleTypeRemark;
    }

    public void setArticleTypeRemark(String articleTypeRemark) {
        this.articleTypeRemark = articleTypeRemark == null ? null : articleTypeRemark.trim();
    }
    @Override
    public String getId() {
    	return articleTypeId;
    }
    @Override
    public void setId(String modelId) {
    	this.articleTypeId = modelId;
    }
}