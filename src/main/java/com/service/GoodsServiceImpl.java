package com.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Inject
	GoodsDAO gDAO;
	
	@Override
	public List<GoodsDTO> goodsList(String g_l_code, String order_num, String name) {
		return gDAO.goodsList(g_l_code, order_num, name);
	}

	@Override
	public GoodsDTO getGoods(String g_code) {
		return gDAO.getGoods(g_code);
	}

	@Override
	public List<GoodsDTO> getGoodsOptions(String g_code) {
		return gDAO.getGoodsOptions(g_code);
	}
	

}
