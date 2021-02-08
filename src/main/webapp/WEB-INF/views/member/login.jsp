<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인</title>
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<c:if test="${msg == 'error'}">
	<script>
		alert('아이디 또는 비밀번호가 일치 하지 않습니다');
	</script>
	</c:if>
</head>
<body>
<!-- HEADER -->
<jsp:include page="../common/menu.jsp"/>
<!-- LOGIN 화면 -->
    <section class="member_login">
        <form id="loginForm" method="post">
            <div class="wrap">

                <div class="member_login_contents">
                    <div class="login_title_box">
                        <h2 class="heavy">LOGIN</h2>
                        <p>조인폴리아에 오신 걸 환영합니다</p>
                    </div>
                    <div class="member_login_box">
                        <dl class="member_login_title">
                            <dt class="medium">회원 로그인</dt>
                            <dd class="s">
                                가입하신 조인폴리아 아이디와 비밀번호를 입력해주세요.<br>
                                비밀번호는 대소문자를 구분합니다.
                            </dd>
                        </dl>
                        <label for="userid">
                            <em class="blind">아이디</em>
                            <span class="login_box">
                                <input type="text" name="id" id="userid" placeholder="아이디를 입력하세요">
                            </span>
                        </label>
                        <label for="passwd">
                            <em class="blind">비밀번호</em>
                            <span class="login_box">
                                <input type="password" name="pw" id="passwd" placeholder="비밀번호를 입력하세요">
                            </span>
                        </label>
                        <button type="button" class="login_btn Heavy">로그인</button>
                        <button type="button" class="member_btn Heavy">회원가입</button>
                        <div class="login_detail clearfix s">
                            <p class="left"><input type="checkbox" name="id_save" id="id_save" class="id_save_chk" checked="checked"><label for="id_save">아이디 저장</label></p>
                            <p class="right"><a href="#a">아이디 | 비밀번호 찾기</a></p>
                        </div>
                        <div class="kakaologin clearfix">
                            <p class="left">카카오 로그인으로<br>간편하게 로그인이 가능합니다.</p>
                            <p class="right">
                                <a href="https://kauth.kakao.com/oauth/authorize?client_id=d017963aa17a2078032be0d1c2e5178f&redirect_uri=http://localhost:8080/joinfolia/member/loginKakao&response_type=code" 
                                			class="kakaologin_btn s">
                                    <span class="icon heavy">카카오 로그인</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </section>
    <!-- FOOTER -->
	<jsp:include page="../common/footer.jsp"/>
    
    <script>
    // 회원가입 버튼
    const memberBtn = document.querySelector('.member_btn');

    memberBtn.addEventListener("click", ()=> {
    	location.href = "${path}/member/registration";
    });
	
	// login 버튼
	const loginBtn = document.querySelector('.login_btn');
	const loginForm = document.getElementById('loginForm');
	
	loginBtn.addEventListener("click", ()=> {
		const userid = document.getElementById('userid');
		const passwd = document.getElementById('passwd');

		console.log(userid);
		console.log(passwd);
		if(userid.value == ""){
			alert("아이디를 입력하세요");
			userid.focus();
			return;
		}
		if(passwd.value == ""){
			alert("비밀번호를 입력하세요");
			passwd.focus();
			return;
		}

		loginForm.action = "${path}/member/loginCheck";
		loginForm.submit();
	});
    </script>
    
</body>
</html>