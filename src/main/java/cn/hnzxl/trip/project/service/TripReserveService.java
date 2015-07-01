package cn.hnzxl.trip.project.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hnzxl.base.dao.BaseMapper;
import cn.hnzxl.base.service.BaseService;
import cn.hnzxl.trip.project.dao.TripReserveMapper;
import cn.hnzxl.trip.project.model.TripReserve;

@Service
public class TripReserveService  extends BaseService<TripReserve, String> {
	
	@Resource
	private TripReserveMapper tripReserveMapper = null;
	
	@Override
	public BaseMapper<TripReserve, String> getBaseMapper() {
		return tripReserveMapper;
	}
}