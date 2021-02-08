package com.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dao.BoardDAO;
import com.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO boardDAO;

	@Override
	public void deleteFile(String fullName) {
	}

	@Override
	public List<String> getAttach(int no) {
		return null;
	}

	@Override
	public void addAttach(String fullName) {
	}

	@Override
	public void updateAttach(String fullName, int no) {

	}

	// 글쓰기 저장
	@Override
	public void insert(BoardDTO boardDTO) throws Exception {
		boardDAO.insert(boardDTO);
	}

	// 게시판 상세보기
	@Override
	public BoardDTO read(int no) throws Exception {
		return boardDAO.read(no);
	}

	// 게시글 수정
	@Override
	public void update(BoardDTO boardDTO) throws Exception {
		boardDAO.update(boardDTO);
	}

	// 게시글 삭제
	@Override
	public void delete(int no) throws Exception {
		boardDAO.delete(no);

	}

	// 게시물 목록보기
	@Override
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return boardDAO.listAll(start, end, search_option, keyword);
	}

	// 조회수 증가
	@Override
	public void increaseViewcnt(int no) throws Exception {
		boardDAO.increaseViewcnt(no);
	}

	// 
	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return boardDAO.countArticle(search_option, keyword);
	}



}
