package cn.hnzxl.base.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.hnzxl.base.model.BaseModel;
/**
 * 提供基本的几个接口
 * @author ZXL
 *
 * @param <MODEL>
 * @param <PK>
 */
public interface BaseMapper<MODEL extends BaseModel,PK extends Serializable> {
	int deleteByPrimaryKey(PK id);

    int insert(MODEL record);

    int insertSelective(MODEL record);

    MODEL selectByPrimaryKey(PK id);

    int updateByPrimaryKeySelective(MODEL record);

    int updateByPrimaryKey(MODEL record);
    
    List<MODEL> selectAll(Map<String, Object> params);
}
