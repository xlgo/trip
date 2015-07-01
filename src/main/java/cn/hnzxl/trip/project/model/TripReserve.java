package cn.hnzxl.trip.project.model;

import java.util.Date;

import cn.hnzxl.base.model.BaseModel;

public class TripReserve extends BaseModel<String>{
    private String reserveId;

    private String reserveUser;

    private Date reserveTime;

    private String reserveBeReserveUser;


    public String getReserveId() {
        return reserveId;
    }

    public void setReserveId(String reserveId) {
        this.reserveId = reserveId == null ? null : reserveId.trim();
    }

    public String getReserveUser() {
        return reserveUser;
    }

    public void setReserveUser(String reserveUser) {
        this.reserveUser = reserveUser == null ? null : reserveUser.trim();
    }

    public Date getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(Date reserveTime) {
        this.reserveTime = reserveTime;
    }

    public String getReserveBeReserveUser() {
        return reserveBeReserveUser;
    }

    public void setReserveBeReserveUser(String reserveBeReserveUser) {
        this.reserveBeReserveUser = reserveBeReserveUser == null ? null : reserveBeReserveUser.trim();
    }
    @Override
    public String getId() {
    	return reserveId;
    }
    @Override
    public void setId(String modelId) {
    	this.reserveId = modelId;
    }

}