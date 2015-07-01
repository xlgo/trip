package cn.hnzxl.trip.project.model;

import cn.hnzxl.base.model.BaseModel;

public class TripSubscription extends BaseModel<String> {
	private String subscriptionId;

	private String subscriptionUser;

	private String subscriptionEmal;

	public String getSubscriptionId() {
		return subscriptionId;
	}

	public void setSubscriptionId(String subscriptionId) {
		this.subscriptionId = subscriptionId == null ? null : subscriptionId.trim();
	}

	public String getSubscriptionUser() {
		return subscriptionUser;
	}

	public void setSubscriptionUser(String subscriptionUser) {
		this.subscriptionUser = subscriptionUser == null ? null : subscriptionUser.trim();
	}

	public String getSubscriptionEmal() {
		return subscriptionEmal;
	}

	public void setSubscriptionEmal(String subscriptionEmal) {
		this.subscriptionEmal = subscriptionEmal == null ? null : subscriptionEmal.trim();
	}

	@Override
	public String getId() {
		return this.subscriptionId;
	}

	@Override
	public void setId(String modelId) {
		this.subscriptionId = modelId;
	}
}