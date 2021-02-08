<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Joinfoila회원가입</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/board.css">    
    <link rel="stylesheet" href="${path}/resources/css/registration.css">
</head>
<body>
<!-- HEADER -->
<jsp:include page="../common/menu.jsp"/>
<h1 class="blind">Joinfoila 회원가입 페이지</h1>
<!-- REGISTRATION -->
<!-- 회원가입 화면 -->
<section class="member_registration">
    <form action="registration" method="post">
        <div class="wrap">

            <div class="member_registration_contents">
                <h2 class="Heavy b">회원가입</h2>

                <div class="member_registration_box">
                    <label for="userid"><span class="member_registration_title">아이디</span></label>
                    <input type="text" name="id" id="userid" placeholder="이메일 주소를 입력해주세요">
                </div>
                <div class="member_registration_box">
                    <label for="userpw"><span class="member_registration_title">비밀번호</span></label>
                    <input type="password" name="pw" id="userpw" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="member_registration_box">
                    <label for="pw_confirm"><span class="member_registration_title">비밀번호 확인</span></label>
                    <input type="password" name="pw_confirm" id="pw_confirm" placeholder="비밀번호를 한 번 더 입력해주세요">
                </div>
                <div class="member_registration_box">
                    <label for="username"><span class="member_registration_title">이름</span></label>
                    <input type="text" name="name" id="username" placeholder="이름을 입력해주세요">
                </div>
                <div class="member_registration_box">
                    <label for="userbirth"><span class="member_registration_title">생년월일</span></label>
                    <input type="text" name="birth" id="userbirth" placeholder="생년월일을 선택해 주세요">
                </div>
                <div class="member_registration_box">
                     <label for="phone"><span class="member_registration_title">휴대폰</span></label>
                     <div class="usertel_box clearfix">
                         <input type="text" name="phone" id="usertel_certification" placeholder="'-'없이 숫자만 입력해주세요">
                         <button type="button" class="btn_gray">확인</button>
                     </div>
                </div>
                <div class="member_registration_box">
                     <label for="post"><span class="member_registration_title">주소</span></label>
                     <div class="post_box clearfix">
                         <input type="text" name="post" id="post">
                         <button type="button" class="btn_gray" onclick="execDaumPostcode()">우편번호</button>
                     </div>
                     <div class="addr_box">
	                     <input type="text" name="addr1" id="addr1" placeholder="주소"><label for="addr1" class="blind">기본주소</label>
						 <input type="text" name="addr2" id="addr2" placeholder="상세주소"><label for="addr2" class="blind">상세주소</label>
					</div>               
                </div>
                <div class="member_registration_box agree_all_align">
                    <label for="agree_all">
                        <input type="checkbox" name="agree_all" id="agree_all">
                        <span>모두 동의합니다</span>
                    </label>
                    <div class="agree_btn s">
                        <button type="button">이용약관 보기</button>
                        <button type="button">개인정보 처리방침보기</button>
                    </div>
                </div>
                <div class="member_registration_box agreement s">
                    <label for="agree">
                        <input type="checkbox" name="agree" value="1">
                        <span>이용약관 동의<strong>(필수)</strong></span>
                    </label>
                    <label for="agree">
                        <input type="checkbox" name="agree" value="2">
                        <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
                    </label>
                    <label for="agree">
                        <input type="checkbox" name="agree" value="3">
                        <span>개인정보 이용 동의<strong>(필수)</strong></span>
                    </label>
                    <label for="agree">
                        <input type="checkbox" name="agree" value="4">
                        <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
                    </label>
                </div>
                <div class="member_registration_box">
                    <button type="submit" class="btn join_us">회원가입</button>
                </div>
            </div>

        </div>
    </form>
</section>
<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 
    // 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				console.log(data);
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 도로명 주소 변수
                var extraAddr = ''; // 도로명 조합형 주소 변수

              	//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

             	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    			if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addr2").value = extraAddr;
            
	             } else {
	                 document.getElementById("addr2").value = '';
	             } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode;
                document.getElementById('addr1').value = addr;

             	// 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }

    // 동의 모두선택 / 해제
    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
		let agreeChk = document.querySelectorAll('input[name=agree]');
		for(let i = 0; i < agreeChk.length; i++){
			agreeChk[i].checked = e.target.checked;
		}
	});
</script>
</html>
