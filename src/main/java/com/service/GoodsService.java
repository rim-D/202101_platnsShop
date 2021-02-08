package com.service;

import java.util.List;

import com.dto.GoodsDTO;

public interface GoodsService {

	public List<GoodsDTO> goodsList(String g_l_code, String order_num, String name);
	public GoodsDTO getGoods(String g_code);
	public List<GoodsDTO> getGoodsOptions(String g_code);
}
