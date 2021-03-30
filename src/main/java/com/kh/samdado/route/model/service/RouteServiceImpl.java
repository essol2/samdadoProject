package com.kh.samdado.route.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.route.model.dao.RouteDao;


@Service
public class RouteServiceImpl implements RouteService {
   @Autowired
   private RouteDao rDao;
   
  
}