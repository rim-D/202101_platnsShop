package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Inject
	SqlSessionTemplate template;
	
	@Override
	public List<GoodsDTO> goodsList(String g_l_code, String order_num, String name) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("g_l_code", g_l_code);
		map.put("order_num", order_num);
		map.put("name", name);
		
		System.out.println("g_l_code = " + map.get("g_l_code"));
		System.out.println("order_num = " + map.get("order_num"));
		System.out.println("name = " + map.get("name"));
		
		return template.selectList("goods.goodsList", map);
	}

	@Override
	public GoodsDTO getGoods(String g_code) {
		return template.selectOne("goods.getGoods", g_code);
	}

	@Override
	public List<GoodsDTO> getGoodsOptions(String g_code) {
		return template.selectList("goods.getGoodsOptions", g_code);
	}
	
	

}
