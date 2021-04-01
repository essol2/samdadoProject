package com.kh.samdado.business.model.dao;

import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;

public interface businessDao {

	int insertAlliance(Alliance a);

	int insertRestaurant(Business b);

	int insertRestaurant2(BusinessAtt ba);

}
