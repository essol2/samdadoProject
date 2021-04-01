package com.kh.samdado.business.model.dao;

import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;

public interface businessDao {

	int insertAlliance(Alliance a);

	// 레스토랑 등록
	int insertRestaurant(Business b);
	int insertRestaurant2(BusinessAtt ba);
	
	// 호텔등록
	int inserthotel();
	
	// 관광지등록
	int inserttour();
	
	// 렌트카등록
	int insertrentcar();

}
