package com.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CodesDAOImpl implements CodesDAO {

	@Inject
	SqlSessionTemplate template;
	
	@Override
	public List<String> codesSel(String parentCode) {
		return template.selectList("member.codesSel", parentCode);
	}

}
