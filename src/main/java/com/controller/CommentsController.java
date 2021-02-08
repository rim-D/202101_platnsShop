package com.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CommentsDTO;
import com.service.CommentsService;

@RestController // HTTP ResponseBody가 생성되는 방식
@RequestMapping("/comments/*")
public class CommentsController {
	
	@Inject
	CommentsService commentsService;
	
	@PostMapping(value="insert")
	public void insert(CommentsDTO cDTO, HttpSession session) {
		System.out.println("cDTO");
		String id = (String)session.getAttribute("id");
		cDTO.setCreater(id);
		cDTO.setModifier(id);
		cDTO.setNickname(cDTO.getNickname());
		System.out.println("댓글 DTO===" + cDTO);
		commentsService.create(cDTO);
	}
	
	
	@RequestMapping(value="list")
	public ModelAndView list(int no, @RequestParam(defaultValue = "1") int curPage, HttpSession session){
		ModelAndView mav = new ModelAndView();

		int count = commentsService.count(no); // 댓글 갯수
		//Pager pager = new Pager(count, curPage);
		List<CommentsDTO> list = commentsService.list(no, 1, 99, session);
		//mav.setViewName("board/read");
		System.out.println("list=="+list);
		mav.setViewName("board/comments");
		mav.addObject("list", list);
		return mav;
	}

}
