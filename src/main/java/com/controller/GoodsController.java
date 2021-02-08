package com.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class GoodsController {

	@Inject
	GoodsService gService;
	
	// 상품 보기
	@RequestMapping(value = "goods", method = RequestMethod.GET)
	public ModelAndView goods(
			@RequestParam(defaultValue = "") String g_l_code,
			@RequestParam(defaultValue = "") String name) {
		
		System.out.println("goods탐");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("g_l_code", g_l_code);
		mav.addObject("name", name);
		mav.setViewName("/goods");
		return mav;
	}
	
	// 상품 출력
	@RequestMapping(value = "goods/goodsList", method = RequestMethod.GET)
	public ModelAndView goodsList(
			@RequestParam(defaultValue = "") String g_l_code, 
			@RequestParam(defaultValue = "1") String order_num,
			@RequestParam(defaultValue = "") String name) {
		
		System.out.println("goodsList탐");
		System.out.println("name = " + name);
		
		List<GoodsDTO> list = gService.goodsList(g_l_code, order_num, name);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
		mav.addObject("g_l_code", g_l_code);

		mav.setViewName("/goods/goodsList");
		return mav;
	}
	
	// 상품상세페이지 화면
	@RequestMapping(value = "goodsRetrieve", method = RequestMethod.GET)
	public ModelAndView goodsRetrieve(@RequestParam String g_code) {
		System.out.println("g_l_code===" + g_code);
		
		GoodsDTO gDTO = new GoodsDTO();
		gDTO = gService.getGoods(g_code); // 상품에 대한 정보 출력
		List<GoodsDTO> list = gService.getGoodsOptions(g_code); //상품옵션 출력
		
		System.out.println("gDTO===" + gDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsDTO", gDTO);
		mav.addObject("goodsOptions", list);
		mav.setViewName("goodsRetrieve");
		return mav;
	}
	
}
