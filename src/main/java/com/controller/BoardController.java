package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.BoardDTO;
import com.dto.Pager;
import com.service.BoardService;
import com.service.MemberService;

@Controller // controller bean 생성
@RequestMapping("/board/*") // 공통적인 mapping
public class BoardController {

	@Inject //서비스 객체 주입
	BoardService boardService;
	@Inject
	MemberService mService;
	
	private static final Logger logger =
			LoggerFactory.getLogger(BoardController.class);
	
	// 게시판 목록 보기(페이징처리/검색 기능포함)
	@RequestMapping(value="list", method = RequestMethod.GET)
	public ModelAndView list(
			@RequestParam(defaultValue = "1") int curPage, // 전달 값이 없을 때의 기본 값 1로 설정(설정안할 시 null또는 400에러)
			@RequestParam(defaultValue = "all") String search_option, //select 옵션선택값
			@RequestParam(defaultValue ="") String keyword // input검색입력값
			) throws Exception {
		// 페이징 처리
		int count = boardService.countArticle(search_option, keyword); //레코드 갯수
		System.out.println(count);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin(); // 페이지 시작번호
		int end = pager.getPageEnd(); // 페이지 끝번호
		// 목록보기
		List<BoardDTO> list = boardService.listAll(start, end, search_option, keyword);
		System.out.println("list" + list);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list"); //이동할 페이지 지정
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		
		mav.addObject("map", map); //데이터 저장
		System.out.println("map===" + map);
		return mav; //페이지 이동 board/list
	}
	
	// 게시판 글쓰기
	@RequestMapping(value="write", method = RequestMethod.GET)
	public String write() {
		return "board/write";
	}
	
	// 수정버튼
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute BoardDTO boardDTO) {
		System.out.println("put방식 write==="+ boardDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/write"); // 포워딩
		mav.addObject("bDTO", boardDTO);
		return mav;
	}
	
	@PostMapping("delete")
	public String delete(@RequestParam int no) throws Exception {
		System.out.println("no" +  no);
		boardService.delete(no);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute BoardDTO boardDTO) throws Exception {
		System.out.println("put방식 write==="+ boardDTO);
		
		boardService.update(boardDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/list"); // 리다이렉트
		mav.addObject("msg", "success");
		return mav;
	}
	
	// 게시판 글저장
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardDTO boardDTO, HttpSession session) throws Exception{
		System.out.println("insert=======" + boardDTO);
		// 로그인 사용자의 아이디
		String id = (String)session.getAttribute("id");
		boardDTO.setCreater(id);
		boardDTO.setModifier(id);

		// 레코드가 저장
		boardService.insert(boardDTO);
		System.out.println("//////boardDTO 입력===" + boardDTO);
		//목록갱신(redirect:해줘야지 기존 데이터 유지)
		return "redirect:/board/list"; 
	}
	
	// 게시판 글보기
	@GetMapping(value="read")
	@PostMapping(value="read")
	public ModelAndView read(
			@RequestParam int curPage,
			@RequestParam int no, 
			@RequestParam String search_option,
			@RequestParam String keyword,
			HttpSession session
			) throws Exception {
		String userName = (String)session.getAttribute("userName");
		
		boardService.increaseViewcnt(no); // 조회수 증가처리
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/read");
		mav.addObject("curPage", curPage);
		mav.addObject("bDTO", boardService.read(no)); // 해당 게시판글 불러오기
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		mav.addObject("name", userName);
		System.out.println("id==="+userName);
		return mav; // board/read.jsp
	}
	


	
}
