package com.dao;

import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;

public interface MemberDAO {
	// 회원가입
	public void memberIns(MemberDTO mDTO);
	// 로그인
	public String loginCheck(MemberDTO mDTO, HttpSession session);
	// 마이페이지
	public MemberDTO mypage(String userid);
	// 마이페이지 수정
	public void memberUpdate(MemberDTO mDTO);
}
