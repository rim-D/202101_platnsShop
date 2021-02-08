package com.dao;

import com.dto.AgreeDTO;

public interface AgreeDAO {
	
	// 회원가입 동의여부
	public void agreeIns(AgreeDTO aDTO);
}
