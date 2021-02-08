package com.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;

import com.dto.MemberDTO;
import com.dto.RegistrationDTO;

public interface MemberService {
	
	// 회원가입
	@Transactional
	public void memberIns(RegistrationDTO rDTO) throws Exception;
	
	// 로그인 완료 후 화면
	public String loginCheck(MemberDTO mDTO, HttpSession session);
	
	// 카카오로그인
	public String getAccessToken(String authorize_code);
	// 카카오API - 정보추출
	public HashMap<String, Object> getUserInfo(String access_token);
	
	// 마이페이지
	public MemberDTO mypage(String id);
	
	// 마이페이지 수정
	public void memberUpdate(MemberDTO mDTO);
}
