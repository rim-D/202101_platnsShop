package com.service;

import java.util.List;

import com.dto.BoardDTO;

public interface BoardService {
	public void deleteFile(String fullName); // 첨부파일 삭제
	public List<String> getAttach(int no); // 첨부파일 목록
	public void addAttach(String fullName); // 첨부파일 저장
	public void updateAttach(String fullName, int no); // 첨부파일 수정
	public void insert(BoardDTO boardDTO) throws Exception; // 글쓰기
	public BoardDTO read(int no) throws Exception; // 글읽기
	public void update(BoardDTO boardDTO) throws Exception; // 글수정
	public void delete(int no) throws Exception; // 글삭제
	
	// 목록(페이지 나누기, 검색 기능포함)
	public List<BoardDTO> listAll(
			int start, int end, String search_option, String keyword) throws Exception;
	
	// 조회수 증가 처리
	public void increaseViewcnt(int no) throws Exception;
	// 게시물 수
	public int countArticle(String search_option, String keyword) throws Exception;
	
}
