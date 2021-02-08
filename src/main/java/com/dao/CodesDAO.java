package com.dao;

import java.util.List;

public interface CodesDAO {
	
	// 회원가입 동의구분
	public List<String> codesSel(String parentCode);
}
