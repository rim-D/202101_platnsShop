package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("goodsDTO")
public class GoodsDTO {

	private String g_code;
	private String g_l_code;
	private String g_m_code;
	private String name;
	private String memo;
	private double price;
	private String image;
	private String receive_date;
	private int hits;
	
	// Goods_Detail(화면옵션용)
	private String g_d_code;
	private String option1;
	private String option2;
	private int quantity;
	private String code_name;
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public String getG_l_code() {
		return g_l_code;
	}
	public void setG_l_code(String g_l_code) {
		this.g_l_code = g_l_code;
	}
	public String getG_m_code() {
		return g_m_code;
	}
	public void setG_m_code(String g_m_code) {
		this.g_m_code = g_m_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getReceive_date() {
		return receive_date;
	}
	public void setReceive_date(String receive_date) {
		this.receive_date = receive_date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getG_d_code() {
		return g_d_code;
	}
	public void setG_d_code(String g_d_code) {
		this.g_d_code = g_d_code;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	@Override
	public String toString() {
		return "GoodsDTO [g_code=" + g_code + ", g_l_code=" + g_l_code + ", g_m_code=" + g_m_code + ", name=" + name
				+ ", memo=" + memo + ", price=" + price + ", image=" + image + ", receive_date=" + receive_date
				+ ", hits=" + hits + ", g_d_code=" + g_d_code + ", option1=" + option1 + ", option2=" + option2
				+ ", quantity=" + quantity + ", code_name=" + code_name + "]";
	}
	
	
	
	
	
	
}
