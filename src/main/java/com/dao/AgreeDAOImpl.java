package com.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dto.AgreeDTO;

@Repository
public class AgreeDAOImpl implements AgreeDAO {
	
	@Inject
	SqlSessionTemplate template;
	
	@Override
	public void agreeIns(AgreeDTO aDTO) {
		System.out.println("동의 aDTO ==== " +aDTO);
		template.insert("member.agreeIns", aDTO);
	}

}
