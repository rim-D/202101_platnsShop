package com.dao;

import java.util.List;

import com.dto.CommentsDTO;

public interface CommentsDAO {
	public List<CommentsDTO> list(Integer no, int start, int end);
	public int count(int no);
	public void create(CommentsDTO cDTO);
	public void update(CommentsDTO cDTO);
	public void delete(CommentsDTO cDTO);
}
