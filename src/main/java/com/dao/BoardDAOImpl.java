package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;

@Repository // dao bean으로 등록
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSessionTemplate template;

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getAttach(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addAttach(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAttach(String fullName, int no) {
		// TODO Auto-generated method stub

	}

	// 글쓰기 저장
	@Override
	public void insert(BoardDTO boardDTO) throws Exception {
		template.insert("board.insert", boardDTO);
	}

	// 게시글 읽기
	@Override
	public BoardDTO read(int no) throws Exception {
		return template.selectOne("board.read", no);
	}

	// 게시글 수정
	@Override
	public void update(BoardDTO boardDTO) throws Exception {
		template.update("board.update", boardDTO);

	}

	// 게시글 삭제
	@Override
	public void delete(int no) throws Exception {
		template.delete("board.delete", no);
	}

	// 게시물 목록
	@Override
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		System.out.println("****map=====" + map);
		return template.selectList("board.listAll", map);
	}

	// 조회수 증가
	@Override
	public void increaseViewcnt(int no) throws Exception {
		template.update("board.increaseViewcnt", no);
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return template.selectOne("board.countArticle", map);
	}


}
