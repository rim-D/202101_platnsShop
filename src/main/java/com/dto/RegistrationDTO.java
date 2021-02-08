package com.dto;

import java.util.ArrayList;
import org.apache.ibatis.type.Alias;

@Alias("registrationDTO")
public class RegistrationDTO {
	
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String phone;
	private String post;
	private String addr1;
	private String addr2;
	private ArrayList<String> agree;
	
	public RegistrationDTO() {}
	
	public RegistrationDTO(String id, String pw, String name, String birth, String phone, String post, String addr1,
			String addr2, ArrayList<String> agree) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.agree = agree;
	}
	
	@Override
	public String toString() {
		return "RegistrationDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", phone=" + phone
				+ ", post=" + post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", agree=" + agree + "]";
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public ArrayList<String> getAgree() {
		return agree;
	}
	public void setAgree(ArrayList<String> agree) {
		this.agree = agree;
	}
	
	
	
}
