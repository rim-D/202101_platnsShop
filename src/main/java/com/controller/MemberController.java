package com.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.dto.RegistrationDTO;
import com.service.MemberService;


@Controller
@RequestMapping("/member/*") // 공통적인 mapping
public class MemberController {

	@Inject
	MemberService mService;
	
	// main화면
	@RequestMapping("/")
	public String main() {
		return "main";
	}

	// get방식 - 로그인 화면전환
	@RequestMapping(value="/login", method= RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	// post방식 - 로그인체크여부확인 후, 로그인
	@RequestMapping(value="loginCheck", method= RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute MemberDTO mDTO,
			HttpSession session) {
		System.out.println(mDTO);
		String name = mService.loginCheck(mDTO, session);
		System.out.println(name);
		ModelAndView mav = new ModelAndView();
		if(name != null) { // 로그인 성공시
			mav.setViewName("main");
			mav.addObject("msg", "success");
		} else { // 로그인 실패시
			mav.setViewName("member/login");
			mav.addObject("msg","error");
		}
		return mav;
	}
	
	// 카카오 로그인
	@RequestMapping(value = "/loginKakao")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		// Token 받아오기
		String accessToken = mService.getAccessToken(code);
		System.out.println("code===" + code);

		HashMap<String, Object> userInfo = mService.getUserInfo(accessToken);
		System.out.println("login Controller======== " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			session.setAttribute("userEmail", userInfo.get("email"));
		}
		return "main";
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("main"); // 이동할 페이지의 이름
		mav.addObject("msg","logout"); // 변수저장
		return mav;
	}
		
	// get방식 - 회원가입페이지이동
	@RequestMapping(value= "registration", method= RequestMethod.GET)
	public String registration() {
		return "member/registration";
	}
	// post방식 - 회원가입페이지이동
	@RequestMapping(value= "registration", method= RequestMethod.POST)
	public String registration(@ModelAttribute RegistrationDTO rDTO) throws Exception {
		System.out.println("rDTO==" + rDTO);
		mService.memberIns(rDTO);
		return "main";
	}
	
	// 마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession session){
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		MemberDTO mDTO = mService.mypage(id);
		System.out.println(mDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypage");
		mav.addObject("mDTO", mDTO);
		return mav;
	}
	
	// 마이페이지 수정
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO mDTO) {
		System.out.println(mDTO);
		mService.memberUpdate(mDTO);
		return "redirect:../member/mypage";
	}
}
