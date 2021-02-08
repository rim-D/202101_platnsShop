package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dto.CommentsDTO;

public interface CommentsService {
	public List<CommentsDTO> list(Integer no, int start, int end, HttpSession session);
	public int count(int no);
	public void create(CommentsDTO cDTO);
	public void update(CommentsDTO cDTO);
	public void delete(CommentsDTO cDTO);
}
