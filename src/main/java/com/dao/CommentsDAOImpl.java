package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dto.CommentsDTO;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	
	@Inject
	SqlSessionTemplate template;
	
	@Override
	public List<CommentsDTO> list(Integer no, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("no", no);
		return template.selectList("comment.listComment", map);
	}

	// 댓글 갯수
	@Override
	public int count(int no) {
		return template.selectOne("comment.count", no);
	}

	// 댓글 작성
	@Override
	public void create(CommentsDTO cDTO) {
		template.insert("comment.insertComments", cDTO);
	}

	// 댓글 수정
	@Override
	public void update(CommentsDTO cDTO) {

	}

	// 댓글 삭제
	@Override
	public void delete(CommentsDTO cDTO) {

	}


}
