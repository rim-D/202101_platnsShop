package com.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.dao.CommentsDAO;
import com.dto.CommentsDTO;

@Service
public class CommentsServiceImpl implements CommentsService {

	@Inject
	CommentsDAO cDAO;
	
	// 댓글 목록
	@Override
	public List<CommentsDTO> list(Integer no, int start, int end, HttpSession session) {
		return cDAO.list(no, start, end);
	}

	// 댓글 갯수
	@Override
	public int count(int no) {
		return cDAO.count(no);
	}

	// 댓글 작성
	@Override
	public void create(CommentsDTO cDTO) {
		cDAO.create(cDTO);
	}

	// 댓글 수정
	@Override
	public void update(CommentsDTO cDTO) {
		cDAO.update(cDTO);
	}

	// 댓글 삭제
	@Override
	public void delete(CommentsDTO cDTO) {
		cDAO.delete(cDTO);
	}


}
