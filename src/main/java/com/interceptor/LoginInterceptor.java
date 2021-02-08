package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션 객체 생성
		HttpSession session = request.getSession();
		// 세션 변수 검사
		if (session.getAttribute("id") == null) {
			
			if (isAjaxRequest(request)) {
				response.sendError(400);// ajax일 경우 400이라는 에러코드를 리턴
				return false;
			} else {
				// 세션이 없으면 로그인 페이지로 이동
				response.sendRedirect(request.getContextPath() + "/member/login?msg=nologin");
				return false; // 계속 진행하지 않음
			}

		} else {
			return true; // 계속진행함
		}
	}

	// isAjaxRequest 메소드는 
	// Ajax Header에 담겨있는 값을 판단하여 컨트롤러 호출이 Ajax인지 아닌지를 판단
	// session이 null이면서 Ajax 콜이 되었다면 로그인페이지로 이동
	private boolean isAjaxRequest(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
		if ("true".equals(header)) {
			return true;
		} else {
			return false;
		}
	}

}
