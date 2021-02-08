package com.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSessionTemplate template;
	
	@Override
	public void memberIns(MemberDTO mDTO) {
		int n = template.insert("member.memberIns", mDTO);
	}

	@Override
	public String loginCheck(MemberDTO mDTO, HttpSession session) {
		return template.selectOne("member.loginCheck", mDTO);
	}

	@Override
	public MemberDTO mypage(String userid) {
		return template.selectOne("member.mypage", userid);
	}

	@Override
	public void memberUpdate(MemberDTO mDTO) {
		template.update("member.memberUpdate", mDTO);
	}
	
	
	
	



}
